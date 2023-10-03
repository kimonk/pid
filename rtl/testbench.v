`timescale 10ns/100ps

module testbench();

wire ADC_SCLK;
wire ADC_CS_N;
reg ADC_DOUT;
wire ADC_DIN;
wire pwm_out;

reg clk;

reg rst;

integer cycle_cnt;

initial 
begin
	cycle_cnt = 0;
    clk = 0;
    rst = 0;
    #80
    rst = 1;
    #80
    rst = 0;
    wait (ADC_CS_N == 1'b0);
    ADC_DOUT = 0;
	while(cycle_cnt < 100) begin
	  while (cycle_cnt < 4) begin
	    @(negedge ADC_SCLK)
	    cycle_cnt++;
	  end
	  cycle_cnt = 0;
      while (cycle_cnt < 12) begin
	    @(negedge ADC_SCLK)
		ADC_DOUT = $urandom_range(0, 1);
	    cycle_cnt++;
	  end
	  cycle_cnt = 0;
      ADC_DOUT = 0;
	end

end

always
begin
#10 clk = !clk;
end

           top u_top(
			  .clk       (clk      ),       // In
			  .rst       (rst      ),       // In
			  .ADC_SCLK  (ADC_SCLK ),       // Out
			  .ADC_CS_N  (ADC_CS_N ),       // Out
			  .ADC_DOUT  (ADC_DOUT ),       // In
			  .ADC_DIN   (ADC_DIN  ),       // Out
			  .pwm_out   (pwm_out  )        // Out
			 );

endmodule