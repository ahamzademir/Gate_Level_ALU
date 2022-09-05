module clock_divider(
    input clk_in,
    input increase,
    output reg led,
    output reg clk_out
);
    reg [2:0] freqState = 3'b000;
    reg [27:0] counter = 28'd0;
    reg [27:0] freq = 28'd250000000;
    always @(posedge clk_in)
    begin
        if (counter >= freq) begin
            counter <= 28'd0;
            clk_out <= ~clk_out;
        end
        else counter <= counter + 1;
    end

    always @(posedge clk_out)
    begin
        led <= ~led;
    end

    always @(posedge increase)
    begin
        case (freqState)
            3'b000: begin
                freq <= 28'd12500000; //2Hz
                freqState <= 3'b001;
            end
            3'b001: begin
                freq <= 28'd6250000; //4Hz
                freqState <= 3'b010;
            end
            3'b010: begin
                freq <= 28'd3125000; //8Hz
                freqState <= 3'b011;
            end
            3'b011: begin
                freq <= 28'd1562500; //16Hz
                freqState <= 3'b100;
            end
            3'b100: begin
                freq <= 28'd781250; //32Hz
                freqState <= 3'b101;
            end
            3'b101: begin
                freq <= 28'd390625; //64Hz
                freqState <= 3'b110;
            end
            3'b110: begin
                freq <= 28'd195312; //128Hz
                freqState <= 3'b111;
            end
            3'b111: begin
                freq <= 28'd25000000; //1Hz
                freqState <= 3'b000;
            end
        endcase
    end
endmodule