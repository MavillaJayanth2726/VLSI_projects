`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2024 16:30:14
// Design Name: 
// Module Name: cla4_tb
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


module cla4_tb();
reg [7:0] a,b;
 reg cin;
 wire [7:0] sum;
 wire cout;
 wire [8:0] out;
 cla4 dut(a,b, cin, sum,cout,out);
 initial begin
 $monitor( "A=%d, B=%d, Cin= %d, Sum=%d, Cout=%d out=%d",
 a,b,cin,sum,cout,out); end
 initial begin
 a=8'd0; b=8'd0; cin=1'b0;
 #10 a=8'd0; b=8'd0; cin=1'd1;
 #10 a=8'd24; b=8'd1; cin=1'd1;
 #10 a=8'd5; b=8'd7; cin=1'd0;
  #10 a=8'd9; b=8'd9; cin=1'd1;
 #10 $finish;
 end
endmodule
