module RegisterFile(we, rst, clk,data,addr, enable_reg);
      // parameter n = 32;
       input [5:0] addr;
       input we, rst, clk;
       inout  [31:0] data ;
       wire [31:0] r0v,r1v,r2v,r3v,r4v,r5v,r6v,r7v,r8v,r9v,r10v,r11v,r12v,r13v,r14v,r15v,r16v,r17v,r18v,r19v,r20v,r21v,r22v,r23v,r24v,r25v,r26v,r27v,r28v,r29v,r30v,r31v,r32v;
       wire [63:0] rd_select;
     input enable_reg;
     //output [63:0] r;
     wire [31:0] mux_out;
 
      
      decoder_6_to_64 dec (addr,rd_select);
       bit_reg r0 (.r(r0v), .data(data), .we(rd_select[0] & we), .rst(rst), .clk(clk));
      bit_reg r1 (.r(r1v), .data(data), .we(rd_select[1] & we), .rst(rst), .clk(clk));
      bit_reg r2 (.r(r2v), .data(data), .we(rd_select[2] & we), .rst(rst), .clk(clk));
      bit_reg r3 (.r(r3v), .data(data), .we(rd_select[3] & we), .rst(rst), .clk(clk));
      bit_reg r4 (.r(r4v), .data(data), .we(rd_select[4] & we), .rst(rst), .clk(clk));
      bit_reg r5 (.r(r5v), .data(data), .we(rd_select[5] & we), .rst(rst), .clk(clk));
      bit_reg r6 (.r(r6v), .data(data), .we(rd_select[6] & we), .rst(rst), .clk(clk));
      bit_reg r7 (.r(r7v), .data(data), .we(rd_select[7] & we), .rst(rst), .clk(clk));
      bit_reg r8 (.r(r8v), .data(data), .we(rd_select[8] & we), .rst(rst), .clk(clk));
      bit_reg r9 (.r(r9v), .data(data), .we(rd_select[9] & we), .rst(rst), .clk(clk));
      bit_reg r10 (.r(r10v), .data(data), .we(rd_select[10] & we), .rst(rst), .clk(clk));
      bit_reg r11 (.r(r11v), .data(data), .we(rd_select[11] & we), .rst(rst), .clk(clk));
      bit_reg r12 (.r(r12v), .data(data), .we(rd_select[12] & we), .rst(rst), .clk(clk));
      bit_reg r13 (.r(r13v), .data(data), .we(rd_select[13] & we), .rst(rst), .clk(clk));
      bit_reg r14 (.r(r14v), .data(data), .we(rd_select[14] & we), .rst(rst), .clk(clk));
      bit_reg r15 (.r(r15v), .data(data), .we(rd_select[15] & we), .rst(rst), .clk(clk));
      bit_reg r16 (.r(r16v), .data(data), .we(rd_select[16] & we), .rst(rst), .clk(clk));
      bit_reg r17 (.r(r17v), .data(data), .we(rd_select[17] & we), .rst(rst), .clk(clk));
      bit_reg r18 (.r(r18v), .data(data), .we(rd_select[18] & we), .rst(rst), .clk(clk));
      bit_reg r19 (.r(r19v), .data(data), .we(rd_select[19] & we), .rst(rst), .clk(clk));
      bit_reg r20 (.r(r20v), .data(data), .we(rd_select[20] & we), .rst(rst), .clk(clk));
      bit_reg r21 (.r(r21v), .data(data), .we(rd_select[21] & we), .rst(rst), .clk(clk));
      bit_reg r22 (.r(r22v), .data(data), .we(rd_select[22] & we), .rst(rst), .clk(clk));
      bit_reg r23 (.r(r23v), .data(data), .we(rd_select[23] & we), .rst(rst), .clk(clk));
      bit_reg r24 (.r(r24v), .data(data), .we(rd_select[24] & we), .rst(rst), .clk(clk));
      bit_reg r25 (.r(r25v), .data(data), .we(rd_select[25] & we), .rst(rst), .clk(clk));
      bit_reg r26 (.r(r26v), .data(data), .we(rd_select[26] & we), .rst(rst), .clk(clk));
      bit_reg r27 (.r(r27v), .data(data), .we(rd_select[27] & we), .rst(rst), .clk(clk));
      bit_reg r28 (.r(r28v), .data(data), .we(rd_select[28] & we), .rst(rst), .clk(clk));
      bit_reg r29 (.r(r29v), .data(data), .we(rd_select[29] & we), .rst(rst), .clk(clk));
      bit_reg r30 (.r(r30v), .data(data), .we(rd_select[30] & we), .rst(rst), .clk(clk));
      bit_reg r31 (.r(r31v), .data(data), .we(rd_select[31] & we), .rst(rst), .clk(clk));
      bit_reg r32 (.r(r32v), .data(data), .we(rd_select[32] & we), .rst(rst), .clk(clk));
      //assign r = {r32v, r31v, r30v, r29v, r28v, r27v, r26v, r25v, r24v, r23v, r22v, r21v, r20v, r19v, r18v, r17v, r16v, r15v, r14v, r13v, r12v, r11v, r10v, r9v, r8v, r7v, r6v, r5v, r4v, r3v, r2v, r1v, r0v};
      bit_mux64to1  mux1 (.select(addr), .in0(r0v), .in1(r1v), .in2(r2v), .in3(r3v), .in4(r4v), .in5(r5v), .in6(r6v), .in7(r7v), .in8(r8v), .in9(r9v), .in10(r10v), .in11(r11v), .in12(r12v), .in13(r13v), .in14(r14v), .in15(r15v), .in16(r16v), .in17(r17v), .in18(r18v), .in19(r19v), .in20(r20v), .in21(r21v), .in22(r22v), .in23(r23v), .in24(r24v), .in25(r25v), .in26(r26v), .in27(r27v), .in28(r28v), .in29(r29v), .in30(r30v),.in31(r31v),.in32(r32v) ,.out(mux_out));
      assign data = (~we && enable_reg) ? mux_out : 32'bZ;
       
 
       
   endmodule
