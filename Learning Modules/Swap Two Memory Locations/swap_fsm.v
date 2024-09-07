`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2024 06:33:01 AM
// Design Name: 
// Module Name: swap_fsm
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

//just the fsm for the memory swapper, not the memory swapper
module swap_fsm(
    input clk, reset_n,
    input swap,
    output w,
    output [1:0] sel
    );
                                                        //state register logic
                                                    
   reg [1:0] state_reg, state_next;//number of registers
   parameter s0 = 0, s1 = 1, s2 =2, s3 = 3;//states                         
   
   always @(posedge clk, negedge reset_n)
   begin
            if(~reset_n)
                state_reg <=s0;
            else
                state_reg <= state_next;
   end                    
   
                                                        //next state logic
   always @(*)
   begin
        state_next = state_reg;//def.
        case(sel)
            s0: if(~swap)
                    state_next = s0;
                else
                    state_next = s1;
            s1: state_next = s2;//unconditional
            s2: state_next = s3;
            s3: state_next = s0;
            default: state_next = s0;
        endcase
   end             
                                                        //output logic      
                                                         
   assign sel = state_reg;//designed such that the state number is the same as the select input 
   assign w = (state_reg != s0);//w is 1 unless in state s0                                                         
endmodule
