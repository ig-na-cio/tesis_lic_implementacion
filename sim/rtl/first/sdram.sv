module sdram ( //Basico
    input  wire  [12:0] a,
    input  wire  [1:0]  ba,
    input  wire         cas_n,
    input  wire         cke,
    input  wire         clock,
    input  wire         cs_n,
    input  wire  [1:0]  dm,
    inout  wire [15:0]  dq,
    input  wire         ras_n,
    input  wire         we_n
);

    reg [15:0] mem [0:8192];
	 
    reg [15:0] dq_out;
    wire write_cycle;
    wire read_cycle;
    	
    // Inicializacion, no se si hace falta
    integer i;
    initial begin
        for (i = 0; i < 8192; i = i + 1)
            mem[i] = 16'h0F0F;
    end


    // Tipo de operacion
    assign write_cycle = (~cs_n && ~we_n);  // SDRAM Write
    assign read_cycle  = (~cs_n && we_n);  // SDRAM Read

    // Solo manejar dq en lectura
    assign dq = (read_cycle) ? dq_out : 16'bz;

    always @(posedge clock) begin
        if (write_cycle) begin
            mem[a] <= dq;
        end
        else if (read_cycle) begin
            dq_out <= mem[a];
        end
    end

endmodule

