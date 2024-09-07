`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2024 04:16:18 AM
// Design Name: 
// Module Name: simple_register
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


module simple_register
  #(parameter N = 4)  
    (
        input clk,
        input [N - 1: 0] I,
        output [N - 1: 0] Q
    );
                                        //Structural modelling of regs
//    genvar k;
//    generate
//            for(k = 0; k < N; k = k+1)
//            begin: FF
//                D_FF_reset FF (
//                .clk(clk),
//                .D(I[k]),
//                .Q(Q[k]),
//                .reset_n(), .clear_n()
//                );
//            end
//    endgenerate

                                        //Behavioural Modelling
      reg [N - 1: 0]Q_reg;
      reg [N - 1: 0]Q_next;
      
      always@(posedge clk)
      begin
            Q_reg <= Q_next;
      end                
      
      always@(I)//combinational
      begin
            Q_next = I;
      end        
      
      assign Q = Q_reg;          
endmodule
