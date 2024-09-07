`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/11/2024 09:19:25 AM
// Design Name: 
// Module Name: rom_with_file
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


module rom_with_file
#(parameter ADDR_WIDTH = 3, DATA_WIDTH = 2)    //2^3 * 2 = 16 bits
    (
        input [ADDR_WIDTH - 1: 0] addr,
        output [DATA_WIDTH - 1: 0] data
    );
    
    reg [DATA_WIDTH - 1: 0] rom [0: 2 ** ADDR_WIDTH - 1];//rom memory
    
    //very important to use an initial block
    initial//will allow us to initialize the memory, aka give it default values
   
   //system function
    $readmemb("truth_table.mem", rom);  // read a memory file that's in binary --> $readmemb,  $readmemh for hex memory file etc.
    //read the memory file --> truth_table.mem, and store it in the memory array called 'rom'
    //can parameterize the file
    
    //read only, asynch
    assign data = rom[addr];//read port
endmodule
