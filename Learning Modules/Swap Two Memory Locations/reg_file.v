`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2024 06:14:40 AM
// Design Name: 
// Module Name: reg_file
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

//many registers put together
module reg_file
 #(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)//2^7 address locations, each 8 bits or 1 byte long   
    (
        input clk, 
        input we,//write enable
        input [ADDR_WIDTH - 1: 0] address_w, address_r,
        input [DATA_WIDTH - 1: 0] data_w,
        output [DATA_WIDTH - 1: 0] data_r
    );
    
    reg [DATA_WIDTH - 1: 0] memory [0: 2 ** ADDR_WIDTH - 1];//the register file is 2^N*BITS in size, the BITS being DATA_WIDTH,
                                                            // and 2^N being the 2 ** ADDR_WIDTH - 1 part
                                                            
   always @(posedge clk)
   begin
        //synchronous write port
        if (we)
        memory[address_w] <= data_w; //write, in memory, to the given address location the value of data_w
   end                                                     
   
    //asynchronous read port
    assign data_r = memory[address_r];// the data coming out is simply attained from the memory address given
endmodule
