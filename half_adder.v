`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2024 11:30:47
// Design Name: 
// Module Name: half_adder
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


module half_adder(sum,carry,a,b);
input a,b;
output reg  sum,carry;
//dataflow
//assign sum=a^b;
//assign carry=a&b;
//and g1(carry,a,b);  stractural
//xor g2(sum,a,b);
always@(*)
begin
sum=a^b;
carry=a&b;
end

endmodule
