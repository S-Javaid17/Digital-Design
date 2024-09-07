`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 07:55:27 PM
// Design Name: 
// Module Name: mux_2x1_dataflow
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


//STRUCTURAL modelling pt.1
module mux_2x1_dataflow(  //Same as previous, but we'll use a function to describe the hardware
input x1, x2, s,
output f
    );
   assign f = ~s & x2 | s & x1; //cont. assignment, so use "assign"
   //Meaning^, if anything on the RHS changes, the LHS of the function will also cont. change
    
endmodule
