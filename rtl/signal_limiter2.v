module signal_limiter (input                     clk,
	               input signed      [31:0] signal_in,
                       output reg signed [31:0] signal_out
                      );

always @(posedge clk) begin
    if (signal_in < -1)
        signal_out = -1;
    else if (signal_in > 1)
        signal_out = 1;
    else
        signal_out = signal_in;
end

endmodule
