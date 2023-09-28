module subtractor2(
    input [31:0] signal1,
    input input_pin,
    output reg [31:0] result
);

always @(*) begin
    result = signal1 - input_pin;
end

endmodule