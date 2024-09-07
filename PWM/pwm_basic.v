`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 04:46:58 AM
// Design Name: 
// Module Name: pwm_basic
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


module pwm_basic
#(parameter R = 8)//resolution, decided during instantiation, not up to user
    (
    input clk,
    input reset_n,
    input [R - 1: 0] duty,//is a (user) input of length R-1 bits, we can change duty as necessary
    output pwm_out
    );
    
    reg [R - 1: 0] Q_reg, Q_next;
       
                                                            //register logic  
                                                            
    always@(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                Q_reg <= 'b0;
            else    
                Q_reg <= Q_next;
    end
    
                                                            //next state logic
                                                            
    always @(*)
    begin
        Q_next = Q_reg + 1;///count up
    end        
    
                                                            //output logic
                                                            
    assign pwm_out = (Q_reg < duty); //assert pwm_out if the output of the counter is less than duty    
endmodule
