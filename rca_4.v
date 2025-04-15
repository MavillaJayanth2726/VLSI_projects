`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 10:57:14
// Design Name: 
// Module Name: rca_4
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


module rca_4(sum,cout,a,b,cin);
input [3:0] a,b;
input cin;
output cout;
output [3:0] sum;
wire [2:0] c;
FA g1(sum[0],c[0],a[0],b[0],cin);
FA g2(sum[1],c[1],a[1],b[1],c[0]);
FA g3(sum[2],c[2],a[2],b[2],c[1]);
FA g4(sum[3],cout,a[3],b[3],c[2]);
endmodule
