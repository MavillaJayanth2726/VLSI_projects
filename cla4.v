`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 16:12:41
// Design Name: 
// Module Name: cla4
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


module cla4(a,b, cin, sum,cout,out);
input [7:0] a,b;
 input cin;
 output [7:0] sum;
 output cout;
 output [8:0]out;
 wire [7:0] p,g,c;
 wire [7:0] bxor;
 assign bxor =  b ^ {8{cin}};
 assign p=a^bxor;//propagate
 assign g=a&bxor; //generate
 //carry=gi + Pi.ci;
 assign c[0]=cin;
 assign c[1]= g[0]|(p[0]&c[0]);
 assign c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
 assign c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
 assign c[4]= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] |
 p[3]&p[2]&p[1]&p[0]&c[0];
 assign c[5]=g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&c[0]);
 assign c[6]=g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|p[5]&p[4]&p[3]&p[2]&p[1]&g[0]|
 p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0];
 assign c[7]=g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|p[6]&p[5]&p[4]&p[3]&p[2]&g[1]|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|
 (p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&c[0]);
 assign cout=g[7]|(p[7]&g[6])|(p[7]&p[6]&g[5])|(p[7]&p[6]&p[5]&g[4])|(p[7]&p[6]&p[5]&p[4]&g[3])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&g[2])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|
 p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&c[0];
 
 assign sum=p^c;
 assign out={cout,sum};
endmodule
