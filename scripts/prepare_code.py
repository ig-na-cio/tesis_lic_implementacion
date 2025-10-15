rom_inits = ["../quartus/initfiles/terasic_de0nano_propio_pl_sram_grain0.init",
             "../quartus/initfiles/terasic_de0nano_propio_pl_sram_grain1.init",
             "../quartus/initfiles/terasic_de0nano_propio_pl_sram_grain2.init",
             "../quartus/initfiles/terasic_de0nano_propio_pl_sram_grain3.init"]
hex_file = "../quartus/initfiles/rom_init.hex"

# Si el hex es 
# 00f00293
# 40000313
# 00532023
# 0000006f

# guardamos
# grain0 93
# grain1 02
# grain2 f0
# grain3 00

# y asi con cada instruccion


init_files = [open(f, "w") for f in rom_inits]

with open(hex_file, "r") as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        
        if len(line) != 8:
            raise ValueError(f"Hay una instruccion de tamano incorrecto: {line}")

        # Little-endian: byte menos significativo al grain0, el mas al grain3
        bytes = [line[6:8], line[4:6], line[2:4], line[0:2]]


        for i, byte in enumerate(bytes):
            init_files[i].write(byte + "\n")

for g in init_files:
    g.close()
