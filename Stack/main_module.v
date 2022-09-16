module main_module (
	input clk,
	input [16:0] instruction,
	output F, D, Stack_EN, SP_n, SP_p, RW,
	output [13:0] PC_output
);    
	wire [1:0]inst_code; 
	wire [3:0]op_code;
	wire [1:0] selector;
	reg [13:0] mux_out;
	wire [13:0] incr_output, incr_output_2, IR_output;
	wire [13:0] stack_output;
	
	//inst. reg.
	instruction_register(clk, D, instruction[13:0], inst_code, op_code, IR_output);
	
	//selection logic
	selection_logic(inst_code, op_code, instruction[16:14], selector);
	
	//program counter
	program_counter(clk, F, mux_out, PC_output);
	
	//control_unit
	control_unit(clk, inst_code, op_code, F, D, Stack_EN, SP_n, SP_p, RW);
	
	//incrementer
	incrementer(PC_output, incr_output);
	incrementer(incr_output, incr_output_2);
	
	//STACK
	stack(clk, Stack_EN, SP_n, SP_p, RW, incr_output, stack_output);
	
	//Multipexer
	always @ (selector, incr_output, IR_output, incr_output_2, stack_output)
	begin
		case(selector)
			2'b00: mux_out <= incr_output;
			2'b01: mux_out <= IR_output;
			2'b10: mux_out <= incr_output_2;
			2'b11: mux_out <= stack_output;
		endcase
	end
endmodule