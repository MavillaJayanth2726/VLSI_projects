`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 11:19:18
// Design Name: 
// Module Name: rca4_tb
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


module rca4_tb();
reg [3:0] a,b;
reg cin;
wire cout;
wire [3:0]sum;
rca_4 g1(sum,cout,a,b,cin);
initial
begin
a=4'b0000;
b=4'b0000;
cin=1'b0;
end
always #5 b=b+4'b0001;
always #10 a=a+4'b0001;
initial #100 $finish;
endmodule
