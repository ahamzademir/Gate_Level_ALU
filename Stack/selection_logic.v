module selection_logic(
	input [1:0] inst_code,
	input [2:0] op_code,
	input [2:0] flags,
	output reg [1:0] selector
);
	always @ (flags)
	begin
//		if(flags != 3'b000) 
//			flags <= 3'b000;
	end
	
	always @(op_code, selector)
	begin
		if(inst_code != 10) 
			selector <= 2'b00;
		
		else if(inst_code == 10 && op_code != 100 && op_code != 111) 
			selector <= 2'b01;
		
		else if(op_code == 100)  
			selector <= 2'b10;
		
		else if(op_code == 111)  
			selector <= 2'b11;
	end
	
endmodule