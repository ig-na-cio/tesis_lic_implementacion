# Archivos para Linux

Repositorio de la layer para la de0nano [aquí](https://github.com/ig-na-cio/meta-de0nano-litex).

## Generados por The Yocto Project

- `Image`: Imagen del Kernel

- `rootfs.cpio.gz`: Root filesystem comprimido

- `rv32.dtb`: Device tree

## Boot.json

- `boot.json`: Es el json que busca la BIOS en la SD Card para cargar los anteriores archivos. Estos se cargan en las direcciones, de la SDRAM, que indica el json.