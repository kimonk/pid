module comparator (
    input [31:0] A,
    input [31:0] B,
    output reg EQ
);

always @* begin
    EQ = (A > B) ? 1'b1 : 1'b0;
end

endmodule