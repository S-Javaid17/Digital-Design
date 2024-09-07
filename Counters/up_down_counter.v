`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 08:43:32 AM
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter
#(parameter BITS = 4)    
    (
        input clk,
        input reset_n,
        input enable, // If low, hold on to value
        input up,// If low, count down
        output [BITS - 1: 0] Q
    );
    
    reg [BITS - 1: 0] Q_reg, Q_next;
       
        //register logic  
    always@(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                Q_reg <= 'b0;
            else if (enable)
                Q_reg <= Q_reg;
            else   
                Q_reg <= Q_next;
    end
    
            //next state logic
    always @(Q_reg, up)
    begin
    Q_next = Q_reg;    //default
        if (up)
            Q_next = Q_reg + 1;///count up from prev. value
        else    
            Q_next = Q_reg - 1; // for down counter
    end        
    
            //output logic
    assign Q = Q_next;        
endmodule