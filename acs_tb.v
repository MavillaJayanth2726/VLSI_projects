`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 21:14:11
// Design Name: 
// Module Name: acs_tb
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


module acs_tb();
reg [3:0] a,b;
reg cin;
wire [3:0]s;
wire c;
acs g1(s,c,a,b,cin);
initial
begin
a=4'b0000;
b=4'b0000;
cin=1'b0;
end
always #5 b=b+4'b0001;
always #10 a=a+4'b0001;
always #20 cin=~cin;

endmodule
