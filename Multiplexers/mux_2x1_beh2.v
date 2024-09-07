`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2024 08:28:28 PM
// Design Name: 
// Module Name: mux_2x1_beh2
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

//BEHAVIOURAL modelling part 2
module mux_2x1_beh2(
    input x1,
    input x2,
    input s,
    output reg f
    );
    //Can also use case statements
always @(x1, x2, s)
begin

case(s)
    1'b1: f = x2;
    1'b0: f = x1;
    default: f = 1'bx;
endcase
end
endmodule
