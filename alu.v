module alu(
	input [7:0] A,
	input [7:0] B,
	input [3:0] op_sel,
	output [7:0] adda_result,
	output [7:0] subz_result,
	output [7:0] anda_result,
	output [7:0] ora_result,
	output [7:0] mova_result,
	output [7:0] shftla_result,
	output [7:0] shftra_result,
	output [7:0] incr_result,
	output [7:0] decr_result,
	output [7:0] result,
	output adda_carryout, subz_carryout, incr_carryout, decr_carryout,
	output C, Z, N, OV,
	output A_sign, B_sign
);	
	
	//assign signs of A and B
	or(A_sign, A[7], 1'b0);
	or(B_sign, B[7], 1'b0);
	
	//A + B
	wire adda_cout1, adda_cout2, adda_cout3, adda_cout4, adda_cout5, adda_cout6, adda_cout7;
	one_bit_adder(A[0], B[0], 1'b0, adda_result[0], adda_cout1);
	one_bit_adder(A[1], B[1], adda_cout1, adda_result[1], adda_cout2);
	one_bit_adder(A[2], B[2], adda_cout2, adda_result[2], adda_cout3);
	one_bit_adder(A[3], B[3], adda_cout3, adda_result[3], adda_cout4);
	one_bit_adder(A[4], B[4], adda_cout4, adda_result[4], adda_cout5);
	one_bit_adder(A[5], B[5], adda_cout5, adda_result[5], adda_cout6);
	one_bit_adder(A[6], B[6], adda_cout6, adda_result[6], adda_cout7);
	one_bit_adder(A[7], B[7], adda_cout7, adda_result[7], adda_carryout);
	
	//A - B
	wire subz_cout1, subz_cout2, subz_cout3, subz_cout4, subz_cout5, subz_cout6, subz_cout7;
	one_bit_substractor(A[0], B[0], 1'b0, subz_result[0], subz_cout1);
	one_bit_substractor(A[1], B[1], subz_cout1, subz_result[1], subz_cout2);
	one_bit_substractor(A[2], B[2], subz_cout2, subz_result[2], subz_cout3);
	one_bit_substractor(A[3], B[3], subz_cout3, subz_result[3], subz_cout4);
	one_bit_substractor(A[4], B[4], subz_cout4, subz_result[4], subz_cout5);
	one_bit_substractor(A[5], B[5], subz_cout5, subz_result[5], subz_cout6);
	one_bit_substractor(A[6], B[6], subz_cout6, subz_result[6], subz_cout7);
	one_bit_substractor(A[7], B[7], subz_cout7, subz_result[7], subz_carryout);
	
	//A & B
	and(anda_result[0], A[0], B[0]);
	and(anda_result[1], A[1], B[1]);
	and(anda_result[2], A[2], B[2]);
	and(anda_result[3], A[3], B[3]);
	and(anda_result[4], A[4], B[4]);
	and(anda_result[5], A[5], B[5]);
	and(anda_result[6], A[6], B[6]);
	and(anda_result[7], A[7], B[7]);
	
	
	//A | B
	or(ora_result[0], A[0], B[0]);
	or(ora_result[1], A[1], B[1]);
	or(ora_result[2], A[2], B[2]);
	or(ora_result[3], A[3], B[3]);
	or(ora_result[4], A[4], B[4]);
	or(ora_result[5], A[5], B[5]);
	or(ora_result[6], A[6], B[6]);
	or(ora_result[7], A[7], B[7]);
	
	
	//result <= A
	or(mova_result[0], A[0], 1'b0);
	or(mova_result[1], A[1], 1'b0);
	or(mova_result[2], A[2], 1'b0);
	or(mova_result[3], A[3], 1'b0);
	or(mova_result[4], A[4], 1'b0);
	or(mova_result[5], A[5], 1'b0);
	or(mova_result[6], A[6], 1'b0);
	or(mova_result[7], A[7], 1'b0);
	
	//A<<1
	or(shftla_result[0], 1'b0, 1'b0);
	or(shftla_result[1], A[0], 1'b0);
	or(shftla_result[2], A[1], 1'b0);
	or(shftla_result[3], A[2], 1'b0);
	or(shftla_result[4], A[3], 1'b0);
	or(shftla_result[5], A[4], 1'b0);
	or(shftla_result[6], A[5], 1'b0);
	or(shftla_result[7], A[6], 1'b0);
	
	
	//A>>1
	or(shftra_result[0], A[1], 1'b0);
	or(shftra_result[1], A[2], 1'b0);
	or(shftra_result[2], A[3], 1'b0);
	or(shftra_result[3], A[4], 1'b0);
	or(shftra_result[4], A[5], 1'b0);
	or(shftra_result[5], A[6], 1'b0);
	or(shftra_result[6], A[7], 1'b0);
	or(shftra_result[7], 1'b0, 1'b0);
	
	//B + 1
	wire incr_cout1, incr_cout2, incr_cout3, incr_cout4, incr_cout5, incr_cout6, incr_cout7;
	one_bit_adder(B[0], 1'b1, 1'b0, incr_result[0], incr_cout1);
	one_bit_adder(B[1], 1'b0, incr_cout1, incr_result[1], incr_cout2);
	one_bit_adder(B[2], 1'b0, incr_cout2, incr_result[2], incr_cout3);
	one_bit_adder(B[3], 1'b0, incr_cout3, incr_result[3], incr_cout4);
	one_bit_adder(B[4], 1'b0, incr_cout4, incr_result[4], incr_cout5);
	one_bit_adder(B[5], 1'b0, incr_cout5, incr_result[5], incr_cout6);
	one_bit_adder(B[6], 1'b0, incr_cout6, incr_result[6], incr_cout7);
	one_bit_adder(B[7], 1'b0, incr_cout7, incr_result[7], incr_carryout);
	
	//B - 1
	wire decr_cout1, decr_cout2, decr_cout3, decr_cout4, decr_cout5, decr_cout6, decr_cout7;
	one_bit_substractor(B[0], 1'b1, 1'b0, decr_result[0], decr_cout1);
	one_bit_substractor(B[1], 1'b0, decr_cout1, decr_result[1], decr_cout2);
	one_bit_substractor(B[2], 1'b0, decr_cout2, decr_result[2], decr_cout3);
	one_bit_substractor(B[3], 1'b0, decr_cout3, decr_result[3], decr_cout4);
	one_bit_substractor(B[4], 1'b0, decr_cout4, decr_result[4], decr_cout5);
	one_bit_substractor(B[5], 1'b0, decr_cout5, decr_result[5], decr_cout6);
	one_bit_substractor(B[6], 1'b0, decr_cout6, decr_result[6], decr_cout7);
	one_bit_substractor(B[7], 1'b0, decr_cout7, decr_result[7], decr_carryout);
	
	//call MUX module
	MUX(A[7], B[7], adda_result, subz_result, anda_result, ora_result, mova_result, 
	shftla_result, shftra_result, incr_result, decr_result, op_sel, adda_carrout, subz_carryout, incr_carryout, decr_carryout,
	result, C, Z, N, OV);
	
endmodule

module one_bit_adder(
	input x,
	input y,
	input cin,
	output o,
	output cout
);
	wire t1, t2, t3;
	xor(t1, x, y);
	xor(o, t1, cin);
	and(t2, x, y);
	and(t3, t1, cin);
	or(cout, t2, t3);
endmodule

module one_bit_substractor(
	input x,
	input y,
	input cin,
	output o,
	output cout
);
    wire sw1, sw2, sw3;
	 xor(sw1, x, y);
	 and(sw2, ~x, y);
	 and(sw3, ~sw1, cin);
	 or(cout, sw2, sw3);
	 xor(o, cin, sw1);	 
endmodule

module MUX(
	input signA, signB,
	input [7:0] adda_result,
	input [7:0] subz_result,
	input [7:0] anda_result,
	input [7:0] ora_result,
	input [7:0] mova_result,
	input [7:0] shftla_result,
	input [7:0] shftra_result,
	input [7:0] incr_result,
	input [7:0] decr_result,
	input [3:0] op_sel,
	input coutAdda, coutSubz, coutIncr, coutDecr,
	output [7:0] result,
	output C, Z, N, OV
);
	
	//0th element
	call_mux(op_sel, adda_result[0], subz_result[0], anda_result[0], ora_result[0], 
	mova_result[0], shftla_result[0], shftra_result[0], incr_result[0], decr_result[0], result[0]);
		
	//1st element
	call_mux(op_sel, adda_result[1], subz_result[1], anda_result[1], ora_result[1], 
	mova_result[1], shftla_result[1], shftra_result[1], incr_result[1], decr_result[1], result[1]);
	
	//2nd element
	call_mux(op_sel, adda_result[2], subz_result[2], anda_result[2], ora_result[2], 
	mova_result[2], shftla_result[2], shftra_result[2], incr_result[2], decr_result[2], result[2]);

	//3rd element
	call_mux(op_sel, adda_result[3], subz_result[3], anda_result[3], ora_result[3], 
	mova_result[3], shftla_result[3], shftra_result[3], incr_result[3], decr_result[3], result[3]);
	
	//4th element
	call_mux(op_sel, adda_result[4], subz_result[4], anda_result[4], ora_result[4], 
	mova_result[4], shftla_result[4], shftra_result[4], incr_result[4], decr_result[4], result[4]);
	
	//5th element
	call_mux(op_sel, adda_result[5], subz_result[5], anda_result[5], ora_result[5], 
	mova_result[5], shftla_result[5], shftra_result[5], incr_result[5], decr_result[5], result[5]);
	
	//6th element
	call_mux(op_sel, adda_result[6], subz_result[6], anda_result[6], ora_result[6], 
	mova_result[6], shftla_result[6], shftra_result[6], incr_result[6], decr_result[6], result[6]);
	
	//7th element
	call_mux(op_sel, adda_result[7], subz_result[7], anda_result[7], ora_result[7], 
	mova_result[7], shftla_result[7], shftra_result[7], incr_result[7], decr_result[7], result[7]);
	
	//carryout flag
	call_mux(op_sel, coutAdda, coutSubz, 0, 0, 0, 0, 0, coutIncr, coutDecr, C);
	
	//negative flag
	or(N, result[7], 1'b0);
	
	//zero flag
	wire zf1, zf2, zf3, zf4, zf5, zf6;
	or(zf1, result[0], result[1]);
	or(zf2, result[2], result[3]);
	or(zf3, result[4], result[5]);
	or(zf4, result[6], result[7]);
	or(zf5, zf1, zf2);
	or(zf6, zf3, zf4);
	and(Z, ~zf5, ~zf6);

	//OV flag
	wire OV1, OV2;
	xor(OV1, signA, signB);
	xor(OV2, signA, N);
	and(OV, ~OV1, OV2);

endmodule

module two_to_one_multiplexer(
    input s,
    input x,
    input y,
    output o
);
    wire t1, t2;
    and(t1, s, y);
    and(t2, ~s, x);
    or(o, t1, t2);
endmodule

module call_mux(
	input [3:0]operation_Selector,
	result1, result2, result3, result4, result5, result6, result7, result8, result9,
	output result_bit

);
	wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;
	two_to_one_multiplexer(operation_Selector[0], result1, result2, w1);
	two_to_one_multiplexer(operation_Selector[0], result3, result4, w2);
	two_to_one_multiplexer(operation_Selector[1], w1, w2, w9);
	
	two_to_one_multiplexer(operation_Selector[0], result5, result6, w3);
	two_to_one_multiplexer(operation_Selector[0], result7, result8, w4);
	two_to_one_multiplexer(operation_Selector[1], w3, w4, w10);
	
	two_to_one_multiplexer(operation_Selector[0], result9, 0, w5);
	two_to_one_multiplexer(operation_Selector[0], 0, 0, w6);
	two_to_one_multiplexer(operation_Selector[1], w5, w6, w11);
	
	two_to_one_multiplexer(operation_Selector[0], 0, 0, w7);
	two_to_one_multiplexer(operation_Selector[0], 0, 0, w8);
	two_to_one_multiplexer(operation_Selector[1], w7, w8, w12);
	
	
	two_to_one_multiplexer(operation_Selector[2], w9, w10, w13);
	two_to_one_multiplexer(operation_Selector[2], w11, w12, w14);
	two_to_one_multiplexer(operation_Selector[3], w13, w14, result_bit);

endmodule
