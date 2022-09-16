module stack (
	input clk, Stack_EN, SP_n, SP_p, RW,
	input [13:0] incr_output,
	output reg [13:0] stack_output	
);
	reg [1:0] ptr;
	reg [13:0] stack [0:3];

	always @(posedge clk) begin
		if (SP_p)
			ptr <= ptr + 1;
		else if (SP_n)
			ptr <= ptr - 1;
	end

	always @(posedge clk) begin
		if (SP_p || SP_n) begin
			if(SP_p)
				stack[ptr] <= incr_output;

			stack_output <= stack[ptr - 1];
		end
	end

endmodule