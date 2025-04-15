`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2024 10:53:58
// Design Name: 
// Module Name: pfft_tb
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


module pfft_tb();
   
    reg clk;
    reg rst;
    reg start;
    reg [7:0] x_real0, x_real1, x_real2, x_real3;
    reg [7:0] x_real4, x_real5, x_real6, x_real7;
    reg [7:0] x_imag0, x_imag1, x_imag2, x_imag3;
    reg [7:0] x_imag4, x_imag5, x_imag6, x_imag7;
    wire [7:0] y_real0, y_real1, y_real2, y_real3;
    wire [7:0] y_real4, y_real5, y_real6, y_real7;
    wire [7:0] y_imag0, y_imag1, y_imag2, y_imag3;
    wire [7:0] y_imag4, y_imag5, y_imag6, y_imag7;
    wire done;

    // Instantiate the pipelined FFT module
    pfft g1 (
        .clk(clk),
        .rst(rst),
        .start(start),
        .x_real0(x_real0), .x_real1(x_real1), .x_real2(x_real2), .x_real3(x_real3),
        .x_real4(x_real4), .x_real5(x_real5), .x_real6(x_real6), .x_real7(x_real7),
        .x_imag0(x_imag0), .x_imag1(x_imag1), .x_imag2(x_imag2), .x_imag3(x_imag3),
        .x_imag4(x_imag4), .x_imag5(x_imag5), .x_imag6(x_imag6), .x_imag7(x_imag7),
        .y_real0(y_real0), .y_real1(y_real1), .y_real2(y_real2), .y_real3(y_real3),
        .y_real4(y_real4), .y_real5(y_real5), .y_real6(y_real6), .y_real7(y_real7),
        .y_imag0(y_imag0), .y_imag1(y_imag1), .y_imag2(y_imag2), .y_imag3(y_imag3),
        .y_imag4(y_imag4), .y_imag5(y_imag5), .y_imag6(y_imag6), .y_imag7(y_imag7),
        .done(done)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // 100 MHz clock
    end

    // Testbench procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        start = 0;
        x_real0 = 8'h01; x_imag0 = 8'h00;
        x_real1 = 8'h02; x_imag1 = 8'h00;
        x_real2 = 8'h03; x_imag2 = 8'h00;
        x_real3 = 8'h04; x_imag3 = 8'h00;
        x_real4 = 8'h05; x_imag4 = 8'h00;
        x_real5 = 8'h06; x_imag5 = 8'h00;
        x_real6 = 8'h07; x_imag6 = 8'h00;
        x_real7 = 8'h08; x_imag7 = 8'h00;

        // Reset the FFT module
        #10 rst = 0;

        // Start FFT computation
        #10 start = 1;
        #10 start = 0;

        // Wait for the FFT computation to finish
        wait(done);

        // Display results
        $display("FFT Computation Complete");
        $display("Index  Real Part  Imaginary Part");
        $display("0      %d           %d", y_real0, y_imag0);
        $display("1      %d           %d", y_real1, y_imag1);
        $display("2      %d           %d", y_real2, y_imag2);
        $display("3      %d           %d", y_real3, y_imag3);
        $display("4      %d           %d", y_real4, y_imag4);
        $display("5      %d           %d", y_real5, y_imag5);
        $display("6      %d           %d", y_real6, y_imag6);
        $display("7      %d           %d", y_real7, y_imag7);

        // End simulation
        #20 $finish;
    end
endmodule

