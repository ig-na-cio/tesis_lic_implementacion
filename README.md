# RISC-V SoC con `linux-on-litex-vexriscv` en de0nano

En este proyecto generamos un SoC con un procesador VexRiscv con el framework de Litex y el proyecto de Litex `linux-on-litex-vexriscv` para la FPGA de0nano y verificamos su funcionamiento con Quartus y ModelSim.

## Directorios

- [`gen/`](/gen): Archivos modificados de Litex para la generación del SoC y el software como la BIOS.

- [`quartus/`](/quartus): Archivos necesarios para abrir el proyecto en Quartus y sintetizar el diseño.

- [`rtl/`](/rtl): Archivos de HDL y documentación generados por Litex.

- [`scripts/`](/scripts): Scripts nuestros para poder simular en ModelSim y compilar código propio para el SoC.

- [`sim/`](/sim): Archivos de HDL de módulos de simulación y testbenches.

Cada uno de estos directorios tiene un README detallado explicando su contenido y funcionamiento.