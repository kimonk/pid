module if_example(
    input logic a,
    output logic result
);

always_comb begin
    if (a > 0) // Condition for the "if" statement
        result = 1; // Statement to be executed if the condition is true
    else
        result = 0; // Statement to be executed if the condition is false
end

endmodule