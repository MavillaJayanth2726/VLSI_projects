`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 11:38:45
// Design Name: 
// Module Name: rca_8
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


module rca_8(sum,cout,a,b,cin);
input [7:0]a,b;
input cin;
output [7:0]sum;
output cout;
wire [6:0]c;
FA g1(sum[0],c[0],a[0],b[0],cin);
FA g2(sum[1],c[1],a[1],b[1],c[0]);
FA g3(sum[2],c[2],a[2],b[2],c[1]);
FA g4(sum[3],c[3],a[3],b[3],c[2]);
FA g5(sum[4],c[4],a[4],b[4],c[3]);
FA g6(sum[5],c[5],a[5],b[5],c[4]);
FA g7(sum[6],c[6],a[6],b[6],c[5]);
FA g8(sum[7],cout,a[7],b[7],c[6]);
endmodule
