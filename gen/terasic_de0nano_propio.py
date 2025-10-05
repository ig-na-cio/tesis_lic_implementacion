#!/usr/bin/env python3

#
# This file is part of LiteX-Boards.
#
# Copyright (c) 2015-2020 Florent Kermarrec <florent@enjoy-digital.fr>
# SPDX-License-Identifier: BSD-2-Clause

# Build/Use:
# ./terasic_de0nano.py --uart-name=jtag_uart --build --load
# litex_term --jtag-config ../prog/openocd_usb_blaster.cfg jtag

from migen import *
from migen.genlib.resetsync import AsyncResetSynchronizer

from litex.gen import *

from litex.build.io import DDROutput

# Archivo donde se definen los pines y especificaciones de la FPGA
from litex_boards.platforms import terasic_de0nano_propio_pl

from litex.soc.cores.clock import CycloneIVPLL
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores.led import LedChaser
from litex.soc.integration.soc import *
# IS42S16160 es el modelo de la SDRAM
from litedram.modules import IS42S16160
# Controlador para la SDRAM
from litedram.phy import GENSDRPHY, HalfRateGENSDRPHY

# Modulos propios
from litex.soc.cores.clint import CLINT

# CRG ----------------------------------------------------------------------------------------------
# Clock and Reset Generator: Genera los clocks para todo el SoC

class _CRG(LiteXModule):
    def __init__(self, platform, sys_clk_freq, sdram_rate="1:1"):
        self.rst    = Signal()
        self.cd_sys = ClockDomain()
        if sdram_rate == "1:2":
            self.cd_sys2x    = ClockDomain()
            self.cd_sys2x_ps = ClockDomain()
        else:
            self.cd_sys_ps = ClockDomain()

        # # #

        # Clk / Rst
        clk50 = platform.request("clk50")

        # PLL
        self.pll = pll = CycloneIVPLL(speedgrade="-6")
        self.comb += pll.reset.eq(self.rst)
        pll.register_clkin(clk50, 50e6)
        pll.create_clkout(self.cd_sys,    sys_clk_freq)
        if sdram_rate == "1:2":
            pll.create_clkout(self.cd_sys2x,    2*sys_clk_freq)
            pll.create_clkout(self.cd_sys2x_ps, 2*sys_clk_freq, phase=180)  # Idealy 90° but needs to be increased.
        else:
            pll.create_clkout(self.cd_sys_ps, sys_clk_freq, phase=90)

        # SDRAM clock
        sdram_clk = ClockSignal("sys2x_ps" if sdram_rate == "1:2" else "sys_ps")
        self.specials += DDROutput(1, 0, platform.request("sdram_clock"), sdram_clk)

# BaseSoC ------------------------------------------------------------------------------------------
# Definicion del SoC, parametros y perifericos.

class BaseSoC(SoCCore):
    def __init__(self, sys_clk_freq=50e6, sdram_rate="1:1",
                 with_led_chaser=True,
                 with_spi_sdcard=False,
                  **kwargs):
        platform = terasic_de0nano_propio_pl.Platform()

        # CRG --------------------------------------------------------------------------------------
        self.crg = _CRG(platform, sys_clk_freq, sdram_rate=sdram_rate)

        # SoCCore ----------------------------------------------------------------------------------
        SoCCore.__init__(self, platform, sys_clk_freq, ident="LiteX SoC on DE0-Nano", **kwargs)

        # SDR SDRAM --------------------------------------------------------------------------------
        # Si no definimos una RAM integrada, se usa la SDRAM
        if not self.integrated_main_ram_size:
            sdrphy_cls = HalfRateGENSDRPHY if sdram_rate == "1:2" else GENSDRPHY
            self.sdrphy = sdrphy_cls(platform.request("sdram"), sys_clk_freq)
            self.add_sdram("sdram",
                phy           = self.sdrphy,
                module        = IS42S16160(sys_clk_freq, sdram_rate),
                l2_cache_size = kwargs.get("l2_size", 8192)
            )

        # Leds -------------------------------------------------------------------------------------
        if with_led_chaser:
            self.leds = LedChaser(
                pads         = platform.request_all("user_led"),
                sys_clk_freq = sys_clk_freq)

        # BootROM
        # Por parametros

        # SD Card via SPI
        if with_spi_sdcard:
            self.add_spi_sdcard("spisdcard", spi_clk_freq=400e3)

        # UART
        # Por parametros

        # CLINT
        self.add_clint()

    def add_clint(self):
        # Instanciamos el modulo
        self.clint = CLINT(sys_clk_freq=self.sys_clk_freq)
        # Con esto indicamos que tiene registros CSRs
        # para que se agregue al csr_map
        self.add_csr("clint")
        # Agregamos a las irq que van al CPU
        self.comb += self.cpu.software_irq.eq(self.clint.irq_msip)
        self.comb += self.cpu.timer_irq.eq(self.clint.irq_mtip)
        # Se agregan solas al interruption_map con
        self.irq.add("software_irq")
        self.irq.add("timer_irq")
        

# Build --------------------------------------------------------------------------------------------

def main():
    from litex.build.parser import LiteXArgumentParser
    parser = LiteXArgumentParser(platform=terasic_de0nano_propio_pl.Platform, description="LiteX SoC on DE0-Nano.")
    parser.add_target_argument("--sys-clk-freq", default=50e6, type=float, help="System clock frequency.")
    parser.add_target_argument("--sdram-rate",   default="1:1",            help="SDRAM Rate (1:1 Full Rate or 1:2 Half Rate).")
    args = parser.parse_args()

    # Parametros que no queremos por defecto de soc_core.py
    soc_args = parser.soc_argdict
    soc_args.pop("integrated_rom_size", None)
    soc_args.pop("integrated_rom_init", None)
    soc_args.pop("mem_map", None)
    soc_args.pop("integrated_main_ram_size", None)
    soc_args.pop("integrated_main_ram_init", None)
    soc_args.pop("with_uart", None)
    soc_args.pop("uart_name", None)
    soc_args.pop("uart_baudrate", None)
    soc_args.pop("uart_fifo_depth", None)
    soc_args.pop("uart_pads", None)
    soc_args.pop("uart_with_dynamic_baudrate", None)
    soc_args.pop("uart_rx_fifo_rx_we", None)

    soc = BaseSoC(
        sys_clk_freq = args.sys_clk_freq,
        sdram_rate   = args.sdram_rate,
        
        # Map
        mem_map = {
            "rom":      0x00000000,
            "sram":     0x01000000,
            "main_ram": 0x40000000,
            "spisdcard":0x80000000,
        },

        # Bootrom
        integrated_rom_size = 0x400, # En bytes (1KB) Puedo poner 1024 tambien
        integrated_rom_init = None, #init_bootrom.hex,

        # SDRAM
        integrated_main_ram_size = 0, # Definimos que no haya memoria integrada...
        integrated_main_ram_init = [], # ... para que se use la sdram

        # SD Card via SPI
        with_spi_sdcard = True,

        # UART
        # Estan como por defecto
        with_uart                = True,
        uart_name                = "serial",
        uart_baudrate            = 115200,
        uart_fifo_depth          = 16,
        uart_pads                = None,
        uart_with_dynamic_baudrate = False,
        uart_rx_fifo_rx_we       = False,

        **soc_args # **parser.soc_argdict
    )
    builder = Builder(soc, **parser.builder_argdict)
    if args.build:
        builder.build(**parser.toolchain_argdict)

    if args.load:
        prog = soc.platform.create_programmer()
        prog.load_bitstream(builder.get_bitstream_filename(mode="sram"))

if __name__ == "__main__":
    main()