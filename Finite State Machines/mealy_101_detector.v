`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 05:39:10 AM
// Design Name: 
// Module Name: mealy_101_detector
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

//We will implement the fsm by just describing the state transition diagram
//49
module mealy_101_detector(
    input clk,
    input reset_n,
    input x,
    output y
    );
                                                            //state register logic
    
    reg [1:0] state_reg, state_next ; //two state registers, 2^n -1 (mealy) states  
    localparam s0 = 0;//the different number states are a signed a [binary] digit (just written in decimal)
    localparam s1 = 1;
    localparam s2 = 2;
    
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
                        state_next = s1;
                    else
                        state_next = s0;
            
            default: state_next = state_reg;//stay in the same state, can be anything else
            
        endcase
    end                                                    
                                                            //output logic
    assign y = (state_reg == s2) & x;//if we're in state 2 and x is asserted, then y is asserted                                                    
endmodule