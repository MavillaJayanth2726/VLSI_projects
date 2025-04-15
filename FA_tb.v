`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 10:21:55
// Design Name: 
// Module Name: FA_tb
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


module FA_tb();
reg a,b,c;
wire sum,cout;
FAHA g1(sum,cout,a,b,c);
initial
begin
a=1'b0;
b=1'b0;
c=1'b0;
end
always #5 c=c+1'b1;
always #10 b=b+1'b1;
always #20 a=a+1'b1;
initial #100 $finish;
endmodule
