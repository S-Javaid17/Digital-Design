`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 07:50:05 AM
// Design Name: 
// Module Name: fsm_counter
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

//can implement a counter as a simple fsm, which counts if enabled, or stays the same if not
module fsm_counter(
    input clk,
    input reset_n,
    input en,
    output [2:0] num
    );
                                                               //state register logic
    
    reg [2:0] state_reg, state_next ; //3 bit counter
    localparam s0 = 0, s1 = 1, s2 = 2, s3 = 3,
               s4 = 4, s5 = 5, s6 = 6, s7 = 7;
    
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
        if(en)//count if enabled
                case(state_reg)
                    s0: state_next = s1;
                    s1: state_next = s2;                   
                    s2: state_next = s3;
                    s3: state_next = s4;
                    s4: state_next = s5;
                    s5: state_next = s6;
                    s6: state_next = s7;
                    s7: state_next = s0;     
                    default: state_next = state_reg;
                endcase
        else
                state_next = state_reg;
   end
                                                              //output logic
    assign num = state_reg;        
endmodule