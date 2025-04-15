`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2024 10:53:08
// Design Name: 
// Module Name: clac
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


module clac(a,b, cin,clk,sum,cout,out);
input [7:0] a,b;
 input cin,clk;
 output reg [7:0] sum;
 output reg cout;
 output reg [8:0]out;
  reg [7:0] p,g,c;
  reg [7:0] bxor;
 always@(posedge clk)
 begin 
  bxor =  b ^ {8{cin}};
  p=a^bxor;//propagate
  g=a&bxor; //generate
 //carry=gi + Pi.ci;
  c[0]=cin;
  c[1]= g[0]|(p[0]&c[0]);
  c[2]= g[1] | (p[1]&g[0]) | p[1]&p[0]&c[0];
  c[3]= g[2] | (p[2]&g[1]) | p[2]&p[1]&g[0] | p[2]&p[1]&p[0]&c[0];
  c[4]= g[3] | (p[3]&g[2]) | p[3]&p[2]&g[1] | p[3]&p[2]&p[1]&g[0] |
 p[3]&p[2]&p[1]&p[0]&c[0];
  c[5]=g[4]|(p[4]&g[3])|(p[4]&p[3]&g[2])|(p[4]&p[3]&p[2]&g[1])|(p[4]&p[3]&p[2]&p[1]&g[0])|(p[4]&p[3]&p[2]&p[1]&c[0]);
  c[6]=g[5]|(p[5]&g[4])|(p[5]&p[4]&g[3])|(p[5]&p[4]&p[3]&g[2])|(p[5]&p[4]&p[3]&p[2]&g[1])|p[5]&p[4]&p[3]&p[2]&p[1]&g[0]|
 p[5]&p[4]&p[3]&p[2]&p[1]&p[0]&c[0];
  c[7]=g[6]|(p[6]&g[5])|(p[6]&p[5]&g[4])|(p[6]&p[5]&p[4]&g[3])|(p[6]&p[5]&p[4]&p[3]&g[2])|p[6]&p[5]&p[4]&p[3]&p[2]&g[1]|(p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|
 (p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&c[0]);
 cout=g[7]|(p[7]&g[6])|(p[7]&p[6]&g[5])|(p[7]&p[6]&p[5]&g[4])|(p[7]&p[6]&p[5]&p[4]&g[3])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&g[2])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&g[1])|
 (p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&g[0])|
 p[7]&p[6]&p[5]&p[4]&p[3]&p[2]&p[1]&c[0];
 sum=p^c;
  out={cout,sum};
  end
endmodule
