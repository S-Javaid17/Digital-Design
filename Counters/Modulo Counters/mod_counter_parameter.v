`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 12:48:02 AM
// Design Name: 
// Module Name: mod_counter_parameter
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


//counter value as a parameter
module mod_counter_parameter
#(parameter FINAL_VALUE = 9)    //9 inclusive
    (
    input clk,
    input reset_n,
    input enable,
    output [BITS - 1: 0] Q
    );

    localparam BITS = $clog2(FINAL_VALUE);//number of bits 
    reg [BITS-1:0] Q_reg, Q_next;
    wire done;  
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
    assign done = Q_reg == FINAL_VALUE;
    always @(*)
    begin
        Q_next = done? 'b0 : Q_reg + 1;// reset to 0 if done, otherwise add one
    end  
    
                                                //Output Logic
    assign Q = Q_reg;             
      
endmodule