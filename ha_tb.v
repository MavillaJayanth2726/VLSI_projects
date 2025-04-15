`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2024 11:41:27
// Design Name: 
// Module Name: ha_tb
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


module ha_tb();
reg a,b;
wire sum,carry;
half_adder w1(sum,carry,a,b);

initial
begin
a=1'b0;
b=1'b0;
end
always #5 b=b+1'b1;
always #10 a=a+1'b1;
initial #100 $finish;
endmodule
