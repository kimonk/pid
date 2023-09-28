module pi_controller1(
    input [31:0] clk,
    input signed [31:0] error,
    output reg signed [31:0] out
);

    parameter Kp = 1;
    parameter Ki = 1000;

    reg signed [31:0] integral = 0;
    reg signed [31:0] proportional = 0;

    always @(posedge clk[31]) begin
        proportional <= error * Kp;
        integral <= integral + error * Ki;
        out <= proportional + integral;
    end

endmodule