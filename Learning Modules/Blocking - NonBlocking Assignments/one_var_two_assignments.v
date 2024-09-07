`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 11:34:50 PM
// Design Name: 
// Module Name: one_var_two_assignments
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


module one_var_two_assignments(
    input a,
    input b,
    output reg x
    );
    
    always @(a, b)//verilog allows multipl always statements
    begin
            x = a & b;
    end
    
    always @(a, b)
    begin
            x = a | b;// must only assign a var. in a SINGLE always block, since they all run at the same time--
            //--verilog doesn't know whether its a AND b, or, a OR b.
    end
endmodule
