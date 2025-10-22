module spisdcard_monitor (
    input logic spisdcard_clk,
    input logic spisdcard_cs_n,
    input logic spisdcard_mosi
);
	
	 logic [7:0] byte_buffer = 0;
    logic [47:0] cmd_buffer = 0;  // Para comandos (48 bits)
    integer bit_count = 0;
	 integer byte_count = 0;
	 logic [7:0] cmd_byte = 0;
	 logic [5:0] cmd_index = 0;
	 logic [31:0] argument = 0;

    always_ff @(negedge spisdcard_clk or posedge spisdcard_cs_n) begin
        if (!spisdcard_cs_n) begin
			  // Se esta transmitiendo un byte
			  byte_buffer <= {byte_buffer[6:0], spisdcard_mosi};
           bit_count <= bit_count + 1;
		  end else begin
			  // Esta en reposo o se termino de mandar el byte
			  // Todavia no tenemos el comando completo
			  if (bit_count == 8) begin
					
					// Se ha mandado todo el comando de 6 bytes (48 bits)
					if (byte_count == 5) begin
						cmd_byte = byte_buffer; //cmd_buffer[47:40];
						cmd_index = byte_buffer[5:0];
                  argument = cmd_buffer[39:8];
						
						//if (byte_buffer[7:6] == 2'b01) begin // Comandos validos empiezan asi
							
							// Decodificamos el comando
							 if (cmd_index == 0)
								  $display("SPISDCARD: CMD0 Reset SD card");
							 else if (cmd_index == 17)
								  $display("SPISDCARD: CMD17 Read block at address 0x%08h", argument);
							 else if (cmd_index == 24)
								  $display("SPISDCARD: CMD24 Write block at address 0x%08h", argument);
							 else if (cmd_index == 41)
								  $display("SPISDCARD: ACMD41 Initialize SD card");
							 else if (cmd_index == 58)
								  $display("SPISDCARD: CMD58 Read OCR register");
							 else
								  $display("SPISDCARD: CMD%0d arg=0x%08h", cmd_index, argument);
						//end
						 
						byte_count <= 0;
						cmd_buffer <= 0;
					 
					end else begin // Acumulamos
						cmd_buffer <= {cmd_buffer[39:0], byte_buffer};
						byte_count <= byte_count + 1;
					end
				end
			  bit_count <= 0;
			  byte_buffer <= 0;
		  end
	 end
	 
endmodule