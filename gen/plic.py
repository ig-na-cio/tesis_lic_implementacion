from migen import *
from migen.genlib.record import Record
from migen.genlib.cdc import MultiReg

from litex.gen import *
from litex.gen.genlib.misc import WaitTimer

from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *
from litex.soc.interconnect import wishbone
from litex.soc.interconnect import stream

class PLIC(LiteXModule):
    def __init__(self, sys_clk_freq, irqs):
        n_irqs = len(irqs)
        self.irqs_in = Signal(n_irqs) # Las que recibimos de perifericos
        self.irq_out = Signal() # La unica que mandamos al CPU

        for i in range(n_irqs):
            self.comb += self.irqs_in[i].eq(irqs[i])
        
        max_priorities_bits = 1
        
        # Registros
        # Para lo siguiente se asume prioridad 0 o 1, de un solo bit.
        self.priority  = Signal(n_irqs) # priority[0] para irq0, y asi...
        self.pending   = Signal(n_irqs) # idem
        self.enable    = Signal(n_irqs)
        self.threshold = Signal(max_priorities_bits)
        self.claim     = Signal(n_irqs)

        
        # Acutalizamos registro de pending
        self.sync += [
            If(self.irqs_in & self.enable, # Esto entra si la irq[i] esta interrumpiendo y enabled
                # Lo siguiente conserva las que estaban y agrega la que paso la guarda anterior
                self.pending.eq(self.pending | (self.irqs_in & self.enable))
            )
        ]

        # Buscamos al prioritario
        chosen_irq_id = Signal(n_irqs) # Sobra cantidad de bits pero bueno
        found = Signal()

        self.comb += chosen_irq_id.eq(0)
        self.comb += found.eq(0)

        # No es el mejor selector de prioridades pero bueno
        for i in range(n_irqs):
            self.comb += [
                # Lo siguiente asume max priority = 1
                If((self.pending[i]) & (self.priority[i] > self.threshold),
                    chosen_irq_id.eq(i),
                    found.eq(1)
                    )
            ]

        # Avisamos al CPU
        self.comb += self.claim.eq(chosen_irq_id)
        self.irq_out.eq(found) # Creo que no se traba, revisar

        # Ahora el bus, como el CLINT

        self.bus = wishbone.Interface(data_width=32, adr_width=16)

        self.sync += [
            If(self.bus.cyc & self.bus.stb & ~self.bus.we, # Es una lectura
                Case(self.bus.adr, {
                    # Esto calcula el offset
                    **{(i * 4) >> 2: self.bus.dat_r.eq(self.priority[i]) for i in range(n_irqs)},
                    0x1000 >> 2: self.bus.dat_r.eq(self.pending),
                    0x2000 >> 2: self.bus.dat_r.eq(self.enable),
                    0x200000 >> 2: self.bus.dat_r.eq(self.threshold),
                    0x200004 >> 2: self.bus.dat_r.eq(self.claim),
                })
            )
        ]

        self.sync += [
            If(self.bus.cyc & self.bus.stb & self.bus.we, # Es una escritura
                Case(self.bus.adr, {
                    **{(i * 4) >> 2: self.priority[i].eq(self.bus.dat_w[:max_priorities_bits]) for i in range(n_irqs)},
                    0x2000 >> 2: self.enable.eq(self.bus.dat_w[:n_irqs]),
                    0x200000 >> 2: self.threshold.eq(self.bus.dat_w[:max_priorities_bits]),
                    0x200004 >> 2: If(self.bus.dat_w < n_irqs, # Aseguramos que se quiera escribir algo valido
                                      self.pending.eq(self.pending & ~(1 << self.bus.dat_w)) # Marcamos el atendido 
                                   )
                })
            )
        ]

        # Conviene agregar un acknoledge para que no se trabe el bus.
        self.sync += [
            self.bus.ack.eq(0),
            If(self.bus.cyc & self.bus.stb, 
                self.bus.ack.eq(1)
            )
        ]
