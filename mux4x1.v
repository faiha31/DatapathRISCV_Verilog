module mux4x1_6bit (
    input [5:0] in0,
    input [5:0] in1,
    input [5:0] in2,
    input [5:0] in3,
    input [1:0] sel,
    output reg [5:0] out
);

always @(*) begin
    case(sel)
        2'b00: out = in0;
        2'b01: out = in1;
        2'b10: out = in2;
        2'b11: out = in3;
        default: out = 6'b000000; // Default case
    endcase
end

endmodule


