`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2024 08:52:55
// Design Name: 
// Module Name: nbm_tb
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


module nbm_tb();

    // Declare testbench variables
    reg signed [7:0] multiplicand;
    reg signed [7:0] multiplier;
    wire signed [15:0] product;

    // Instantiate the Booth multiplier module
    nbm g1 (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Test procedure
    initial begin
        // Test case 1: 3 * 4 = 12
        multiplicand = 8'd3;
        multiplier = 8'd4;
        #10; // Wait for the combinational logic to settle

        // Test case 2: -3 * 4 = -12
        multiplicand = -8'd3;
        multiplier = 8'd4;
        #10;

        // Test case 3: 7 * -8 = -56
        multiplicand = 8'd7;
        multiplier = -8'd8;
        #10;
        

        // Test case 4: -7 * -8 = 56
        multiplicand = -8'd7;
        multiplier = -8'd8;
        #10;
       

        // Test case 5: 0 * 123 = 0
        multiplicand = 8'd0;
        multiplier = 8'd123;
        #10;
       

        // Test case 6: -128 * 1 = -128
        multiplicand = -8'd128;
        multiplier = 8'd1;
        #10;
        

        // Test case 7: 127 * 127 = 16129
        multiplicand = 8'd127;
        multiplier = 8'd127;
        #10;
     
        // Test case 8: -128 * -128 = 16384
        multiplicand = -8'd128;
        multiplier = -8'd128;
        #10;
       
    end

endmodule

