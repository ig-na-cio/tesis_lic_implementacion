# Aparentemente para ModelSim no se pueden usar los modulos como
# ALTDDIO_IN, deben usarse en minuscula, como otros parametros.
# Este Script modifica todas las ocurrencias necesarias en los 
# .v para que puedan ser simulables.

soc_file = "../rtl/de0nano.v"


# Agreguese toda aquella que resulte en un error de simulacion
# por no encontrarse el modulo en mayuscula

palabras = ["ALTDDIO_IN", "ALTDDIO_OUT", "DFFE", "DFF", "ALTPLL",
            "BANDWIDTH_TYPE", "CLK0_DIVIDE_BY", "CLK0_DUTY_CYCLE",
            "CLK0_MULTIPLY_BY", "CLK0_PHASE_SHIFT",
            "CLK1_DIVIDE_BY", "CLK1_DUTY_CYCLE", "CLK1_MULTIPLY_BY", "CLK1_PHASE_SHIFT",
            "COMPENSATE_CLOCK", "INCLK0_INPUT_FREQUENCY", "OPERATION_MODE",
            "ARESET", "EXTCLKENA", "CLKENA", "FBIN", "INCLK", "PFDENA", "PLLENA",
            "CLK", "LOCKED", "WIDTH"
           ]

with open(soc_file, 'r') as f:
    texto = f.read()

import re
for p in palabras:
    texto = re.sub(rf'{p}', p.lower(), texto)

with open(soc_file, 'w') as f:
    f.write(texto)
