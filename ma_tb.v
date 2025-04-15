`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 11:20:48
// Design Name: 
// Module Name: ma_tb
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


module ma_tb();
reg a,b,c,d,clk;
wire [4:0]p;
ma g1(p,a,b,c,d,clk);
initial 
begin
a=1'b0;b=1'b0;c=1'b0;d=1'b0;clk=1'b0;
#10 a=1'b0;b=1'b1;c=1'b0;d=1'b0;
#10 a=1'b1;b=1'b1;c=1'b0;d=1'b1;
#10 a=1'b1;b=1'b0;c=1'b1;d=1'b0;
#10 a=1'b1;b=1'b1;c=1'b1;d=1'b1;
#10 a=1'b0;b=1'b0;c=1'b0;d=1'b0;
end
always #5 clk=~clk;
endmodule
