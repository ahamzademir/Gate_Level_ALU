module seven_segment(
    input clk,
    input [7:0] data,
    output reg [6:0] seg1,
    output reg [6:0] seg2,
    output reg [6:0] seg3
);

    reg [7:0] temp;
    reg [3:0] hundreds;
    reg [3:0] tens;
    reg [3:0] ones;

    always @(posedge clk)
    begin
        temp = data;
        if (temp >= 200) begin
            hundreds = 2;
        end
        else if (temp >= 100) begin
            hundreds = 1;
        end
        else begin
            hundreds = 0;
        end

        temp = data - hundreds*100;

        if (temp >= 90) begin
            tens = 9;
        end
        else if (temp >= 80) begin
            tens = 8;
        end
        else if (temp >= 70) begin
            tens = 7;
        end
        else if (temp >= 60) begin
            tens = 6;
        end
        else if (temp >= 50) begin
            tens = 5;
        end
        else if (temp >= 40) begin
            tens = 4;
        end
        else if (temp >= 30) begin
            tens = 3;
        end
        else if (temp >= 20) begin
            tens = 2;
        end
        else if (temp >= 10) begin
            tens = 1;
        end
        else begin
            tens = 0;
        end

        ones = temp - tens*10;
    end

    always @(*)
    begin
        case (hundreds)
            4'b0000: seg1 = 7'b1000000;
            4'b0001: seg1 = 7'b1111001;
            4'b0010: seg1 = 7'b0100100;
            default: seg1 = 7'b1000000;
        endcase

        case (tens)
            4'b0000: seg2 = 7'b1000000;
            4'b0001: seg2 = 7'b1111001;
            4'b0010: seg2 = 7'b0100100;
            4'b0011: seg2 = 7'b0110000;
            4'b0100: seg2 = 7'b0011001;
            4'b0101: seg2 = 7'b0010010;
            4'b0110: seg2 = 7'b0000011;
            4'b0111: seg2 = 7'b0000111;
            4'b1000: seg2 = 7'b0000000;
            4'b1001: seg2 = 7'b0011000;
            default: seg2 = 7'b1000000;
        endcase

        case (ones)
            4'b0000: seg3 = 7'b1000000;
            4'b0001: seg3 = 7'b1111001;
            4'b0010: seg3 = 7'b0100100;
            4'b0011: seg3 = 7'b0110000;
            4'b0100: seg3 = 7'b0011001;
            4'b0101: seg3 = 7'b0010010;
            4'b0110: seg3 = 7'b0000011;
            4'b0111: seg3 = 7'b1111000;
            4'b1000: seg3 = 7'b0000000;
            4'b1001: seg3 = 7'b0011000;
            default: seg3 = 7'b1000000;
        endcase
    end
endmodule