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
        self.msip      = CSRStorage(1, description="Software interrupt")
        # mtimecmp: Valor de comparacion del timer
        self.mtimecmp  = CSRStorage(32, description="Timer compare value")
        # mtime: Valor del contador
        self.mtime     = CSRStatus(32, description="Timer")

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
        self.counter = Signal(32) # Contador auxiliar
        # x.eq(y): Asignar a x el valor y
        # sync significa que se ejecuta en subida de cada clock.
        self.sync   += self.counter.eq(self.counter + 1)
        # comb es siempre
        self.comb   += self.mtime.status.eq(self.counter)

        # Interrupciones
        self.comb   += self.ev.msip.trigger.eq(self.msip.storage)
        self.comb   += self.irq_msip.eq(self.ev.msip.trigger)

        self.comb   += self.ev.mtip.trigger.eq(self.counter >= self.mtimecmp.storage)
        self.comb   += self.irq_mtip.eq(self.ev.mtip.trigger)


