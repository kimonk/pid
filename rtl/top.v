module top (input clk,
            input rst,
            // ADC SPI Interface
            output ADC_SCLK,
            output ADC_CS_N,
            input  ADC_DOUT,
            output ADC_DIN,
            output pwm_out
           );
			  
wire [31 : 0] result;
wire [31 : 0] pid_out;
wire [31 : 0] lim_out;
wire [11 : 0] CH0;
wire [11 : 0] CH1;
wire [31 : 0] triangular_output;
			  
wire [7 : 0]  input_constant;

assign input_constant = 'd50;

subtractor u_subtractor_1 (.signal1   (CH0           ), // input [31 : 0]
                           .input_pin (input_constant), // input [7:0] 
                           .result    (result        )  // output reg [31:0]
												 ); 												  
pi_controller1 u_pi_controller1(
 .clk   (clk),     // input wire [31:0] clk,
 .rst   (rst),     // input wire rst,
 .error (result),  // input wire signed [31:0] error,
 .out   (pid_out)  // output reg signed [31:0] out
);
			 
signal_limiter u_signal_limiter1 (.clk        (clk    ),
	                          .signal_in  (pid_out), // input signed [31:0] signal_in,
                                  .signal_out (lim_out) // output reg signed [31:0] signal_out
                                 );

wire [31 : 0] sub2_out;
										 
subtractor u_subtractor_2 (.signal1   (lim_out[11 : 0] ), // input signal1,
                           .input_pin (CH1[7 : 0]      ), // input [7:0] input_pin,
                           .result    (sub2_out        ) // output reg [31:0] result
                          );

wire [31 : 0] pid2_out;
										
pi_controller1 u_pi_controller2(
           .clk   (clk    ),   // input wire [31:0] clk,
           .rst   (rst    ),   // input wire rst,
           .error (sub2_out ), // input wire signed [31:0] error,
           .out   (pid2_out)   // output reg signed [31:0] out
          );

wire [31 : 0] lim2_out;
			 
signal_limiter u_signal_limiter2 (.clk        (clk     ),
                                  .signal_in  (pid2_out), // input signed [31:0] signal_in,
                                  .signal_out (lim2_out) // output reg signed [31:0] signal_out
                                 );
										 
comparator u_comparator (.A  (lim2_out         ),  // input [31:0] A,
                         .B  (triangular_output),  // input [31:0] B,
                         .EQ (pwm_out          )   // output reg EQ
                        );

triangular_signal u_triangular_signal (.clk               (clk),              // input [31:0] clk,
                                       .triangular_output (triangular_output) // output reg signed [31:0] triangular_output
                                      );


		
adc_controller u_adc_control(.CLOCK    (clk     ), // input  wire        CLOCK,    
                             .ADC_SCLK (ADC_SCLK), // output wire        ADC_SCLK, 
                             .ADC_CS_N (ADC_CS_N), // output wire        ADC_CS_N, 
                             .ADC_DOUT (ADC_DOUT), // input  wire        ADC_DOUT, 
                             .ADC_DIN  (ADC_DIN ), // output wire        ADC_DIN,  
                             .CH0      (CH0     ), // output wire [11:0] CH0,      
                             .CH1      (CH1     ), // output wire [11:0] CH1,      
                             .CH2      (        ), // output wire [11:0] CH2,   
                             .CH3      (        ), // output wire [11:0] CH3,   
                             .CH4      (        ), // output wire [11:0] CH4,   
                             .CH5      (        ), // output wire [11:0] CH5,   
                             .CH6      (        ), // output wire [11:0] CH6,   
                             .CH7      (        ), // output wire [11:0] CH7,    
                             .RESET    (rst     )  //input  wire        RESET    
                            );
endmodule
