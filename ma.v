`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 11:13:06
// Design Name: 
// Module Name: ma
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


module ma(p,a,b,c,d,clk);
input a,b,c,d,clk;
output reg [4:0]p;
reg [1:0]sum1,sum2;
always@(posedge clk)
begin 
sum1=a+b;
sum2=c+d;
end
always@(negedge clk)
begin p=sum1*sum2;
end


endmodule
