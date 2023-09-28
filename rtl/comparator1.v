module comparator(
    input logic [31:0] input_a,
    input logic [31:0] input_b,
    output logic out
);

assign out = (input_a > input_b) ? 1 : 0;

endmodule