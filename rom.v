module rom(
    input [7:0] addr,
    output reg [13:0] data
);
    always @(*)
    begin
        case (addr)
            8'b0000000: data = 14'b00000101001001; //add-load state
            8'b0000001: data = 14'b00101000100100; //and-store state
            8'b0000010: data = 14'b01000001000100; //mov
        endcase
    end
endmodule