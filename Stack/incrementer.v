module incrementer(
	input [8:0] incr_input, 
	output reg [8:0] incr_output
);
	always @ (incr_output, incr_input) 
	begin
		incr_output <= incr_input + 9'b000000001;
	end
	
endmodule