`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 09:55:27 AM
// Design Name: 
// Module Name: pwm_improved
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

//We'll incorporate the D FF in the always block for seq. logi
module pwm_improved
#(parameter R = 8, TIMER_BITS = 15)
    (
    input clk,
    input reset_n,
    input [TIMER_BITS - 1: 0] FINAL_VALUE,//we'll compute this to generate a pwm for a desired freq
    input [R : 0] duty,
    output pwm_out
    );
    
    
    wire tick;//basically the enable pin for up counter 
    reg [R - 1: 0] Q_reg, Q_next;
    reg d_reg, d_next;
                                                            //register logic  
                                                            
    always@(posedge clk, negedge reset_n)//up counter and D FF
    begin
            if (!reset_n)
            begin
                Q_reg <= 'b0;
                d_reg <= 1'b0;
            end    
            else if (tick)   //counts if timer is done
            begin
                Q_reg <= Q_next;
                d_reg <= d_next;
            end
            else
            begin
                Q_reg <= Q_reg;  
                d_reg <= d_reg; 
            end     
    end
       
                                                            //next state logic
                                                            
    always @(*)
    begin
        Q_next = Q_reg + 1;///count up
        d_next = (Q_reg < duty);//assert pwm_out if the output of the counter is less than duty  
    end        
    
                                                           //output logic
                                                            
    assign pwm_out = d_reg; //output of dFF is pwm output  
        
                                                           //TIMER -- technically register logic, should be above, doesn't matter
    
    timer_input #(.BITS(TIMER_BITS))  timer0 
    (
    .clk(clk),
    .reset_n(reset_n),
    .enable(1'b1),//always want it enabled
    .FINAL_VALUE(FINAL_VALUE),
    .done(tick)//
    );

endmodule

