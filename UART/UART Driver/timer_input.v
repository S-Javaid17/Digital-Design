`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 03:33:29 AM
// Design Name: 
// Module Name: timer_input
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

//same as modulus counter, but now the final_value is a (user) input, and can be changed as desired when implemented
//it is not a parameter, in which case it would be determined by the designer during instantiation, and never changed again
module timer_input
#(parameter BITS = 4)
    (
    input clk,
    input reset_n,
    input enable,
    input [BITS - 1: 0] FINAL_VALUE,
    output done
    );
    
reg [BITS-1:0] Q_reg, Q_next;
                                              // Register Logic
    always@(posedge clk, negedge reset_n)
    begin
            if (~reset_n)
                Q_reg <= 'b0;
            else if (enable)
                Q_reg <= Q_next;    
            else
                Q_reg <= Q_reg; 
    end
    
                                                //Next State Logic
    assign done = Q_reg == FINAL_VALUE;
    always @(*)
        Q_next = done? 'b0 : Q_reg + 1;// reset to 0 if done, otherwise add one  
    
      
endmodule
