`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 03:42:35 AM
// Design Name: 
// Module Name: moore_3ff_011
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

//011 detectore with just 3 ff
module moore_3ff_011(
    input clk,
    input reset_n,
    input x,
    output y
    );
    
                                                            //register logic
    
    reg [2:0] state_reg, state_next ; //two state registers, 2^n (moore) states  
    
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
//            state_next[2] = x;
//            state_next[1] = state_reg[2];
//            state_next[0] = state_reg[1];
              state_next = {x, state_next[2:1]}; //concatenate, shorter  
    end                                                    
                                                            //output logic
    assign y = state_reg[2] & state_reg[1]& ~state_reg[0]; // ~CBA = y -->011 sequence                                                    
endmodule