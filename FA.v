`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2024 10:11:43
// Design Name: 
// Module Name: FA
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


module FA(sum,cout,a,b,c);
input a,b,c;
output  sum,cout;
//wire w1,w2,w3;
//assign sum=a^b^c;
//assign cout=(a&b)|(b&c)|(c&a);
xor(sum,a,b,c);
and(w1,a,b);
and(w2,b,c);
and(w3,a,c);
or(cout,w1,w2,w3);
//always@(*)
//begin
//sum=a^b^c;

//cout=(a&b)|(b&c)|(c&a);
//end
endmodule
