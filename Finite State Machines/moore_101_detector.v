`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 05:39:10 AM
// Design Name: 
// Module Name: moore_101_detector
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


module moore_101_detector(
    input clk,
    input reset_n,
    input x,
    output y
    );
                                                            //state register logic
    
    reg [1:0] state_reg, state_next ; //two state registers, 2^n (moore) states  
    localparam s0 = 0;//the different number states are a signed a [binary] digit (just written in decimal)
    localparam s1 = 1;
    localparam s2 = 2;
    localparam s3 = 3;
    
    always@ (posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                state_reg <= s0;//go to state 0 if reset_n is asserted
            else
                state_reg <= state_next;
    end                                            
                                                            //next state logic
    //here we describe the state diagram
    always @(*)
    begin
        case(state_reg)
            s0://what state is it currently in
                    if(x)
                        state_next = s1;
                    else
                        state_next = s0;            
            s1:
                    if(x)
                        state_next = s1;
                    else
                        state_next = s2;
            
            s2:
                    if(x)
                        state_next = s3;
                    else
                        state_next = s0;
                    
            s3:
                    if(x)
                        state_next = s1;
                    else
                        state_next = s2;
                     
            default: state_next = state_reg;//stay in the same state, can be anything else
            
        endcase
    end                                                    
                                                            //output logic
    assign y = (state_reg == s3);//if we're in state 3, then y is asserted. Since in that state the sequence was reached                                                    
endmodule