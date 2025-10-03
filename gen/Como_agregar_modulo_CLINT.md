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
