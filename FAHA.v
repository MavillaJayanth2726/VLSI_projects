`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 10:31:56
// Design Name: 
// Module Name: FAHA
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


module FAHA(sum,cout,a,b,c);
input a,b,c;
output sum,cout;
wire w1,w2;
half_adder g1(w2,w1,a,b);
half_adder g2(sum,w3,w2,c);
or(cout,w1,w3);

endmodule
