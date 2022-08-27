module flag_register(

	input execute, C, N, Z, OV, clk,
	output reg [3:0] out
);	
	
	always @(posedge clk)
	begin
	
		if(C)
			begin
				out[0] = 1;
			end
		
		else
			begin
				out[0] = 0;
			end
		
		if(N)
			begin
				out[1] = 1;
			end
		
		else
			begin
				out[1] = 0;
			end
		
		if(Z)
			begin
				out[2] = 1;
			end
		
		else
			begin
				out[2] = 0;
			end
			
		if(OV)
			begin
				out[3] = 1;
			end
		
		else
			begin
				out[3] = 0;
			end
	end	
		
endmodule 