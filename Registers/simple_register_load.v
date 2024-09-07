`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 04:35:35 AM
// Design Name: 
// Module Name: simple_register_load
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

//We'll modify it to create an enable pin, which'll either remember its old value, or store a new one
//We can call it a load pin aswell, it uses a mux
module simple_register_load 
#(parameter N = 4)  
    (
        input clk,
        input load,
        input [N - 1: 0] I,
        output [N - 1: 0] Q
    );
    
      reg [N - 1: 0]Q_reg, Q_next;;
      
      always@(posedge clk)
      begin
            Q_reg <= Q_next;
      end                
      
      always@(I, load)//combinational
      begin
            if (load)
                Q_next = I;//load on new value
            else
                Q_next = Q_reg;// remember/hold on to previous value
      end        
      
      assign Q = Q_reg;          
endmodule
