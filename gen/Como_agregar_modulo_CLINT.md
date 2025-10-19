# Proceso de agregar un mòdulo

Recordamos la estructura definida en el README y agregamos cores/

```
- litex/
    - litex/
        - soc/
            - integration/
                - soc.py
                - soc_core.py
            - cores/
```

y 

```
- litex-boards/
    - litex_boards/
        - platforms/
            - terasic_de0nano.py (1)
        - targets/
            - build/
            - terasic_de0nano.py (2)
```

## CLINT

Para agregar un modulo de CLINT debemos:

1. Crear el archivo clint.py en cores/.

2. Implementar la clase CLINT heredada de LiteXModule. Ver uart.py de ejemplo.

3. Importar el módulo a soc.py e implementar el método `add_clint`. Puede hacerse directamente en terasic_de0nano_propio.py sobre la clase BaseSoC

4. Llamar al método en el BaseSoc de terasic_de0nano_propio.py

### Implementación del módulo

La clase debe tener atributos, que en este caso serán los tres registros que vimos y la señal de interrupción. Algunas notas:


- Los registros pueden instanciarse como CSR() y usar CSRStatus(), pero se accederían como CSR y no dirección de memoria habitual.

- El procesador tiene definidas lineas de interrupción en los parámetros. Podemos añadir llamando a `self.irq.add("clint")`.

- La irq puede instanciarse como Signal().

- No usa pines, es interno al FPGA Core. No modificamos terasic_de0nano_propio_pl.py

- Verificar que se agregue al `mem_map` si son `Signal`s, o `csr_map` si son `CSR`s.

Algunos cosas de uart.py que nos pueden guiar:

Además de lo mencionado antes:
``` Python
# {...}
class UART(LiteXModule, UARTInterface):
    def __init__(self, phy=None,
            tx_fifo_depth = 16,
            rx_fifo_depth = 16,
            rx_fifo_rx_we = False,
            phy_cd        = "sys"):
    self._rxtx    = CSR(8) # RX/TX Data.
    self._txfull  = CSRStatus(description="TX FIFO Full.")
    self._rxempty = CSRStatus(description="RX FIFO Empty.")

    self.ev    = EventManager()
    self.ev.tx = EventSourceLevel()
    self.ev.rx = EventSourceLevel()
    self.ev.finalize()

    self._txempty = CSRStatus(description="TX FIFO Empty.")
    self._rxfull  = CSRStatus(description="RX FIFO Full.")

    # {...}

    self.comb += [

        # {...}

        # Status.
        self._rxempty.status.eq(~rx_fifo.source.valid),
        self._rxfull.status.eq(~rx_fifo.sink.ready),

        # IRQ (When FIFO becomes non-empty).
        self.ev.rx.trigger.eq(rx_fifo.source.valid)
    ]

# {...}

```

- Con CSRStorage() creamos un registro que puede ser escrito por el software. Accedido en la implementación nuestra como name.storage.

- Con CSRStatus() creamos uno que puede ser leído por el software. Accedido en la implementación nuestra como name.status.


La implementacion del modulo puede verse en [CLINT](clint.py). Luego en terasic_de0nano_propio.py agregamos:

``` Python
    # {...}

        # CLINT
        self.add_clint()

    def add_clint(self):
        # Instanciamos el modulo
        self.clint = CLINT(sys_clk_freq=self.sys_clk_freq)
        # Con esto indicamos que tiene registros CSRs
        # para que se agregue al csr_map
        self.add_csr("clint")
        # Agregamos a las irq que van al CPU
        self.comb += self.cpu.software_irq.eq(self.clint.irq_msip)
        self.comb += self.cpu.timer_irq.eq(self.clint.irq_mtip)
        # Se agregan solas al interruption_map con
        self.irq.add("software_irq")
        self.irq.add("timer_irq")

    # {...}
```

Y luego nos aseguramos que se conecten con el CPU:

``` Verilog
module VexRiscv (
  input  wire [31:0]   externalResetVector,
  input  wire          timerInterrupt,
  input  wire          softwareInterrupt,
  // {...}
  }
```

y en la instanciación del módulo en el SoC:

```
VexRiscv VexRiscv(
	// Inputs.
	.clk                    (sys_clk),
	.dBusWishbone_ACK       (main_basesoc_dbus_ack),
	.dBusWishbone_DAT_MISO  (main_basesoc_dbus_dat_r),
	.dBusWishbone_ERR       (main_basesoc_dbus_err),
	.externalInterruptArray (main_basesoc_interrupt),
	.externalResetVector    (main_basesoc_vexriscv),
	.iBusWishbone_ACK       (main_basesoc_ibus_ack),
	.iBusWishbone_DAT_MISO  (main_basesoc_ibus_dat_r),
	.iBusWishbone_ERR       (main_basesoc_ibus_err),
	.reset                  ((sys_rst | main_basesoc_reset)),
	.softwareInterrupt      (main_basesoc_software_irq),
	.timerInterrupt         (main_basesoc_timer_irq0),
    // {...}
    }
```

Para esto último debemos modificar el archivo core.py de vexriscv, localizado en en litex/litex/soc/cores/cpu/vexriscv.

``` Python
    def __init__(self, platform, variant="standard", with_timer=False):
        
        # {...}
        
        # Agregado por CLINT {
        self.timer_irq = Signal()
        self.software_irq = Signal()
        # Agregado por CLINT }
        # # #

        # CPU Instance.
        self.cpu_params = dict(
            i_clk                    = ClockSignal("sys"),
            i_reset                  = ResetSignal("sys") | self.reset,

            i_externalInterruptArray = self.interrupt,
            # Agregado por CLINT {
            i_timerInterrupt         = self.timer_irq,
            i_softwareInterrupt      = self.software_irq,
            # Agregado por CLINT }

        # {...}
```

#### Problema

Resulta que si los registros internos son CSR, no lo mapea al MMIO como queriamos. Hay que hacerlos registros accesibles por bus. Ésto trae los siguientes cambios:

``` Python
        # CLINT
        self.add_clint()

    def add_clint(self):
        # Instanciamos el modulo
        self.clint = CLINT(sys_clk_freq=self.sys_clk_freq)
        # Con esto indicamos que tiene registros MMIO
        self.bus.add_slave(name   = "clint",
                           slave  = self.clint.bus,
                           region = SoCRegion(self.mem_map["clint"], 0x10000)) # El que definimos en mem map.
        # Agregamos a las irq que van al CPU
        self.comb += self.cpu.software_irq.eq(self.clint.irq_msip)
        self.comb += self.cpu.timer_irq.eq(self.clint.irq_mtip)

```

y en [CLINT](clint.py) todo básicamente.

## PLIC

Proceso muy similar, ver [PLIC](plic.py).