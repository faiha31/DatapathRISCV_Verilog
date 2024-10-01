module sign_extension(out, IR,ExtendSign);

  
    output  [31:0] out;
    

    input   [31:0] IR;
	input [1:0]ExtendSign;
	 

	wire [11:0] imm_i,imm_s,imm_b;
	
	
	assign imm_i = {{20{IR[31]}},IR[31:20]};
	assign imm_s = {{20{IR[31]}},{ IR[31:25] , IR[11:7] }};
	assign imm_b = {{18{IR[12]}},{ IR[12], IR[7], IR[30:25], IR[11:8]},2'b00};
	assign out = (ExtendSign==2'b00) ? imm_i
				  : (ExtendSign==2'b01) ? imm_s 
				  : (ExtendSign==2'b10) ? imm_b
				  : 32'bx;
				
endmodule

