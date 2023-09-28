module signal_limiter(input signed [31:0] signal_in,
                      output reg signed [31:0] signal_out
                     );

always @(*) begin
    if (signal_in < 0)
        signal_out = 0;
    else if (signal_in > 1000)
        signal_out = 1000;
    else
        signal_out = signal_in;
end

endmodule