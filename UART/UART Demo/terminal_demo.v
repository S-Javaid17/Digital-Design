`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/13/2024 06:52:11 PM
// Design Name: 
// Module Name: terminal_demo
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


module terminal_demo

    (
        input clk, reset_n,
        
        //receiver
         input rd_uart,// push-button on left 
         input rx,
         output rx_empty,//led0
                  
        //transmitter
         input wr_uart,// push-button on right 
         output tx,
         output tx_full, //led1
         input [7: 0] w_data,//SW0-->SW7
            
        //sseg signals
        output [6: 0] sseg,
        output [0:7] AN,
        output DP
    );
    
                                            //Rx push-button with debouncer and synchronizers
                                            
    button read_uart 
    (
        .clk(clk), 
        .reset_n(reset_n),
        .noisy(rd_uart),
        .debounced(),
        .p_edge(rd_uart_pedge), 
        .n_edge(), 
        ._edge()
    );

                                            //Tx push-button with debouncer and synchronizers
                                            
    button write_uart 
    (
        .clk(clk), 
        .reset_n(reset_n),
        .noisy(wr_uart),
        .debounced(),
        .p_edge(wr_uart_pedge), 
        .n_edge(), 
        ._edge()
    );   

                                            //UART Driver 
                                            
   wire [7: 0] r_data;
   uart #(.DBIT(8), .SB_TICK(16)) uart_driver
   (
        .clk(clk),
        .reset_n(reset_n),
        
        //receiver
        .rd_uart(rd_uart_pedge), 
        .rx(rx),
        .rx_empty(rx_empty),
        .r_data(r_data),
         
        //transmitter
        .wr_uart(wr_uart_pedge), 
        .tx(tx),
        .tx_full(tx_full),
        .w_data(w_data),
            
        //baud rate generator
        .TIMER_FINAL_VALUE(11'd650)// gives a 9600 baud rate
   );
   
                                    //Driver for SSEG Display  
                                    
   sseg_driver seven_segment_driver
   (
        .clk(clk),
        .reset_n(reset_n),
        .I0({1'b1, w_data[3: 0], 1'b0}),
        .I1({1'b1, w_data[7: 4], 1'b0}),
        .I2(6'd0),
        .I3(6'd0),
        .I4(6'd0),
        .I5(6'd0),
        .I6({~rx_empty, r_data[3: 0], 1'b0}),
        .I7({~rx_empty, r_data[7: 4], 1'b0}),
        .AN(AN),
        .sseg(sseg),
        .DP(DP)
   );                               
endmodule
