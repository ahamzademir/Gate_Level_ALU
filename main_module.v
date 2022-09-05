module main_module(
	input clk, increase,
	output [2:0] fde_out,
	output [3:0] flag_out,
	output [6:0] seg1, seg2, seg3,
	output led
);
	wire [13:0] IR_output, rom_data;
	wire [7:0] register_output, alu_result, ram_out, address_buss;
	wire clk_out;
	wire rw, cs;
	reg [7:0] wire_mux, wire_addr, wire_alu_a;
	
	
	//control unit
	control_unit(clk_out, IR_output[9:8], fde_out[0], fde_out[1], fde_out[2], rw, cs);
	
	//IR
	instruction_register(0, clk_out, rom_data, IR_output);
	
	//ALU
	alu(IR_output[7:0], register_output[7:0], IR_output[13:10], alu_result[7:0], C, Z, N, OV);
	
	//acc
	accumulator(fde_out[2], clk_out, alu_result[7:0], register_output[7:0]);
	
	//flag register
	flag_register(fde_out[2], C, N, Z, OV, clk_out, flag_out);
	
	//7-segment driver
	seven_segment(clk_out, register_output[7:0], seg1, seg2, seg3);
	
	//counter
	counter(clk_out, fde_out[0], address_buss);
	
	//clock_divider
	clock_divider(clk, increase, led, clk_out);
	
	//rom
	rom(address_buss, rom_data);
	
	//ram
	ram(clk_out, 0, rw, cs, register_output[7:0], wire_addr, ram_out);
	
	always @ (IR_output[13:12], wire_alu_a, ram_out, wire_mux)
	begin
		case(IR_output[13:12])
			2'b00: wire_alu_a = ram_out;
			2'b01: wire_alu_a = wire_mux;
		endcase
	end
	
	always @ (IR_output[13:12], wire_addr, wire_mux, IR_output[7:0])
	begin
		case(IR_output[13:12])
			2'b00: wire_addr = IR_output[7:0];
			2'b01: wire_mux = IR_output[7:0];
		endcase
	end
	
endmodule	