`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 21:07:24
// Design Name: 
// Module Name: acs
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


module acs(s,c,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output c;
wire [2:0]x;
wire [3:0]bi;
assign bi[0]=b[0]^cin;
assign bi[1]=b[1]^cin;
assign bi[2]=b[2]^cin;
assign bi[3]=b[3]^cin;
FA g1(s[0],x[0],a[0],bi[0],cin);
FA g2(s[1],x[1],a[1],bi[1],x[0]);
FA g3(s[2],x[2],a[2],bi[2],x[1]);
FA g4(s[3],c,a[3],bi[3],x[2]);
endmodule
