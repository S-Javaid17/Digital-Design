`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 08:36:31 AM
// Design Name: 
// Module Name: up_counter
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


module up_counter
#(parameter BITS = 4)    
    (
        input clk,
        input reset_n,
        output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
       
        //register logic  
    always@(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                Q_reg <= 'b0;
            else    
                Q_reg <= Q_next;
    end
    
            //next state logic
    always @(Q_reg)
    begin
        Q_next = Q_reg + 1;///count up from prev. value
        //Q_next = Q_reg - 1; // for down counter
    end        
    
            //output logic
    assign Q = Q_next;        
endmodule
