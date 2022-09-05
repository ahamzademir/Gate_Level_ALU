module control_unit(
    input clk,
	 input [1:0] ins_code,
  	 output reg f,
    output reg d,
    output reg e,
	 output reg rw,
	 output reg cs
);
    reg [2:0] controlUnit;
    always @(posedge clk)
    begin
        case (controlUnit)
            3'b001: controlUnit <= 3'b010;
            3'b010: controlUnit <= 3'b011;
				3'b011: controlUnit <= 3'b100;
            3'b100: controlUnit <= 3'b101;
            3'b101: controlUnit <= 3'b001;
            default: controlUnit <= 3'b001; 
        endcase
    end

    always @(*)
    begin
        case (controlUnit)
        3'b001: begin 
				if(ins_code == 2'b10) //store state
				begin
					rw <= 1'b0;
					cs <= 1'b1;
				end
            f <= 1'b0;
            d <= 1'b0;
            e <= 1'b0;
        end
        3'b010: begin
            f <= 1'b1;
            d <= 1'b1;
            e <= 1'b0;
        end
        3'b011: begin
            f <= 1'b0;
            d <= 1'b1;
            e <= 1'b0;
        end
		  3'b100: begin
		  		if(ins_code == 2'b01) //load state
				begin
					rw <= 1'b1;
					cs <= 1'b1;
				end
            f <= 1'b0;
            d <= 1'b1;
            e <= 1'b0;
        end
		  3'b101: begin
            f <= 1'b0;
            d <= 1'b0;
            e <= 1'b1;
        end
        default: begin
            f <= 1'b0;
            d <= 1'b0;
            e <= 1'b0;
        end
    endcase
    end	 
endmodule