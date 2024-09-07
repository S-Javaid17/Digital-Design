`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 08:01:37 AM
// Design Name: 
// Module Name: ram_2ports
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

//2 port ram, 1 asynch read, 1 synch write
module ram_2ports
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)//so 2^3 = 8 total addresses, and 64 bits of total data in the array
    (
        input clk,
        input we,
        input [ADDR_WIDTH - 1: 0] r_addr,
        input [ADDR_WIDTH - 1: 0] w_addr,
        input [DATA_WIDTH - 1: 0] w_data,
        output [DATA_WIDTH - 1: 0] r_data
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2**ADDR_WIDTH - 1];//memory array, data width goes first to describe each row as a register,
                                                   // then goes the address length, from top to bottom, like an array, but not actually an array
    
    always @(posedge clk)//synch write port
    begin
        if(we)
            memory[w_addr] <= w_data;
    end
    
    assign r_data = memory[r_addr]; //asynch read                                           
endmodule
