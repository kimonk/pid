module constant(
    input [31:0] clk,
    output reg [7:0] result
);

localparam MY_CONST = 50; // Define a constant value of 50 in decimal format

always @(posedge clk[31]) begin
    result <= MY_CONST; // Assign the constant value to the output port
end

endmodule