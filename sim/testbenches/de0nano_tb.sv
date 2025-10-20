`timescale 1ns / 1ps

module de0nano_tb();
	
	logic clk50 = 0;
	logic reset = 1;
	wire   [12:0] sdram_a;
   wire    [1:0] sdram_ba;
   wire          sdram_cas_n;
   wire          sdram_cke;
   wire          sdram_clock;
   wire          sdram_cs_n;
   wire    [1:0] sdram_dm;
   wire   [15:0] sdram_dq;
   wire          sdram_ras_n;
   wire          sdram_we_n;
	logic serial_rx = 1;
	wire serial_tx;
	logic spisdcard_miso = 1;
	wire spisdcard_mosi;
	wire spisdcard_clk;
	wire spisdcard_cs_n;
	
	de0nano dut (
		.clk50(clk50),
		.sdram_a(sdram_a),
      .sdram_ba(sdram_ba),
      .sdram_cas_n(sdram_cas_n),
      .sdram_cke(sdram_cke),
      .sdram_clock(sdram_clock),
      .sdram_cs_n(sdram_cs_n),
      .sdram_dm(sdram_dm),
      .sdram_dq(sdram_dq),
      .sdram_ras_n(sdram_ras_n),
      .sdram_we_n(sdram_we_n),
      .serial_rx(serial_rx),
      .serial_tx(serial_tx),
      .spisdcard_clk(spisdcard_clk),
      .spisdcard_cs_n(spisdcard_cs_n),
      .spisdcard_miso(spisdcard_miso),
      .spisdcard_mosi(spisdcard_mosi),
      .user_led0(),
      .user_led1(),
      .user_led2(),
      .user_led3(),
      .user_led4(),
      .user_led5(),
      .user_led6(),
      .user_led7()
   );
	
	// Modelo basico que simula algunas funcionalidades de
   //	la SDRAM IS42S16160
	sdram #(.PRINT(0))
   SDRAM (
		.a(sdram_a),
      .ba(sdram_ba),
      .cas_n(sdram_cas_n),
      .cke(sdram_cke),
      .clock(sdram_clock),
      .cs_n(sdram_cs_n),
      .dm(sdram_dm),
      .dq(sdram_dq),
      .ras_n(sdram_ras_n),
      .we_n(sdram_we_n)
   );
	
	// Decodificador de las señales transmitidas por
	// UART por parte del SoC
	// No implementa la transmicion hacia el SoC
   uart_monitor #(
    .CLK_FREQUENCY(50_000_000),
    .BAUD_RATE(115200)
	) UART_MONITOR (
    .clk(clk50),
    .uart_tx(serial_tx)
	);
	
   always #10 clk50 = ~clk50;
   
   initial begin
      #10 reset = 0;
   end

endmodule