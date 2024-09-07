`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2024 10:30:46 AM
// Design Name: 
// Module Name: rgb_led_application
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

//v41
module rgb_led_application
#(parameter R = 8)    
    (
        input clk, 
        input reset_n,
        input change_color,//basically an enable pin to the registers
        input [R : 0] color_intensity,// 9 bit duty cycle value, connected to switched
        input [1:0] color_selector,// Really a LED selector, which will decide which LED register to update to change its respective duty
        output red_LED, green_LED, blue_LED, // to be connected to LEDs, the pwm_out value
        output red_JA //an output to see signal on oscilloscope
    );
    
    reg [R : 0] R_reg, R_next, G_next, G_reg, B_reg, B_next;  // 3 9 bit reg for each LED's duty cycle aka intensities
                                                                    
                                                                    //register logic
    always @(posedge clk, negedge reset_n)
    begin
            if (!reset_n)
            begin
                    R_reg <= 'b0;
                    G_reg <= 'b0;
                    B_reg <= 'b0;
            end        
            else if (change_color)//if button is held down, allow the update of reg values
            begin
                    R_reg <= R_next;
                    G_reg <= G_next;
                    B_reg <= B_next;
            end    
            else
            begin
                    R_reg <= R_reg;
                    G_reg <= G_reg;
                    B_reg <= B_reg;
            end    
    end
    
    
                                                                //next state logic
   always @(*)
   begin
        R_reg = R_reg;// def values
        G_reg = G_reg;
        B_reg = B_reg;
        case(color_selector)
                2'b00: R_next = color_intensity;
                2'b01: G_next = color_intensity;
                2'b10: B_next = color_intensity;
                default: 
                begin
                    R_reg = R_reg;// def values
                    G_reg = G_reg;
                    B_reg = B_reg; 
                end
        endcase
   end                             
                                                                //output logic
   
   rgb_driver #(.R(R)) LED16  //led on board layout
   (
        .clk(clk),
        .reset_n(reset_n),
        .red_duty(R_reg),
        .green_duty(G_reg),
        .blue_duty(B_reg),
        .red_LED(red_LED),
        .green_LED(green_LED),
        .blue_LED(blue_LED)
   );                    
   
   assign red_JA = red_LED;  //to test on oscilloscope                                    
endmodule
