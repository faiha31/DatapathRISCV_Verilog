module memory(we, rst, clk,data,addr, enable_mem);

	input [31:0] addr;
	input we, rst, clk;
	inout  [31:0] data ;
	input enable_mem;
	


	reg [31:0] memory [0: 63];
	assign data = (~we && enable_mem) ?  memory[addr] : 32'bZ;

	always @ ( posedge clk  ) begin

		if ( enable_mem && we ) memory[addr] <= data ;

	end
	
initial begin
		$readmemh("file.txt", memory);
end
endmodule

