module control_unit(
	input clk,
	input [1:0] inst_code,
	input [3:0] op_code, 
	output reg F, D, Stack_EN, SP_n, SP_p, RW
);

	reg [2:0] controlUnit;
	always @(posedge clk)
	begin
		case (controlUnit)
			3'b001: controlUnit <= 3'b010;//call
			3'b010: controlUnit <= 3'b011;//return
			3'b011: controlUnit <= 3'b100;//fetch
			default: controlUnit <= 3'b001;//decode
	  endcase
	end
    always @(*)
    begin
       case (controlUnit)//decode state -- call state -- return state -- fetch state
        3'b001: begin
				Stack_EN <= 1'b0;
				SP_n <= 1'b0;
				SP_p <= 1'b0; 
				RW <= 1'b0;
            F <= 1'b0;
            D <= 1'b1;
        end
        3'b010: begin
            Stack_EN <= 1'b1;
				SP_n <= 1'b0;
				SP_p <= 1'b1; 
				RW <= 1'b1;
            F <= 1'b0;
            D <= 1'b0;
        end
        3'b011: begin
            Stack_EN <= 1'b1;
				SP_n <= 1'b1;
				SP_p <= 1'b0; 
				RW <= 1'b0;
            F <= 1'b0;
            D <= 1'b0;
        end
		  3'b100: begin
		  		Stack_EN <= 1'b0;
				SP_n <= 1'b0;
				SP_p <= 1'b0; 
				RW <= 1'b0;
            F <= 1'b1;
            D <= 1'b0;
        end
		endcase
    end
endmodule