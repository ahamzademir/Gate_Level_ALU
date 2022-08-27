module counter( 
	input clk, fetch,
	output reg [7:0] counter_out
);

	always@(posedge clk) 
	begin
  

	if(fetch)
		counter_out <= counter_out + 1;

  end
endmodule