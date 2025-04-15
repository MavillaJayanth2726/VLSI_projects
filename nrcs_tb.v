`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 10:33:09
// Design Name: 
// Module Name: nrcs_tb
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


module nrcs_tb();
localparam n=8;
 reg [n-1:0] a,b;
 reg cin;
 wire [n-1:0] sum;
 wire cout;
 nrca #(n) dut(sum,cout,a,b,cin);
 initial begin
 $monitor( "A=%d, B=%d, Sum=%d, Cout=%d ", a,b,sum,cout); end
 initial begin
 a=0; b=0;cin=1'b0;
 #10 a='d10; b='d20;
 #10 a='d14; b='d1;
 #10 a='d5; b='d0;
 #10 a='d99; b='d23;
 #10 a='d127; b='d127;
 #10 a='d255; b='d255;
 #10 $finish;
 end
endmodule
