module pi_controller1(
    input clk,
    input signed error,
    output reg signed out
);

    parameter Kp = 1;
    parameter Ki = 1000;

    reg signed [31:0] integral = 0;
    reg signed [31:0] proportional = 0;

    always @(posedge clk) begin
        proportional <= error * Kp;
        integral <= integral + error * Ki;
        out <= proportional + integral;
    end

endmodule