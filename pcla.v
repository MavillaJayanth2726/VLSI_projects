`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2024 09:43:27
// Design Name: 
// Module Name: pcla
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pcla #(parameter N = 8)(input  [N-1:0] A,
    input  [N-1:0] B,
    input         Cin,
    input         Sub,  // New control signal for subtract operation
    input         clk,
    output [N-1:0] Sum,
    output        Cout
);
    // Internal signals
    wire [N-1:0] B_eff;  // Effective B input (B or ~B)
    wire Cin_eff;        // Effective carry-in (Cin or 1 for subtraction)

    // Generate B_eff and Cin_eff based on Sub signal
    assign B_eff = Sub ? ~B : B;   // If Sub=1, B_eff = ~B (for subtraction)
    assign Cin_eff = Sub ? 1'b1 : Cin;  // If Sub=1, Cin_eff = 1 (for two's complement)

    // Pipeline registers
    reg [N-1:0] P_reg, G_reg;
    reg [N-1:0] carry_reg;
    reg [N-1:0] sum_reg;

    // Stage 1: Compute propagate and generate signals
    always @(posedge clk) begin
        P_reg <= A ^ B_eff;  // Propagate
        G_reg <= A & B_eff;  // Generate
    end

    // Stage 2: Compute intermediate carry signals
    wire [N:0] carry;
    assign carry[0] = Cin_eff;

    generate
        genvar i;
        for (i = 1; i <= N; i = i + 1) begin : carry_gen
            assign carry[i] = G_reg[i-1] | (P_reg[i-1] & carry[i-1]);
        end
    endgenerate

    always @(posedge clk) begin
        carry_reg <= carry[N-1:0];
    end

    // Stage 3: Compute final sum
    always @(posedge clk) begin
        sum_reg <= P_reg ^ carry_reg;  // Sum = P ^ Carry
    end

    // Output assignment
    assign Sum = sum_reg;
    assign Cout = carry[N];
    
endmodule
