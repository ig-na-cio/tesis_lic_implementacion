Hasta que se hace memtest podemos usar Modelsim. Luego se requiere de un modulo de sdram que imite el chip del cual no disponemos asi que podemos ver como se veria el resto en Litex sim.



Para simualcion de la spisdcard


En sim.py>

``` Python
# ...
_io = [
    # Clk / Rst.
    ("sys_clk", 0, Pins(1)),
    ("sys_rst", 0, Pins(1)),

    # Serial.
    ("serial", 0,
        Subsignal("source_valid", Pins(1)),
        Subsignal("source_ready", Pins(1)),
        Subsignal("source_data",  Pins(8)),

        Subsignal("sink_valid", Pins(1)),
        Subsignal("sink_ready", Pins(1)),
        Subsignal("sink_data",  Pins(8)),
    ),
    # SPI SD Card
    ("spisdcard", 0,
        Subsignal("mosi",   Pins(1)),    # De GPIO 0
        Subsignal("miso",   Pins(1)),    # De GPIO 0
        Subsignal("cs_n",   Pins(1)),    # De GPIO 0
        Subsignal("clk",    Pins(1)),    # De GPIO 0
    ),
]

# ...
class SoCLinux(SoCCore):
# ...    
self.add_spi_sdcard()
# ...
```

Y despues

``` Bash
./sim.py --with-sdram -sdram-module=IS42516160
```

YY de ahi podemos cancelar el booteo y despues bootear con la sdcard

Debemos correr
``` Bash
python prepare_for_sim.py
```
Este script nos agrega delay en algunas asignaciones que sino generan bucle.


Es necesario agregar unas constantes para que el memtest no testee TODA la memoria, que tarda mucho
``` Python
    # En make.py
        # SoC constants ----------------------------------------------------------------------------
        for k, v in board.soc_constants.items():
            soc.add_constant(k, v)
        
        soc.add_constant("MEMTEST_BUS_SIZE", 128)
        soc.add_constant("MEMTEST_DATA_SIZE", 128)
        soc.add_constant("MEMTEST_ADDR_SIZE", 128)
        soc.add_constant("MEMTEST_BUS_DEBUG", 0)
        soc.add_constant("SDRAM_INIT_CYCLES", 10)
        soc.add_constant("SDRAM_REFRESH_CYCLES", 10)
```