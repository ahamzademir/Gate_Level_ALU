module program_counter( 
	input clk, F,
	input [8:0] mux_out,
	output reg [8:0] counter_out
);

	always@(posedge clk) 
	begin
		if(F)
			counter_out <= mux_out + 1;
		else 
			counter_out <= counter_out;
	end
endmodule