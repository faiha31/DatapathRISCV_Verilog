module datapath(ALUControl,lda, ldb, ldma, ldiR,clk, rst,reg_sel,reg_en, mem_en, reg_we, mem_we, alu_en, IMM_en,zero, busy,ExtendSign_sel);


input [3:0] ALUControl;
input lda, ldb, ldma, ldiR;
input clk, rst;
input [1:0] reg_sel;
input reg_en, mem_en, reg_we, mem_we, alu_en, IMM_en;
output zero, busy;

input [1:0] ExtendSign_sel;
wire [31:0]ir_out;
wire [31:0]ma_out;
wire [31:0]a_out;
wire [31:0]b_out;

wire [31:0] alu_result;
wire [31:0] mem_wire;
wire [31:0] reg_file_wire;
wire [5:0] mux_address;
wire [4:0] rs, rt, rd;
wire [31:0]extender_out;
wire [31:0] bus;
wire [31:0]IMM_out;
assign rs = ir_out[19:15];
assign rt = ir_out[24:20];
assign rd = ir_out[11:7];

assign bus = (reg_en && ~reg_we ) ? reg_file_wire :     (mem_en && ~mem_we ) ? mem_wire :      (alu_en)? alu_result :    (IMM_en) ? IMM_out  : 32'bx     ;
assign reg_file_wire = (reg_en && reg_we) ? bus: 32'bz;
assign mem_wire = (mem_en && mem_we ) ? bus: 32'bz ;
alu ALU (.ALUControl(ALUControl), .A(a_out), .B(b_out), .ALUResult(alu_result), .Zero(zero));

memory mem (.we(mem_we),
 .rst(rst), 
 .clk(clk),
 .data(mem_wire),
 .addr(ma_out),
 .enable_mem(mem_en));
 

mux4x1_6bit mux_four(.in0(rs),
 .in1(rt), 
 .in2(rd),
 .in3(6'd32),
 .sel(reg_sel), 
 .out(mux_address));



RegisterFile  reg_file(.we(reg_we),
 .rst(rst),
 .clk(clk),
 .data(reg_file_wire),
 .addr(mux_address), 
 .enable_reg(reg_en));
 
 


sign_extension sign_ext (.out(extender_out),
 .IR(ir_out),
 .ExtendSign(ExtendSign_sel));
 
 

bit_reg A( 
.clk(clk), 
 .rst(rst), 
 .data(bus),  
 .we(lda), 
 .r(a_out)  );
 
 
bit_reg B( .clk(clk), 
 .rst(rst), 
 .data(bus), 
 .we(ldb), 
 .r(b_out)  );
 
 
bit_reg MA( .clk(clk), 
 .rst(rst), 
 .data(bus), 
 .we(ldma), 
 .r(ma_out)  );
 
 
bit_reg IR( .clk(clk),
  .rst(rst), 
  .data(bus),   
  .we(ldiR),  
  .r(ir_out)  );
  
  
endmodule