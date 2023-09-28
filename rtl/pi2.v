module pi_controller2(
    input [31:0] clk,
    input signed [31:0] error,
    output reg signed [31:0] out
);

    parameter Kp = 0.1;
    parameter Ki = 100;

    reg signed [31:0] integral = 0;
    reg signed [31:0] proportional = 0;

    always @(posedge clk[31]) begin
        proportional <= error * $signed(Kp * 2**16);
        integral <= integral + error * $signed(Ki * 2**16);
        out <= proportional + integral;
    end

endmodule
