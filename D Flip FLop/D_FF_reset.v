`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 03:48:31 AM
// Design Name: 
// Module Name: D_FF_reset
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


module D_FF_reset(
input clk, D, 
input reset_n, //asynch
input clear_n,//reset low, synch
output Q
    );
    
    reg Q_reg, Q_next;// to make code more robust
    
    always @(negedge clk, negedge reset_n)//Asynch Thus, this code block will occur irrespective of clock, if reset_n changes
    begin
            Q_reg <= Q_next;
            if (!reset_n)
                    Q_reg <= 1'b0;
            else 
                    Q_reg <= Q_next;//output routed to input
            end
    
    
    always@(D, clear_n)//combinational
    begin
            Q_next = Q_reg;
            if(!clear_n)
                Q_next = 1'b0;//D is hardwired to 0, rather than the clock and D
            else
                Q_next = D;//D routed to input
    end  
    
            assign Q = Q_reg;
endmodule
