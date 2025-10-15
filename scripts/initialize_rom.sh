set -e

ASSEMBLER_FILE="../quartus/initfiles/rom_init.S"
HEXADECIMAL_FILE="../quartus/initfiles/rom_init.hex"

riscv64-unknown-elf-as -march=rv32i -o "../quartus/initfiles/rom_init.o" $ASSEMBLER_FILE

riscv64-unknown-elf-ld -m elf32lriscv -Ttext=0x00000000 -o "../quartus/initfiles/rom_init.elf" "../quartus/initfiles/rom_init.o"

riscv64-unknown-elf-objcopy -O binary "../quartus/initfiles/rom_init.elf" "../quartus/initfiles/rom_init.bin"

hexdump -v -e '1/4 "%08x\n"' "../quartus/initfiles/rom_init.bin" > $HEXADECIMAL_FILE

python3 prepare_code.py

cp -r "../quartus/initfiles" "../quartus/simulation/modelsim/"
