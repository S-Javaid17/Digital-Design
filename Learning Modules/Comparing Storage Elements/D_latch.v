`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 09:35:32 PM
// Design Name: 
// Module Name: D_latch
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

//Vid 26, we'll use behavioural modelling
module D_latch(
    input D,
    input clk,
    output reg Q,
    output Q_b
    );
    
     assign Q_b = ~Q;// not a necessary element

     always @(D, clk)
     begin
                Q = Q; //Def.
            if (clk)
                Q = D;
            else
                Q = Q;//clk not asserted
     end
    
endmodule
