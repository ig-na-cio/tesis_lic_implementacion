# Scripts

- `prepare_verilogs.py`: El proyecto sintetiza correctamente. En cambio, a la hora de simular no reconoce algunos módulos provistos por Quartus como `ALTDDIO_IN` y parámetros. Si se convierten a minúscula, si. Este script hace eso sobre `de0nano.v`. Verificar el path dentro del archivo.

- `prepare_for_sim.py`: En el momento de simular el `memtest_access` de la BIOS, ocurre un bucle cerca de los 61000000ns. Este script agrega delay a algunas simulaciones para que esto no ocurra. 

- `prepare_code.v`: Ayuda a inicializar la ROM o BootROM distribuyendo un archivo en hexadecimal en los grains de esta memoria. El funcionamiento del contenido de estas memorias está explicado en un comentario en el script y en el [proyecto](../quartus/README.md). Verificar paths.

- `initialize_rom.sh`: Dado un archivo en Assembler RISC-V, lo compila y guarda en la memoria elegida. Verificar paths.