`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:09:03 AM
// Design Name: 
// Module Name: bram_synch_one_port
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

//strictly follow these guidelines, --> synchronous single port bram
//single port is either read, or write at a given time. not both at once
module bram_synch_one_port
#(parameter ADDR_WIDTH = 10, DATA_WIDTH = 8)
    (
        input clk,//synch
        input we_a,//write enable, 'a' written for simplicity
        input [ADDR_WIDTH - 1: 0] addr_a,//port address
        input [DATA_WIDTH - 1: 0] din_a,//write data
        output reg [DATA_WIDTH - 1: 0] dout_a//read data
   );
   
   reg [DATA_WIDTH - 1: 0] memory [0: 2**ADDR_WIDTH - 1];//memory
    
                                                    //port 
    always @(posedge clk)//synch read or write
    begin
        if(we_a)
            memory[addr_a] <= din_a;
        dout_a <= memory[addr_a];
    end                                         
endmodule

