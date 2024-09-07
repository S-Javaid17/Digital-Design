`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 03:38:34 AM
// Design Name: 
// Module Name: moore_011_detector
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


module moore_011_detector(
    input clk,
    input reset_n,
    input x,
    output y
    );
    
                                                            //register logic
    
    reg [1:0] state_reg, state_next ; //two state registers, 2^n (moore) states  
    
    always@ (posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                state_reg <= 'b0;
            else
                state_reg <= state_next;
    end                                            
                                                            //next state logic
    
    always @(x, state_reg)
    begin
            state_next[1] = (state_reg[1] ^ state_reg[0]) & x;//(A^B)x = A'
            state_next[0] = (state_reg[1] & ~state_reg[0]) | ~x;//(~BA)+x = B'
    end                                                    
                                                            //output logic
    assign y = state_reg[1] & state_reg[0]; // AB = y                                                    
endmodule
