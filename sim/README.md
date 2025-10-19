# Simulación del SoC

## Litex Sim
Litex provee de un framework para simular SoCs. Ésto nos sirve para ver como se ve la consola, e interactuar con ella con algunos comandos basicos que pueden interactuar con la memoria, por ejemplo. En el fondo, usa Verilator. Es muy útil para hacer algunas pruebas de periféricos. Sin embargo, nos encontramos con algunas limitaciones. Para simular, se usa la plataforma de clase `SimPlatform`. Ésta es muy básica y no representa a la de0nano. Aún así podemos agregarle periféricos en `sim.py`, como la SD Card, de la siguiente manera:

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
    ("spisdcard", 0, # Nuevo
        Subsignal("mosi",   Pins(1)),    # Nuevo
        Subsignal("miso",   Pins(1)),    # Nuevo
        Subsignal("cs_n",   Pins(1)),    # Nuevo
        Subsignal("clk",    Pins(1)),    # Nuevo
    ), # Nuevo
]

# ...
class SoCLinux(SoCCore):
# ...    
    self.add_spi_sdcard() # Nuevo
# ...
```

También, a través de argumentos, podemos modificar la presencia de SDRAM o no, el módelo, etc. En el proyecto de `linux-on-litex-vexriscv` se ejecuta así:

``` Bash
# Para ver los argumentos del comando

$ ./sim.py --h

# Para simular agregando la SDRAM de la de0nano

$ ./sim.py --with-sdram -sdram-module=IS42516160
```

Este simulador es rápido y nos da un pantallaso de como funcionarían las cosas. Sin embargo, se usan clases y objetos nuevos, no los generados para el SoC nuestro. Puede ser que exista una forma de usar el propio, pero como no la encontré, vamos a usar ModelSim.

## ModelSim

ModelSim simula nuestros archivos de HDL para nuestro dispositivo específico. Allí mismo podemos ver las ondas de las señales que nos permitirán debuggear la implementación. Haciendolo, nos surgen tres problemas: No reconoce los módulos de Quartus como `ALTDDIO_IN`, genera un bucle cerca de los 61000000ns al hacer memtest_access ejecutando la BIOS y no encuentra los archivos de inicialización de memorias. Para los dos primeros usamos los [scripts](../scripts/README.md).

El primero se resuelve pasando a minúscula la instanciación de esos módulos. Lo hacemos con:

``` Bash
$ python3 scripts/prepare_verilogs.py
```

El segundo se resuelve forzando delay en algunas asignaciones. Lo hacemos con:

``` Bash
$ python3 prepare_for_sim.py
```

El tercero se resuelve copiando los `*.init`, y reemplazando los presentes en esa carpeta, en quartus/simulation/modelsim

Por otro lado, cuando se ejecuta el `memtest` de la BIOS, se prueba *toda* la memoria. Por eso modificamos algunas constantes en la generación del SoC para que se reduzca el tiempo de simulación. Notese que esto probablemente modifica la BIOS y el contenido de la ROM, y que para cargar el diseño en la FPGA quizás querramos modificarlo para que en la de0nano se pruebe correctamente.

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

Con otro de los scripts, `initialize_rom.sh` que usa `prepare_code.py`, podemos reemplazar el contenido de la ROM, la BIOS de Litex, por código propio. Este debe compilarse y colocarse en la ROM de una manera muy especifica, por eso hicimos esos scripts que lo facilitan. Su funcionamiento está explicado en [scripts](../scripts/README.md). Recuerdese que la BIOS inicializa los controladores de la SDRAM y periféricos, sin su ejecución quizás no se puede acceder a ellos.

## Archivos

- `rtl/sdram.sv`: Modelo que representa algunas de las funciones del chip físico de la SDRAM.

- `rtl/first/`: Archivos correspondientes a la [generación](../gen/README.md) del primer método.

- `testbenches/de0nano_tb.sv`: Instanciación del SoC y simulación de algunos periféricos.

- `testbenches/first/`: Archivos correspondientes a la [generación](../gen/README.md) del primer método.

> NOTA: Para poder simular no olvidar crear el testbench desde `Asignmentes/Settings`, para que se cargue el diseño.