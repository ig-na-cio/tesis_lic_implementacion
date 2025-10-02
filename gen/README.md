En este directorio almacenaremos el archivo de Litex que se usa para generar el SoC. Primero algunos pasos para usar Litex.

1. Instalar [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain)

2. Instalar [Litex](https://github.com/enjoy-digital/litex/wiki/Installation) y hacer el setup.

3. Agregar el PATH de Quartus a bashrc.

4. Listo

> **_NOTA:_** Ademas del setup que indica el instructivo puede hacer falta ejecutar el siguiente comando:
>```
>$ ./litex_setup.py init install
>```

Algunos archivos que tendremos que ver:
```
- litex/
    - litex/
        - soc/
            - integration/
                - soc.py
                - soc_core.py
```
- soc.py: Entre otras cosas, todos los metodos de la clase para agregar perifericos y modulos.
- soc_core.py: Entre otras cosas, todos los argumentos y parametros de la clase SoCCore (y algunos metodos)

```
- pythondata-cpu-vexriscv/
```
- pythondata-cpu-vexriscv/: Particular de nuestra eleccion de CPU. Contiene instrucciones en un README.md para instalar el CPU de Vexriscv.

```
- litex-boards/
    - litex_boards/
        - platforms/
            - terasic_de0nano.py (1)
        - targets/
            - build/
            - terasic_de0nano.py (2)
```
- (1): Pines, senales y modulos de la de0nano.
- (2): Clase BaseSoC(SoCCore) y _CRG(LiteXModule), donde vamos a efectivamente definir los parametros y modulos que nosotros querramos. Quizas en una copia del original.
- build/: Lugar donde se generaran los archivos de Quartus, Verilog e inicializacion.


Entonces ahora los pasos son:

1. Instalamos el CPU

2. Escribimos nuestro propio targets/terasic_de0nano.py

3. Lo ejecutamos

```
$ ./terasic_de0nano.py --build
```

4. Tenemos el proyecto de Quartus y archivos HDL y de inicializacion listos.