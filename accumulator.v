module accumulator(
	input execute,
	input clk,
	input [7:0] input_value,
	output reg [7:0] output_value
);	
	
	always @(posedge clk)
	begin

		if (execute) 
		begin
			output_value = input_value;
		end
		
	end	
		
endmodule 