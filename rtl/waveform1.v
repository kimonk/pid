module triangular_wave(
    output signed [15:0] waveform,
    input [31:0] counter,
    input clk,
    input rst_n
);

logic signed [15:0] triangle_value;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        triangle_value <= 0;
    else if (counter == 0)
        triangle_value <= -32768;
    else if (counter == 999)
        triangle_value <= 32767;
    else if (counter < 500)
        triangle_value <= triangle_value + 32;
    else
        triangle_value <= triangle_value - 32;
end

assign waveform = triangle_value[15:0] / 32767;

endmodule