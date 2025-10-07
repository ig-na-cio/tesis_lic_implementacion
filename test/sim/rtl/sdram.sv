module sdram (
	input wire   [12:0] a,
   input wire    [1:0] ba,
   input wire          cas_n,
   input wire          cke,
   input wire          clock,
   input wire          cs_n,
   input wire    [1:0] dm,
   inout wire   [15:0] dq,
   input wire          ras_n,
   input wire          we_n
	);
	
	reg [15:0] mem [0:1024];
	
	always @(posedge clock) begin
		if (we_n == 1) begin
			mem[a] <= dq;
		end
			dq <= mem[a];
	end

endmodule