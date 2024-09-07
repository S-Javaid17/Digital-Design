`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 08:28:43 AM
// Design Name: 
// Module Name: ram_3ports
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

//2 port ram, 1 asynch read, 1 synch read, 1 synch write
module ram_3ports
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
    (
        input clk,
        input we,
        input [ADDR_WIDTH - 1: 0] r_addr0,
        input [ADDR_WIDTH - 1: 0] r_addr1,
        input [ADDR_WIDTH - 1: 0] w_addr,
        input [DATA_WIDTH - 1: 0] w_data,
        output [DATA_WIDTH - 1: 0] r_data0,
        output reg [DATA_WIDTH - 1: 0] r_data1//reg since its synch and in a n always
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2**ADDR_WIDTH - 1];
    
    always @(posedge clk)//synch write port
    begin
        if(we)
            memory[w_addr] <= w_data;
        r_data1 <= memory[r_addr1];
    end
    
    assign r_data0 = memory[r_addr0]; //asynch read 1 
//    assign r_data1 = memory[r_addr1]; //if you want asynch read 2, just replicate                                                                                  
endmodule