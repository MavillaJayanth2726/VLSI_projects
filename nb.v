`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2024 15:52:48
// Design Name: 
// Module Name: nb
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


module nb(output reg [1:0]a,input [3:0]d);
always@(*)
begin
case(d)
4'b0001:a=2'b00;
4'b0010:a=2'b01;
4'b0100:a=2'b10;
4'b1000:a=2'b11;
endcase
end 

endmodule
