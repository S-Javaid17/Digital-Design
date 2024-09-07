`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 01:57:16 AM
// Design Name: 
// Module Name: mux_generic_1bit
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


//Vid 19
//N input mux, with 1 bit inputs each
// We determine the number of selectors using log2(#ofINPUTS), but #ofINPUTS isn't always a power of 2
// Thus, we use the ceiling of log (rounds up the answer) --> clog2(#ofINPUTS)
module mux_generic_1bit
#(parameter INS = 16)
    (
        input [INS - 1: 0] w,
        input [$clog2(INS) - 1: 0] s,
        output reg f
    );
    
    integer k;// not genvar, since it's within an always statement
    always@(w, s)
    begin
         f = 'bx;  // to avoid creating a latch, give f a def. value   
         for (k=0; k < INS; k=k+1)
             if (k == s)  // if the value of k = the value given by select input
              f = w[k];  // then route the output to that same number input
    end
    
endmodule
