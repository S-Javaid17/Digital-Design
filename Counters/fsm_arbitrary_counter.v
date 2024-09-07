`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/07/2024 07:50:57 AM
// Design Name: 
// Module Name: fsm_arbitrary_counter
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

//more or less the same, but can choose which numbers to count to in next state logic 
module fsm_arbitrary_counter(
    input clk,
    input reset_n,
    input en,
    output [2:0] num
    );
                                                               //state register logic
    
    reg [2:0] state_reg, state_next ; //3 bit 
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
                    s1: state_next = s6;                   
                    s2: state_next = s3;
                    s3: state_next = s4;
                    s4: state_next = s5;
                    s5: state_next = s1;
                    s6: state_next = s2;   //could mimick a dice roll
                    default: state_next = state_reg;
                endcase
        else
                state_next = state_reg;
   end
                                                              //output logic
    assign num = state_reg;        
endmodule    

