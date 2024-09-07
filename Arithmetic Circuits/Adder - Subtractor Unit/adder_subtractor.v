`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 08:14:22 PM
// Design Name: 
// Module Name: adder_subtractor
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

//Lecture 14, adder/subtractor with overflow flag
module adder_subtractor
  #(parameter n = 4)
    (
        input [n - 1 : 0] x, y,
        input add_n, //ctrl signal asserts add at low
        output [n - 1 : 0] s,
        output c_out,  //for adder part
        output overflow // if HIGH, result is wrong
    );
    
    wire [n - 1 : 0] xored_y;  //xor of each y input
        generate// to generate an xor circuit for each input y
            genvar k;
            for (k = 0; k < n; k = k + 1)
                begin: node
                assign xored_y[k] = add_n ^ y[k];
                end
        endgenerate
        
      rca_nbit #(.n(n)) A0 ( //Will pass OUR n as the parameter
          .x(x),
          .y(xored_y),
          .c_in(add_n),
          .s(s),
          .c_out(c_out)
      );
      
        assign overflow = (x[n - 1] & xored_y[n - 1] & ~s[n - 1]) | (~x[n - 1] & ~xored_y[n - 1] & s[n - 1]);
        // if the MSB of x and the MSB of (the 2s comp. of) y are the same sign, and the MSB of the sum is a different sign, then there's overflow
endmodule