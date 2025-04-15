`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 13:19:38
// Design Name: 
// Module Name: ogfft_tb
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


module ogfft_tb();
reg clk;
reg [2:0] sel;
wire [8:0] yr,yi;
ogfft g1(.clk(clk),.sel(sel),.yr(yr),.yi(yi)); 
initial
begin clk = 0;
end 
always 
begin
//TOGGLE CLOCK EVERY 5ns
#5
clk = ~clk;
end
initial 
begin
sel = 3'b000;#10 
sel = 3'b001;#10 
sel = 3'b010;#10 
sel = 3'b011;#10 
sel = 3'b100;#10 
sel = 3'b101;#10 
sel = 3'b110;#10 
sel = 3'b111;
end 
initial begin
$dumpfile("ogfft.vcd");
$dumpvars;
#10000 $finish;
end
  

endmodule
