from migen import *
from migen.genlib.record import Record
from migen.genlib.cdc import MultiReg

from litex.gen import *
from litex.gen.genlib.misc import WaitTimer

from litex.soc.interconnect.csr import *
from litex.soc.interconnect.csr_eventmanager import *
from litex.soc.interconnect import wishbone
from litex.soc.interconnect import stream

class CLINT(LiteXModule):
    def __init__(self, sys_clk_freq):
        # msip: Genera interrupciones de software cuando habilitado
        self.msip      = Signal(1) #, description="Software interrupt")
        # mtimecmp: Valor de comparacion del timer
        self.mtimecmp  = Signal(64) #, description="Timer compare value")
        # mtime: Valor del contador
        self.mtime     = Signal(64) #, description="Timer")

        self.ev      = EventManager()
        self.ev.msip = EventSourceLevel(description="Software interrupt")
        self.ev.mtip = EventSourceLevel(description="Timer interrupt")
        self.ev.finalize()

        self.irq_msip = Signal()
        self.irq_mtip = Signal()

        # msip
        # Se escribe desde software

        # mtimecmp
        # Se escribe desde software

        # mtime
        self.counter = Signal(64) # Contador auxiliar
        # x.eq(y): Asignar a x el valor y
        # sync significa que se ejecuta en subida de cada clock.
        self.sync   += self.counter.eq(self.counter + 1)
        # comb es siempre
        self.comb   += self.mtime.eq(self.counter)

        # Interrupciones
        self.comb   += self.ev.msip.trigger.eq(self.msip)
        self.comb   += self.irq_msip.eq(self.ev.msip.trigger)

        self.comb   += self.ev.mtip.trigger.eq(self.mtime >= self.mtimecmp)
        self.comb   += self.irq_mtip.eq(self.ev.mtip.trigger)


        # Y ahora la parte del bus y MMIO
        # Seria nuestro "adaptador"
        self.bus = wishbone.Interface(data_width=32, adr_width=16) # 16 para decodificar bien

        # self.bus.cyc: se esta usando el bus
        # self.bus.stb: strobe activo, se quiere comunicar
        # self.bus.we: write enable
        # El >> 2 es para manejar correctamente el tamano de las palabras
        
        self.sync += [
            If(self.bus.cyc & self.bus.stb & ~self.bus.we, # Es una lectura
                Case(self.bus.adr, {
                    0x0000 >> 2: self.bus.dat_r.eq(self.msip),
                    0x4000 >> 2: self.bus.dat_r.eq(self.mtimecmp[0:32]), # dividimos porque es rv32
                    0x4004 >> 2: self.bus.dat_r.eq(self.mtimecmp[32:64]),
                    0xBFF8 >> 2: self.bus.dat_r.eq(self.mtime[0:32]), # idem
                    0xBFFC >> 2: self.bus.dat_r.eq(self.mtime[32:64]),
                })
            )
        ]

        self.sync += [
            If(self.bus.cyc & self.bus.stb & self.bus.we, # Es una escritura
                Case(self.bus.adr, {
                    0x0000 >> 2: self.msip.eq(self.bus.dat_w[0]),
                    0x4000 >> 2: self.mtimecmp.eq(self.bus.dat_w), # dividimos porque es rv32
                    0x4004 >> 2: self.mtimecmp.eq(self.bus.dat_w),
                })
            )
        ]


