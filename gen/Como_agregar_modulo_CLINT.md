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

Para agregar un modulo de CLINT debemos:

1. Crear el archivo clint.py a cores/.

2. Implementar la clase CLINT heredada de LiteXModule. Ver uart.py de ejemplo.

3. Importar el modulo a soc.py e implementar el metodo add_clint. Capaz puede hacerse directamente en terasic_de0nano_propio.py sobre la clase BaseSoC

4. Llamar al metodo en el BaseSoc de terasic_de0nano_propio.py

## Implementacion del modulo CLINT

La clase debe tener atributos, que en este caso seran los tres registros que vimos y la senal de interrupcion.


> NOTA: Los registros conviene instanciarlos como CSR() y usar CSRStatus(), no hace falta conectarlos al bus.

> NOTA2: El procesador tiene definidas lineas de interrupcion en los parametros. Podemos anadir llamando a self.irq.add("clint")

> NOTA3: La irq puede instanciarse como Signal()

> NOTA4: No usa pines, es interno al FPGA Core. No modificamos terasic_de0nano_propio_pl.py

> NOTA5: Creo que Litex lo agrega al interrupt_map y csr_map. En cuanto al mem_map no hace falta porque no es accedido por bus.

### Algunos cosas de uart.py que nos pueden guiar

Ademas de lo mencionado antes:
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
- Con CSRStorage() creamos un registro que puede ser escrito por el software. Accedido en la implementacion nuestra como name.storage

- Con CSRStatus() creamos uno que puede ser leido por el software. Accedido en la implementacion nuestra como name.status


## Modificacion

La implementacion del modulo puede verse en clint.py
Luego en terasic_de0nano_propio.py agregamos:

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
```
module VexRiscv (
  input  wire [31:0]   externalResetVector,
  input  wire          timerInterrupt,
  input  wire          softwareInterrupt,
  // {...}
  }
```
y en la instanciacion del modulo en el SoC
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

Para esto debemos modificar el archivo core.py de vexriscv, localizado en en litex/litex/soc/cores/cpu/vexriscv

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

# Problema!!

Resulta que si los registros internos son CSR, no lo mapea al MMIO como queriamos. Hay que haceros registros accesibles por bus. Esto trae los siguientes cambios:


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

y

``` Python
class CLINT(LiteXModule):
    def __init__(self, sys_clk_freq):
        # msip: Genera interrupciones de software cuando habilitado
        self.msip      = Signal(1) #, description="Software interrupt")
        # mtimecmp: Valor de comparacion del timer
        self.mtimecmp  = Signal(64) #, description="Timer compare value")
        # mtime: Valor del contador
        self.mtime     = Signal(64) #, description="Timer")

        self.ev      = EventManager()
        self.ev.msip = EventSourceLevel(description="Software interrupt")
        self.ev.mtip = EventSourceLevel(description="Timer interrupt")
        self.ev.finalize()

        self.irq_msip = Signal()
        self.irq_mtip = Signal()

        # msip
        # Se escribe desde software

        # mtimecmp
        # Se escribe desde software

        # mtime
        self.counter = Signal(64) # Contador auxiliar
        # x.eq(y): Asignar a x el valor y
        # sync significa que se ejecuta en subida de cada clock.
        self.sync   += self.counter.eq(self.counter + 1)
        # comb es siempre
        self.comb   += self.mtime.eq(self.counter)

        # Interrupciones
        self.comb   += self.ev.msip.trigger.eq(self.msip)
        self.comb   += self.irq_msip.eq(self.ev.msip.trigger)

        self.comb   += self.ev.mtip.trigger.eq(self.mtime >= self.mtimecmp)
        self.comb   += self.irq_mtip.eq(self.ev.mtip.trigger)


        # Y ahora la parte del bus y MMIO
        # Seria nuestro "adaptador"
        self.bus = wishbone.Interface(data_width=32, adr_width=16) # 16 para decodificar bien

        # self.bus.cyc: se esta usando el bus
        # self.bus.stb: strobe activo, se quiere comunicar
        # self.bus.we: write enable
        # El >> 2 es para manejar correctamente el tamano de las palabras
        
        self.sync += [
            If(self.bus.cyc & self.bus.stb & ~self.bus.we, # Es una lectura
                Case(self.bus.adr, {
                    0x0000 >> 2: self.bus.dat_r.eq(self.msip),
                    0x4000 >> 2: self.bus.dat_r.eq(self.mtimecmp[0:32]), # dividimos porque es rv32
                    0x4004 >> 2: self.bus.dat_r.eq(self.mtimecmp[32:64]),
                    0xBFF8 >> 2: self.bus.dat_r.eq(self.mtime[0:32]), # idem
                    0xBFFC >> 2: self.bus.dat_r.eq(self.mtime[32:64]),
                })
            )
        ]

        self.sync += [
            If(self.bus.cyc & self.bus.stb & self.bus.we, # Es una escritura
                Case(self.bus.adr, {
                    0x0000 >> 2: self.msip.eq(self.bus.dat_w[0]),
                    0x4000 >> 2: self.mtimecmp.eq(self.bus.dat_w), # dividimos porque es rv32
                    0x4004 >> 2: self.mtimecmp.eq(self.bus.dat_w),
                })
            )
        ]
```
