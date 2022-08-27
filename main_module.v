module main_module(
	input clk,
	input [11:0] data_in,
	output [7:0] address_buss,
	output [2:0] fde_out,
	output [3:0] flag_out,
	output [6:0] seg1, seg2, seg3 
);
	wire [11:0] IR_output;
	wire [7:0] register_output, alu_result;
	
	//control unit
	control_unit(clk, fde_out[0], fde_out[1], fde_out[2]);
	
	//IR
	instruction_register(0, clk, data_in[11:0], IR_output[11:0]);
	
	//ALU
	alu(IR_output[7:0], register_output[7:0], IR_output[11:8],
	alu_result[7:0], C, Z, N, OV);
	
	//acc
	accumulator(fde_out[2], clk, alu_result[7:0], register_output[7:0]);
	
	//flag register
	flag_register(fde_out[2], C, N, Z, OV, clk, flag_out);
	
	//7-segment driver
	seven_segment(clk, register_output[7:0], seg1, seg2, seg3);
	
	//counter
	counter(clk, fde_out[0], address_buss);

endmodule