`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 01:07:52 AM
// Design Name: 
// Module Name: mux_2x1_nbit
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


module mux_2x1_nbit
#(parameter N = 3)// Still 2x1, just N bits in each input
    (
        input [N - 1: 0] w0, w1,
        input s,
        output reg[N - 1: 0] f  // Since f is an output in an always statement, not really a reg tho
    );
    
//    assign f = s ? w1 : w0;  //condition operator, dataflow modelling, but can be used in an always statement in a behav. model
    
    always @(w0, w1, s)  //block that's activated whenever the parameters in the sensitivity list change, inside the brackets
    begin
    
       f = s ? w1 : w0;  //don't use "assign" because it's not continuous assignment, it's proced. assignment
       //aka, the assignment only happens when the always block executes
    
    end
endmodule
