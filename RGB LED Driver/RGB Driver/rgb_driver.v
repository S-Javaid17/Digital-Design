`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:30:46 AM
// Design Name: 
// Module Name: rgb_driver
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

//creating a driver for a rgb LED on NEXYS A7, basically 3 circuits that'll drive the 3 LEDs
module rgb_driver
#(parameter R = 8)
    (
        input clk,
        input reset_n,
        input [R:0] red_duty, green_duty, blue_duty,// what the user will set/change to control the rgb 
        output red_LED, green_LED, blue_LED//pwm outputs
    );
    
    localparam TIMER_BITS = 8;
    localparam FINAL_VALUE = 195;//this controls the PWM switching freq -->  ~2KHz, calc. done in notes
                                                                                
                                                                                //RED
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) RED (
            .clk(clk), 
            .reset_n(reset_n), 
            .FINAL_VALUE(FINAL_VALUE), 
            .duty(red_duty), 
            .pwm_out(red_LED)
    );
                                                                                //GREEN
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) GREEN (
            .clk(clk), 
            .reset_n(reset_n), 
            .FINAL_VALUE(FINAL_VALUE), 
            .duty(green_duty), 
            .pwm_out(green_LED)
    );
                                                                                //BLUE
    pwm_improved #(.R(R), .TIMER_BITS(TIMER_BITS)) BLUE (
            .clk(clk), 
            .reset_n(reset_n), 
            .FINAL_VALUE(FINAL_VALUE), 
            .duty(blue_duty), 
            .pwm_out(blue_LED)
    );
    
    endmodule
