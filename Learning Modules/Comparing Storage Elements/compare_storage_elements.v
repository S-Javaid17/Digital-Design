`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2024 09:52:57 PM
// Design Name: 
// Module Name: compare_storage_elements
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


module compare_storage_elements(// Will instantiate the storage elements and then use a TB to test them at once
    input clk, D,
    output Qa, Qb, Qc
    );
    
    D_latch L0 (
        .D(D), .Q(Qa), .clk(clk)
    );
    
    D_FF_neg FFn (
        .D(D), .Q(Qb), .clk(clk)
    );
    
    D_FF_pos FFp (
        .D(D), .Q(Qc), .clk(clk)
    );
    
endmodule
