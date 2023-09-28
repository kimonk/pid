`timescale 10ns/100ps

module testbench();

wire ADC_SCLK;
wire ADC_CS_N;
reg ADC_DOUT;
wire ADC_DIN;
wire pwm_out;

reg clk;

reg rst;

initial 
begin
clk = 0;
rst = 0;
#80
rst = 1;
#80
rst = 0;
wait (ADC_CS_N == 1'b0);
ADC_DOUT = 0;
#80
ADC_DOUT = 1;
#240;

end


always
begin
#10 clk = !clk;
end





           top u_top(
			  .clk       (clk),
			  .rst       (rst),
			  .ADC_SCLK  (ADC_SCLK),
			  .ADC_CS_N  (ADC_CS_N),
			  .ADC_DOUT  (ADC_DOUT),
			  .ADC_DIN   (ADC_DIN),
			  .pwm_out   (pwm_out)
			 );

endmodule