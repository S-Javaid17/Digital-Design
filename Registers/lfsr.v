`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 01:24:14 PM
// Design Name: 
// Module Name: lfsr
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

//for max length lsfr taps, check table 3 from below:
// https://www.xilinx.com/support/documentation/application_notes/xapp052.pdf
module lfsr
#(parameter N = 3)//change tap xor order, according to doc, to get longest sequence
    (
        input clk,
        input reset_n,
        output [1:N] Q // the document from xilinx uses this convention
    );
    
    reg [N:1] Q_reg, Q_next;
    wire taps;
                                                            //register logic
    always @(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
                    Q_reg <= 'b1;// lsfr shouldn't start with 0 if built with xor, or 1s if built with xnor (will get stuck)
            else
                    Q_reg <= Q_next;
    end
                                                            //next state logic
                                                        
   always @(taps, Q_reg)
//   begin
   Q_next = {taps, Q_reg[1:N-1]};//concatenate  --> right shift
//   end
                                                            //output logic
   
   assign Q = Q_reg;
   assign taps = Q_reg[3]^Q_reg[2];                                                     
endmodule
