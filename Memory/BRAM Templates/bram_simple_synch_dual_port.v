`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:04:11 AM
// Design Name: 
// Module Name: bram_simple_synch_dual_port
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

//strictly follow these guidelines, --> simple synchronous dual port bram
//one port is read and another is write
module bram_simple_synch_dual_port
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 8)
    (
        input clk,//synch
        input we,//write enables for write port
        input [ADDR_WIDTH - 1: 0] addr_r, addr_w,//address of port read and write
        input [DATA_WIDTH - 1: 0] din,//data write
        output reg [DATA_WIDTH - 1: 0] dout//data read, synch
   );
   
   reg [DATA_WIDTH - 1: 0] memory [0: 2**ADDR_WIDTH - 1];//memory
    
                                                    //read and write ports
    always @(posedge clk)//synch read and write
    begin
        if(we)
            memory[addr_w] <= din;
        dout <= memory[addr_r];
    end                                          
endmodule