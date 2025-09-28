module de0nano_tb();
	
	logic a,b,c;
	logic y;
	
	de0nano dut(a,b,c,y);
	
	initial begin
		a = 0; b = 0; c = 1; #10;
		a = 1; b = 1; #10;
		c = 0; #10;
	end

endmodule