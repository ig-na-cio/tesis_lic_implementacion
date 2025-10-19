# Proyecto del SoC en Quartus

En este directorio contenemos los archivos para cargar el proyecto en Quartus. Archivos de simulación de Modelsim, de configuración de Quartus, de asignaciones de pines, etc. Algunas menciones:

- `first/`: Proyecto anterior a base de Litex. No logramos que funcione. Corresponde al primer método de [generación](../gen/README.md).

- `assignments_defaults.qdf`: Variables generales del proyecto de Quartus.

- `de0nano_mem.init`: Contenido de inicialización de la memoria. Puede estar codificado.

- `de0nano_rom_grainN.init`: Con N en {0,1,2,3}. Contiene el código contenido en la ROM ubicada en 0x00000000. Se divide en 4 grains de la siguiente manera: El byte menos signicativo de una dirección está ubicado en el grain 0, los siguientes en el 1, y asi. Por ejemplo, la palabra con dirección 0x00000000 y valor 0x12345678 tiene el valor 78 en la linea 0 del grain 0.

- `de0nano_sram_grainN.init`: Con N en {0,1,2,3}. Contiene el código contenido en la SRAM. En nuestro caso, no la inicializamos. Funciona igual al de la ROM.

- `sim_initfiles/*.init`: Archivos de inicialización de la ROM para poder simular en tiempo razonable. Deben reemplazarse por los otros si quieren usarse.

- `de0nano.qpf`: Archivo que reconoce Quartus para abrir el proyecto.

- `de0nano.qsf`: Cofiguraciones de paths a los archivos del proyecto y asignaciones de pines. Fundamental que los paths estén correctamente definidos.

- `de0nano.sdc`: Configuración del clock.


> NOTA1: Para simular, debemos copiar los `*.init` en el directorio simulation/modelsim.

> NOTA2: Los archivos `*.init` son por defecto aquellos para la FPGA física, no para simulación.