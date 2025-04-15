`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2024 08:50:04
// Design Name: 
// Module Name: nbm
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


module nbm(
    input signed [7:0] multiplicand,
    input signed [7:0] multiplier,
    output signed [15:0] product
);
    wire signed [15:0] partial_product[0:7];
    wire signed [15:0] sum;

    // Implement partial products using Booth encoding
    // Perform shifts and adds based on the Booth algorithm without clock

    assign partial_product[0] = (multiplier[1:0] == 2'b01) ? {8'b0, multiplicand} :
                                (multiplier[1:0] == 2'b10) ? -{8'b0, multiplicand} : 16'b0;
    // Repeat for other partial products based on Booth algorithm...

    // Sum the partial products (you may use an add tree or a similar approach)
    assign product = partial_product[0] + partial_product[1] + partial_product[2] + 
                     partial_product[3] + partial_product[4] + partial_product[5] +
                     partial_product[6] + partial_product[7];

endmodule


