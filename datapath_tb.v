`timescale 1ns / 1ps

module tb_datapath;

// Parameters for the test bench
reg [3:0] ALUControl;
reg lda, ldb, ldma, ldiR;
reg clk, rst;
reg [1:0] reg_sel;
reg reg_en, mem_en, reg_we, mem_we, alu_en, IMM_en;
reg [1:0] ExtendSign_sel;

wire zero, busy;
wire [31:0] ir_out, ma_out, a_out, b_out, alu_result, mem_wire, reg_file_wire, extender_out, bus, IMM_out;

// Instantiate the datapath module
datapath dut (
    .ALUControl(ALUControl),
    .lda(lda),
    .ldb(ldb),
    .ldma(ldma),
    .ldiR(ldiR),
    .clk(clk),
    .rst(rst),
    .reg_sel(reg_sel),
    .reg_en(reg_en),
    .mem_en(mem_en),
    .reg_we(reg_we),
    .mem_we(mem_we),
    .alu_en(alu_en),
    .IMM_en(IMM_en),
    .zero(zero),
    .busy(busy),
    .ExtendSign_sel(ExtendSign_sel)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clock every 5 time units
end

// Test procedure
initial begin
    // Initialize signals
    rst = 1;  // Assert reset
    #10;      // Wait for some time
    rst = 0;  // Deassert reset

    // Test Case 1: Load data into registers
    lda = 1; ldb = 0; ldma = 0; ldiR = 0; 
    reg_sel = 2'b00; reg_en = 1; mem_en = 0; 
    reg_we = 1; mem_we = 0; alu_en = 0; IMM_en = 0; 
    ExtendSign_sel = 2'b00; // Select immediate for sign extension

    // Check outputs after loading
    #10;  // Wait for the clock cycle
    lda = 0; ldb = 1; // Next operation
    #10; // Wait for the clock cycle

    // Test Case 2: Perform ALU operation
    ALUControl = 4'b0010; // Example: ADD operation
    alu_en = 1; // Enable ALU
    #10; // Wait for ALU operation to complete
    alu_en = 0; // Disable ALU

    // Check outputs after ALU operation
    #10; // Wait for the clock cycle
    
    // Test Case 3: Write to memory
    mem_en = 1; mem_we = 1; 
    // Assuming bus has been set up correctly before this point
    #10; // Wait for memory operation to complete

    // Test Case 4: Read from memory
    mem_we = 0; // Disable write
    #10; // Wait for memory read operation

    // Test Case 5: Load immediate value
    ldiR = 1; // Load immediate
    #10; // Wait for immediate load

    // Finish simulation
    $finish;
end

endmodule