module decoder_6_to_64 (
    input [5:0] binary_in, 
    output reg [63:0] onehot_out
);

    integer i;

    always @(*) begin
        onehot_out = 64'b0;
        for (i = 0; i < 64; i = i + 1) begin
            onehot_out[i] = (i == binary_in);
        end
    end

endmodule
module bit_reg (
    input wire clk,       // Clock input
    input wire rst,       // Reset input
    input wire[31:0] data,      // Data input
    input wire we,        // Write enable input
    output reg [31:0]r          // Output register
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            r <= 32'b0;  // Reset the register
        end else begin
            if (we) begin
                r <= data;  // Write data to register when write enable is asserted
            end
        end
    end

endmodule

module bit_mux64to1(
    input [5:0] select,
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7,
     in8, in9, in10, in11, in12, in13, in14, in15,
     in16, in17, in18, in19, in20, in21, in22, in23,
     in24, in25, in26, in27, in28, in29, in30, in31,
    in32, in33, in34, in35, in36, in37, in38, in39,
     in40, in41, in42, in43, in44, in45, in46, in47,
     in48, in49, in50, in51, in52, in53, in54, in55,
     in56, in57, in58, in59, in60, in61, in62, in63,
    output reg [63:0] out
);
    always @(*)
    begin
        case(select)
            6'b000000: out = in0;
            6'b000001: out = in1;
            6'b000010: out = in2;
            6'b000011: out = in3;
            6'b000100: out = in4;
            6'b000101: out = in5;
            6'b000110: out = in6;
            6'b000111: out = in7;
            6'b001000: out = in8;
            6'b001001: out = in9;
            6'b001010: out = in10;
            6'b001011: out = in11;
            6'b001100: out = in12;
            6'b001101: out = in13;
            6'b001110: out = in14;
            6'b001111: out = in15;
            6'b010000: out = in16;
            6'b010001: out = in17;
            6'b010010: out = in18;
            6'b010011: out = in19;
            6'b010100: out = in20;
            6'b010101: out = in21;
            6'b010110: out = in22;
            6'b010111: out = in23;
            6'b011000: out = in24;
            6'b011001: out = in25;
            6'b011010: out = in26;
            6'b011011: out = in27;
            6'b011100: out = in28;
            6'b011101: out = in29;
            6'b011110: out = in30;
            6'b011111: out = in31;
            6'b100000: out = in32;
            6'b100001: out = in33;
            6'b100010: out = in34;
            6'b100011: out = in35;
            6'b100100: out = in36;
            6'b100101: out = in37;
            6'b100110: out = in38;
            6'b100111: out = in39;
            6'b101000: out = in40;
            6'b101001: out = in41;
            6'b101010: out = in42;
            6'b101011: out = in43;
            6'b101100: out = in44;
            6'b101101: out = in45;
            6'b101110: out = in46;
            6'b101111: out = in47;
            6'b110000: out = in48;
            6'b110001: out = in49;
            6'b110010: out = in50;
            6'b110011: out = in51;
            6'b110100: out = in52;
            6'b110101: out = in53;
            6'b110110: out = in54;
            6'b110111: out = in55;
            6'b111000: out = in56;
            6'b111001: out = in57;
            6'b111010: out = in58;
            6'b111011: out = in59;
            6'b111100: out = in60;
            6'b111101: out = in61;
            6'b111110: out = in62;
            6'b111111: out = in63;
            default: out = 32'h00000000; // Default case
        endcase
    end
endmodule

