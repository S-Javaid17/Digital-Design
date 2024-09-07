`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 06:42:53 AM
// Design Name: 
// Module Name: decoder_generic
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


module decoder_generic
#(parameter N = 4)
    (
        input [N - 1: 0] w,
        input en,
        output reg [0 : 2**N - 1] y
    );
    
    always @ (w, en)
    begin
        y = 'b0;// default     
        if (en)
        begin
        y[w] = 1'b1;  //enter any routing network here (case, if-else etc..)
        end
        else
        y = 'b0;// no hot output  
            
    end
    
endmodule
