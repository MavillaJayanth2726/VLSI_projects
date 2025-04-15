`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 09:57:56
// Design Name: 
// Module Name: nrca
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


module nrca(sum,cout,a,b,cin);
 parameter N=8;
input [N-1:0]a,b;
 input cin;
 output [N-1:0]sum;
 output cout;
 genvar k;
 wire[N:0]c;
 assign c[0] = cin;
 generate
 for(k=0; k<N; k=k+1)
 begin:stage
 FA fa(sum[k],c[k+1],a[k],b[k],c[k]);
 end 
 endgenerate
 assign cout = c[N] ;
 endmodule
 
