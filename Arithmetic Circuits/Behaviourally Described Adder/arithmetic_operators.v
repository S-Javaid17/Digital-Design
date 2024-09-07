`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 09:25:09 PM
// Design Name: 
// Module Name: arithmetic_operators
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

//Video 15
module arithmetic_operators
     #(parameter n = 4)
    (
       input [n - 1: 0] x,
       // input signed [n - 1: 0] x,  // would force it to be a signed number, in case we extend the bit length, the sign will remain the same
       input [n - 1: 0] y,
       output [n - 1: 0] s,
       output c_out, overflow       
     );
     
////     assign s = x + y; // A paramterized n bit adder, without all of the gate modelling, but no c_out, so discard
//// We'll use a concatenation operator   
//     wire [n:0] sum;
//     assign sum = {1'b0,x} + {1'b0, y};  // Concatenates a single bit of 0 in the MSB of x and y respectively, considering they're unsigned numbers
//// We DON"T NEED to concatenate. Verilog will automatically expand the inputs to 5 bits since the output is 5 bits; thus,  assign sum = x + y;   would WORK TOO  
//     assign s = sum[n-1:0];
//     assign c_out = sum[n];//Thus, the MSB is carry out, and still parameterized to n
      
     assign {c_out, s} = x + y;  // WE DON"T NEED any of the above, this will concat. c_out to the MSB of the sum of x + y, and assign the rightmost bits to s
     assign overflow = (x[n - 1] & y[n - 1] & ~s[n - 1]) | (~x[n - 1] & ~y[n - 1] & s[n - 1]);
endmodule
