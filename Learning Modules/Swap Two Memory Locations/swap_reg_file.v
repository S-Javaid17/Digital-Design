`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2024 06:44:55 AM
// Design Name: 
// Module Name: swap_reg_file
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


module swap_reg_file
#(parameter ADDR_WIDTH = 7, DATA_WIDTH = 8)    
    (
        input clk,
        input reset_n,
        input we,
        input [ADDR_WIDTH - 1: 0] address_w, address_r,//the addresses to the register file won't always be the swap addresses --> can be in idle state as well.
        input [DATA_WIDTH - 1: 0] data_w,
        output [DATA_WIDTH - 1: 0] data_r,
        //for the swap fsm
        input swap,
        input [ADDR_WIDTH - 1: 0] address_A, address_B    
    );
    
    wire [1:0] sel;
    wire w;
    wire [ADDR_WIDTH - 1: 0] MUX_READ_f, MUX_WRITE_f;//the two 4x1, nbit multiplexers
    
    
    reg_file #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) REG_FILE
    (
        .clk(clk),
        .we(w ? 1'b1 : we),
        .address_w(MUX_WRITE_f),
        .address_r(MUX_READ_f),
        .data_w(w ? data_r : data_w),
        .data_r(data_r)
    );
    
    swap_fsm FSM0
    (
        .clk(clk), 
        .reset_n(reset_n),
        .swap(swap),
        .w(w),
        .sel(sel)
    );
    
    mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_READ
    (
        .w0(address_r),
        .w1(address_A),
        .w2(address_B),
        .w3('b0),
        .s(sel),
        .f(MUX_WRITE_f)
    );
    
    mux_4x1_nbit #(.N(ADDR_WIDTH)) MUX_WRITE
    (
        .w0(address_w),
        .w1('b0),
        .w2(address_A),
        .w3(address_B),
        .s(sel),
        .f(MUX_READ_f)
    );
endmodule
