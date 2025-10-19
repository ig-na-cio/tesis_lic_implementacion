# Generación del SoC con Litex

En este directorio almacenaremos los archivos de Litex modificados que se usan para generar el SoC. Primero algunos pasos para usar Litex.

1. Instalar [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)

2. Instalar [Litex](https://github.com/enjoy-digital/litex/wiki/Installation) y hacer el setup.

3. Agregar el PATH de Quartus a bashrc.

4. Listo

## Primer método
En realidad, se terminó usando el segundo, pero la información y formas de este método son muy valiosas para aprender la herramienta, por eso lo dejamos.

Algunos archivos que tendremos que ver:
```
- litex/
    - litex/
        - soc/
            - integration/
                - soc.py
                - soc_core.py
```
- soc.py: Entre otras cosas, todos los métodos de la clase para agregar periféricos y módulos.
- soc_core.py: Entre otras cosas, todos los argumentos y parámetros de la clase SoCCore (y algunos métodos)

```
- pythondata-cpu-vexriscv/
    - pythondata_cpu_vexriscv/verilog/
        - src/main/scala/vexriscv/
            - GenCoreDefault.scala 
```
- pythondata-cpu-vexriscv/: Particular de nuestra elección de CPU. Contiene instrucciones en un README.md para instalar el CPU de Vexriscv.
- GenCoreDefault.scala: Contiene los parámetros y plugins para generar el procesador.

```
- litex-boards/
    - litex_boards/
        - platforms/
            - terasic_de0nano.py (1)
        - targets/
            - build/
            - terasic_de0nano.py (2)
```
- (1): Pines, señales y módulos de la de0nano.
- (2): Clase BaseSoC(SoCCore) y _CRG(LiteXModule), donde vamos a efectivamente definir los parámetros y módulos que nosotros querramos. Quizás en una copia del original.
- build/: Lugar donde se generaran los archivos de Quartus, Verilog e inicialización.


Entonces ahora los pasos son:

1. Instalamos el CPU

2. Modificamos el CPU si queremos en GenCoreDefault.scala

3. Escribimos nuestro propio targets/terasic_de0nano_propio.py

4. Agregamos la configuracion de los pines de ser necesario en platforms/terasic_de0nano_propio_pl.py

5. Ejecutamos el target

``` Bash
$ ./terasic_de0nano_propio.py --build

# o si queremos cargarlo en la FPGA conectada

$ ./terasic_de0nano_propio.py --build --load
```

6. Tenemos el proyecto de Quartus y archivos HDL y de inicialización listos en targets/build. Puede ser necesario ejecutar algunos scripts de este repositorio, leer los otros README.

### Módulos propios
Esta implementación, tanto del SoC como del procesador, no contienen PLIC ni CLINT. Debemos agregarlos nostros. Esta tarea nos ayuda a entender aún más la herramienta. Para ver el proceso dirigirse a la [descripciòn](Como_agregar_modulo_CLINT.md) y archivos de mòdulos [CLINT](clint.py) y [PLIC](plic.md). Existen contribuidores en la comunidad de Litex que han hecho versiones mejores y màs completas. La idea de la nuestra era que fueran simples y ejemplificadoras.


Esta implementación de SoC fallaba en ejecutar la BIOS. Por eso, usamos el segundo método.

## Segundo método
### Linux on VexRiscv Litex
Este es un proyecto que la comunidad ha creado a raìz de Litex. Integra la implementaciòn de VexRiscv-SMP (una versiòn de VexRiscv con posibilidad de muchos cores, CLINT, PLIC y màs), con el SoC habitual para la de0nano. Introducimos algunas modificaciones.

### Modicaciones
#### SPI SD Card
Por defecto, ya que no contiene el puerto integrado, se asume que la de0nano no tiene la capacidad para manejar una SD Card por SPI. Sin embargo, nostros vamos a conectar a los GPIO un lector, así que lo agregamos manualmente. Primero en platforms/terasic_de0nano.py (o el propio pero tenemos que cambiar _imports_).

``` Python
# SPI SD Card
    ("spisdcard", 0,
        Subsignal("mosi",   Pins("D3")),    # De GPIO 0
        Subsignal("miso",   Pins("C3")),    # De GPIO 0
        Subsignal("cs_n",   Pins("A2")),    # De GPIO 0
        Subsignal("clk",    Pins("A3")),    # De GPIO 0
        IOStandard("3.3-V LVTTL")
    ),
    
```

Luego, en boards.py, lo agregamos como una capacidad del SoC para que el make.py le agregue el módulo.

``` Python
Board.__init__(self, terasic_de0nano.BaseSoC, soc_capabilities={
            # Communication
            "serial",
            "spisdcard" #nuevo
        })
```

Por último, debemos reducir alguna configuración para que el diseño entre en la FPGA. Elegimos `l2_size`.
        

``` Python
soc_kwargs = {
        "l2_size" : 256, # Use Wishbone and L2 for memory accesses.
        "integrated_sram_size": 0x1000, # Power of 2 so Quartus infers it properly.
    }
    
```

La SD Card no es accedida por direcciones de memoria como la SDRAM. Se modifican registros CSR (miso, mosi, cs) para poder interactuar con ella.

> NOTA1: Agregar soporte para la SD Card duplicó los registros y unidades lógicas en uso del diseño.

> NOTA2: Recordar que para simular, debemos ejecutar algunos scripts. Referirse a los otros README.
