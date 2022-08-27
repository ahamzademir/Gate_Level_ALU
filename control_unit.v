module control_unit(
    input clk,
    output reg f,
    output reg d,
    output reg e
);
    reg [2:0] controlUnit;
    always @(posedge clk)
    begin
        case (controlUnit)
            3'b001: controlUnit <= 3'b010;
            3'b010: controlUnit <= 3'b100;
            3'b100: controlUnit <= 3'b001;
            default: controlUnit <= 3'b001; 
        endcase
    end

    always @(*)
    begin
        case (controlUnit)
        3'b001: begin
            f <= 1'b1;
            d <= 1'b0;
            e <= 1'b0;
        end
        3'b010: begin
            f <= 1'b0;
            d <= 1'b1;
            e <= 1'b0;
        end
        3'b100: begin
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