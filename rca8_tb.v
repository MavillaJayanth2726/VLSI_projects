`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 11:52:18
// Design Name: 
// Module Name: rca8_tb
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


module rca8_tb();
reg [7:0]a,b;
reg cin;
wire cout;
wire [7:0] sum;
rca_8 u1(sum,cout,a,b,cin);
initial
begin
a=8'b00000000;
b=8'b00000000;
cin=1'b0;
end
always #5 b=b+8'b00000001;
always #10 a=a+8'b00000001;
initial #100 $finish;

endmodule
