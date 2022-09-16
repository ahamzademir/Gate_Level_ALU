module instruction_register(
	input clk, D,
	input [13:0] instruction,
	output reg [1:0] inst_code,
	output reg [2:0] op_code,
	output reg [8:0] IR_output
);
	always@(posedge clk) 
		begin
			if(D) begin
				IR_output = instruction[8:0];
				op_code = instruction[11:9];
				inst_code = instruction[13:12];
			end
		end
endmodule	