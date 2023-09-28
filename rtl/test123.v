module pi_controller (
  input clk,
  input reset_n,
  input signed [15:0] error,
  output signed [15:0] control
);

  reg signed [31:0] sum = 0;
  reg signed [15:0] Kp = 10;
  reg signed [15:0] Ki = 5;
  reg signed [15:0] integral = 0;

  always @(posedge clk or negedge reset_n) begin
    if (~reset_n) begin
      sum <= 0;
      integral <= 0;
    end else begin
      integral <= integral + error;
      sum <= (Kp * error) + (Ki * integral);
    end
  end

  assign control = sum[15:0];

endmodule