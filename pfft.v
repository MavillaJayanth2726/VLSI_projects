`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.08.2024 10:48:15
// Design Name: 
// Module Name: pfft
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


module pfft(
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] x_real0, input wire [7:0] x_real1, input wire [7:0] x_real2, input wire [7:0] x_real3,
    input wire [7:0] x_real4, input wire [7:0] x_real5, input wire [7:0] x_real6, input wire [7:0] x_real7,
    input wire [7:0] x_imag0, input wire [7:0] x_imag1, input wire [7:0] x_imag2, input wire [7:0] x_imag3,
    input wire [7:0] x_imag4, input wire [7:0] x_imag5, input wire [7:0] x_imag6, input wire [7:0] x_imag7,
    output reg [7:0] y_real0, output reg [7:0] y_real1, output reg [7:0] y_real2, output reg [7:0] y_real3,
    output reg [7:0] y_real4, output reg [7:0] y_real5, output reg [7:0] y_real6, output reg [7:0] y_real7,
    output reg [7:0] y_imag0, output reg [7:0] y_imag1, output reg [7:0] y_imag2, output reg [7:0] y_imag3,
    output reg [7:0] y_imag4, output reg [7:0] y_imag5, output reg [7:0] y_imag6, output reg [7:0] y_imag7,
    output reg done
);

    // Internal signals
    reg signed [7:0] x_real_reg1 [0:7];
    reg signed [7:0] x_imag_reg1 [0:7];
    reg signed [7:0] x_real_reg2 [0:7];
    reg signed [7:0] x_imag_reg2 [0:7];
    reg signed [7:0] y_real_stage1 [0:7];
    reg signed [7:0] y_imag_stage1 [0:7];
    reg signed [7:0] y_real_stage2 [0:7];
    reg signed [7:0] y_imag_stage2 [0:7];
    reg [2:0] stage;
    reg start_stage1, start_stage2, start_stage3;
    reg done_stage1, done_stage2;
    wire [7:0] sum_real, sum_imag;
    wire carry_out;
    wire [15:0] prod_real, prod_imag;
    integer i;

    // Instantiate the carry-lookahead adder
    carry_lookahead_adder adder (
        .a(sum_real),
        .b(sum_imag),
        .cin(0),
        .sum(sum_real),
        .cout(carry_out)
    );

    // Instantiate the Booth multiplier
    booth_multiplier multiplier (
        .a(x_real_reg2[i]),
        .b(twiddle_real[2*i]),
        .product(prod_real)
    );

    // Initialize twiddle factors
    reg [7:0] twiddle_real [0:3];
    reg [7:0] twiddle_imag [0:3];

    initial begin
        twiddle_real[0] = 8'h7F; // cos(0)
        twiddle_imag[0] = 8'h00; // sin(0)
        twiddle_real[1] = 8'h5A; // cos(pi/4)
        twiddle_imag[1] = 8'hA5; // sin(pi/4)
        twiddle_real[2] = 8'h00; // cos(pi/2)
        twiddle_imag[2] = 8'h80; // sin(pi/2)
        twiddle_real[3] = 8'hA5; // cos(3pi/4)
        twiddle_imag[3] = 8'hA5; // sin(3pi/4)
    end

    // Stage 1: Butterfly computation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            start_stage1 <= 0;
            done_stage1 <= 0;
            stage <= 0;
        end else if (start) begin
            // Copy inputs to pipeline registers
            x_real_reg1[0] <= x_real0;
            x_real_reg1[1] <= x_real1;
            x_real_reg1[2] <= x_real2;
            x_real_reg1[3] <= x_real3;
            x_real_reg1[4] <= x_real4;
            x_real_reg1[5] <= x_real5;
            x_real_reg1[6] <= x_real6;
            x_real_reg1[7] <= x_real7;
            x_imag_reg1[0] <= x_imag0;
            x_imag_reg1[1] <= x_imag1;
            x_imag_reg1[2] <= x_imag2;
            x_imag_reg1[3] <= x_imag3;
            x_imag_reg1[4] <= x_imag4;
            x_imag_reg1[5] <= x_imag5;
            x_imag_reg1[6] <= x_imag6;
            x_imag_reg1[7] <= x_imag7;
            start_stage1 <= 1;
            stage <= 1;
        end
    end

    // Stage 2: Butterfly computation with twiddle factors
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            start_stage2 <= 0;
            done_stage2 <= 0;
        end else if (start_stage1) begin
            for (i = 0; i < 4; i = i + 1) begin
                // Perform butterfly computations
                y_real_stage1[i] <= x_real_reg1[i] + x_real_reg1[i+4];
                y_imag_stage1[i] <= x_imag_reg1[i] + x_imag_reg1[i+4];
                y_real_stage1[i+4] <= x_real_reg1[i] - x_real_reg1[i+4];
                y_imag_stage1[i+4] <= x_imag_reg1[i] - x_imag_reg1[i+4];
            end
            start_stage2 <= 1;
        end
    end

    // Stage 3: Final stage butterfly computation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= 0;
            start_stage3 <= 0;
        end else if (start_stage2) begin
            for (i = 0; i < 2; i = i + 1) begin
                // Perform butterfly computations with twiddle factors
                start_stage3 <= 1;
                y_real_stage2[i] <= y_real_stage1[i] + (prod_real - prod_imag);
                y_imag_stage2[i] <= y_imag_stage1[i] + (prod_real + prod_imag);
                y_real_stage2[i+2] <= y_real_stage1[i] - (prod_real - prod_imag);
                y_imag_stage2[i+2] <= y_imag_stage1[i] - (prod_real + prod_imag);
            end
            done <= 1;
        end
    end

    // Output assignment
    always @(posedge clk) begin
        if (done) begin
            y_real0 <= y_real_stage2[0];
            y_real1 <= y_real_stage2[1];
            y_real2 <= y_real_stage2[2];
            y_real3 <= y_real_stage2[3];
            y_real4 <= y_real_stage2[4];
            y_real5 <= y_real_stage2[5];
            y_real6 <= y_real_stage2[6];
            y_real7 <= y_real_stage2[7];
            y_imag0 <= y_imag_stage2[0];
            y_imag1 <= y_imag_stage2[1];
            y_imag2 <= y_imag_stage2[2];
            y_imag3 <= y_imag_stage2[3];
            y_imag4 <= y_imag_stage2[4];
            y_imag5 <= y_imag_stage2[5];
            y_imag6 <= y_imag_stage2[6];
            y_imag7 <= y_imag_stage2[7];
        end
    end



endmodule
module booth_multiplier (
    input wire [7:0] a,      // Multiplicand
    input wire [7:0] b,      // Multiplier
    output reg [15:0] product // Product output
);
    reg [7:0] m, q;
    reg q1;
    reg [15:0] a_reg;
    reg [15:0] acc;
    integer i;

    always @(*) begin
        m = a;
        q = b;
        q1 = 0;
        acc = 16'b0;

        for (i = 0; i < 8; i = i + 1) begin
            case ({q[0], q1})
                2'b01: acc = acc + {m, 8'b0}; // Add
                2'b10: acc = acc - {m, 8'b0}; // Subtract
                default: ; // Do nothing
            endcase
            q1 = q[0];
            q = q >> 1;
            acc = acc << 1;
        end

        product = acc;
    end
endmodule
module carry_lookahead_adder (
    input wire [7:0] a,      // First operand
    input wire [7:0] b,      // Second operand
    input wire cin,          // Carry-in
    output wire [7:0] sum,   // Sum output
    output wire cout         // Carry-out
);
    wire [7:0] p, g, c;

    // Generate and propagate terms
    assign p = a ^ b;
    assign g = a & b;

    // Carry lookahead logic
    assign c[0] = cin;
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & c[1]);
    assign c[3] = g[2] | (p[2] & c[2]);
    assign c[4] = g[3] | (p[3] & c[3]);
    assign c[5] = g[4] | (p[4] & c[4]);
    assign c[6] = g[5] | (p[5] & c[5]);
    assign c[7] = g[6] | (p[6] & c[6]);
    assign cout = g[7] | (p[7] & c[7]);

    // Sum calculation
    assign sum = p ^ c;

endmodule



