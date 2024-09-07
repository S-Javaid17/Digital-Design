`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 08:06:06 PM
// Design Name: 
// Module Name: mux_2x1_beh
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

//Behavioural Modelling pt.1
module mux_2x1_beh(
input x1, x2, s,
output reg f //explained at end
    );
    // we can describe the outcome of a 2x1 mux based on the input s
    always @(x1, x2, s)
    // the always block must have a sensitivity list, which is a "trigger" for the always block
    //We're interested in f, which changes when either x1 or x2 or s changes. Thus, we put those in... can use "or" instead of " , "
    begin
    
    if (s) 
    //if statements and for statements etc.. are not cont. assignments and thus don't describe structure
    // They describe the behaviour of the circuit, and must live within an always block
     begin
       f = x2;
     end 
   else 
     begin
       f = x1;
     end
   end
// assignments in an always block are called procedural assignments rather than con.t assignments.
endmodule
// In verilog ouputs must be of type reg, if they're to be used in a always block, because if the block is not running the value of the output must exist elsewhere (as a regsiter)