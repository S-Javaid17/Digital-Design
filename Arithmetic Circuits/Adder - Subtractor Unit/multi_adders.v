`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 06:30:56 AM
// Design Name: 
// Module Name: multi_adders
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

// Video 11, just going to instantiate the n bit adder with 34 bits and 16 bits
module multi_adders(
 input [15:0] a, b, 
 output [15:0] s_ab, 
 output c_out_ab,
 //don't really need a c_in
 input [33:0] x, y,
 output [33:0] s_xy,
 output c_out_xy
    );
   
    //It doesn't know on its own how many bits, so it goes to the default 4 bits 
    rca_nbit #(.n(16)) adder_16 ( // redefine the value of n for your instance, before the name
    .x(a),
    .y(b),
    .s(s_ab),
    .c_in(0),
    .c_out(c_out_ab)
    );
    
     rca_nbit #(.n(34)) adder_34 (
        .x(x),
        .y(y),
        .s(s_xy),
        .c_in(0),
        .c_out(c_out_xy)
    );
endmodule
