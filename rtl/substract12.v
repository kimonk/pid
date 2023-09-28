module subtractor(
    input signal1,
    input [7:0] input_pin,
    output reg [31:0] result
);

always @(*) begin
    result = signal1 - input_pin;
end

endmodule