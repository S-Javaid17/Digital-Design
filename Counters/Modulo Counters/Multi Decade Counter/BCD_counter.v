`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 01:59:53 AM
// Design Name: 
// Module Name: BCD_counter
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


module BCD_counter(//counts 0-->9 and resets, and can be cascaded for multipe bits wide (0-->9-->99-->999 etc)
    input clk,
    input reset_n,
    input enable,
    output [3: 0] Q,
    output done //so that we can instantiate and cascade
    );
    
    reg [3:0] Q_reg, Q_next;
                                              // Register Logic
    always@(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                Q_reg <= 'b0;
            else if (enable)
                Q_reg <= Q_next;    
            else
                Q_reg <= Q_reg; 
    end
    
                                                //Next State Logic
    // logical question. done is true if Q_reg reaches its final value, otherwise false
    assign done = Q_reg == 9;// 
    always @(*)
    begin
        Q_next = done? 'b0 : Q_reg + 1;// reset to 0 if done, otherwise add one
    end  
    
                                                //Output Logic
    assign Q = Q_reg;   
    endmodule