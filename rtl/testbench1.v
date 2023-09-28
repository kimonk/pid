`timescale 10ns/100ps

module testbench();

reg clk;

wire [11 : 0] CH0;
wire [11 : 0] CH1;

wire [31 : 0] triangular_output;
reg rst;

initial 
begin
clk = 0;
rst = 0;
#80
rst = 1;
#80
rst = 0;
end

always
begin
#10 clk = !clk;
end


wire ADC_SCLK;
wire ADC_CS_N;
wire ADC_DOUT;
wire ADC_DIN;
wire pwm_out;


           top u_top(
			  .clk       (clk),
			  .rst       (rst),
			  .ADC_SCLK  (ADC_SCLK),
			  .ADC_CS_N  (ADC_CS_N),
			  .ADC_DOUT  (ADC_DOUT),
			  .ADC_DIN   (ADC_DIN),
			  .pwm_out   (pwm_out)
			 );
			  
			  wire [31 : 0] result;
			  wire [31 : 0] pid_out;
			  wire [31 : 0] lim_out;
			  
			  localparam input_constant = 50;
			  
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
			 
			 signal_limiter u_signal_limiter1 (.signal_in  (pid_out), // input signed [31:0] signal_in,
                                            .signal_out (lim_out) // output reg signed [31:0] signal_out
                                           );
wire [31 : 0] sub2_out;
										 
          subtractor u_subtractor_2 (.signal1   (lim_out ), // input signal1,
                                     .input_pin (CH1     ), // input [7:0] input_pin,
                                     .result    (sub2_out) // output reg [31:0] result
                                    );

wire [31 : 0] pid2_out;
										
		    pi_controller1 u_pi_controller2(
           .clk   (clk    ),   // input wire [31:0] clk,
           .rst   (rst    ),   // input wire rst,
           .error (sub2_out ), // input wire signed [31:0] error,
           .out   (pid2_out)   // output reg signed [31:0] out
          );

wire [31 : 0] lim2_out;
			 
			 signal_limiter u_signal_limiter2 (.signal_in  (pid2_out), // input signed [31:0] signal_in,
                                            .signal_out (lim2_out) // output reg signed [31:0] signal_out
                                           );
										 
	       comparator u_comparator (.A  (lim2_out         ),  // input [31:0] A,
                                   .B  (triangular_output),  // input [31:0] B,
                                   .EQ (pwm_out          )   // output reg EQ
                                  );



			 triangular_signal u_triangular_signal (.clk               (clk),               // input [31:0] clk,
                                                 .triangular_output (triangular_output) // output reg signed [31:0] triangular_output
                                                );


		

endmodule