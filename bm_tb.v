`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.08.2024 15:10:34
// Design Name: 
// Module Name: bm_tb
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


module bm_tb(

    );    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg clock;

    // Outputs
    wire [15:0] p;

    // Variables
    integer j,k;

    // Instantiate the Unit Under Test (UUT)
    bm g1 (
        .p(p), 
        .a(a), 
        .b(b), 
        .clock(clock)
    );

    initial clock = 0;
    always #5 clock = ~clock;

    initial
    begin
        a=0;
        b=0;
        for (j=1; j<10; j=j+1)
            for (k=1; k<11; k=k+1)
                begin
                    a=j;
                    b=k;
                    #20 $display("%d * %d = %d", a, b, p);
                end
    end   
endmodule
