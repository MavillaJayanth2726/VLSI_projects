`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2024 09:49:43
// Design Name: 
// Module Name: pcla_tb
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


module pcla_tb();
// Testbench parameters
    parameter N = 8;

    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;
    reg Cin;
    reg Sub;  // Control signal for subtraction
    reg clk;

    // Outputs
    wire [N-1:0] Sum;
    wire Cout;

    // Instantiate the pipelined CLA
    pcla g1(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sub(Sub),  // New Sub signal connected
        .clk(clk),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 10ns period, 100 MHz clock
    end

    // Testbench procedure
    initial begin
        // Initialize inputs
        clk = 0;
        A = 0;
        B = 0;
        Cin = 0;
        Sub = 0;
        // Apply test vectors with sufficient delay for pipeline to process
 // Test case for debugging: Subtraction - 5 - 10
    A = 8'd10;
    B = 8'd10;
    Sub = 1;  // Subtraction
    Cin = 1'b0;
    #40;  // Wait for 4 clock cycles // Wait for 4 clock cycles
        // Finish simulation
        $finish;
    end


    
endmodule
