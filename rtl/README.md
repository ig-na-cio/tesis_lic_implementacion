# Archivos de Hardware Description Language

Todos los archivos fueron generados por Litex.

- `de0nano.v`: SoC completo para la de0nano. El archivo en este repositorio está como es generado por Litex. Puede ser necesario modificar algunas cosas para simularlo. Ver [scripts](../scripts/README.md).

- `Ram_1w_1rs_Intel.v`: Módulo auxiliar.

- `VexRiscvLitexSmpCluster... .v`: Descripción del procesador VexRiscv-SMP.

## Extras

- `doc/`: Documentación de los periféricos generada por Litex.

- `first/`: Implementación del primer método explicado en [generación](../gen/README.md).

- `csr.json`: Mapa de memoria y registros CSR en formato json.

- `csr.csv`: Mapa de memoria y registros CSR en formato csv.

- `bios_objdump.S`: Objdump del binario `bios.bin` que Litex carga en la ROM. Es el código que inicializa los periféricos y busca la manera de bootear.

- `bios_sim_objdump.S`: Igual que el anterior pero sobre una BIOS reducida en pruebas para poder simular.