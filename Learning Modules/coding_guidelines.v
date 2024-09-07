`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 11:52:18 PM
// Design Name: 
// Module Name: coding_guidelines
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

// Vid 28
module coding_guidelines(
    input a, b, c,
    input clk,
    output reg f, g
    );
    
//    reg f_reg, f_next;; //output(Q)/current and input(D)/next_state of f register, respectively
//    reg g_reg, g_next; //output(Q) and input(D) of g register, respectively
    
//    always @(posedge clk) //register logic (sequential)
//    begin
//            f_reg <= f_next;// f FF
//            g_reg <= g_next;// g FF
//    end
  
  
//    always @(a, b, c, g_reg)// next state logic (comb.)
//    begin
//            f_next = a & ~g_reg;
//            g_next = b | c;
//    end
   
//    assign f = f_reg;
//    assign g = g_reg;

                                //Above code verbose, but too lengthy
                                
      always @(posedge clk)//more prone to errors
      begin
            f <= a & ~g;
            g <= b | c;  // Same code as above, just logically reduced and simplified
      end                          
            
            
endmodule
