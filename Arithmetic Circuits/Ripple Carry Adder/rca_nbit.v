`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2024 05:56:43 AM
// Design Name: 
// Module Name: rca_nbit
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

//Video 12, N bit RCA
module rca_nbit
    #(parameter n = 4)//Multiple paramters can be listed here. This one has def. value set to 4, not an input
(
    input [n - 1 : 0] x, y,
    input c_in,
    output [n - 1 : 0] s,
    output c_out
    );
    
    wire [n : 0] c; // Internal nodes which will transmit the carry out + the carry_out, thuse its n:0
    assign c[0] = c_in; // BUT, the very first carry is c_in, so we specify it here, just renaming it
    assign c[n] = c_out; // Same idea as above
 //How can one instantiate n full bit adders?
 //Use "generate .... endgenerate", used for replicating HW structures
     generate
      //Inside it, we'll use a FOR loop to generate n full adders
         genvar k; //NOTE: If using a for loop inside a generate structure, must use "genvar" to define k, which is a int that can't take negative values
        
        for (k = 0; k < n; k = k + 1)
        begin: stage   //Gives each full_adder a naming convention called "stage" --> stage[k].FA
                full_adder FA (
                .x(x[k]),  // since k is from 0 to n-1, it's a placeholder for n in this loop, which iterates
                .y(y[k]),
                .c_in(c[k]),
                .s(s[k]),
                .c_out(c[k+1])
                );
        end
     
     endgenerate 
 
endmodule
