`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 07:20:22 AM
// Design Name: 
// Module Name: priority_encoder_generic
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


module priority_encoder_generic
#(parameter N = 4)
    (
        input [N - 1: 0] w, 
        output z,
        output reg [$clog2(N) - 1: 0] y
    );
    
        assign z = |w;
        integer k;
    
    always@ (w)
    begin
    y = 'bx;// def
        for(k=0; k<N; k=k+1)
            if (w[k])
                y = k;// if the kth index of w is asserted, y is that value (can write in decimal in this case)
        end
    
endmodule
