module pi_controller1(
  input wire clk,
  input wire rst,
  input wire signed [31:0] error,
  output reg signed [31:0] out
);

  parameter Kp = 1;
  parameter Ki = 1000;

  reg signed [31:0] integral = 0;
  reg signed [31:0] proportional = 0;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      integral     <= 0;
      proportional <= 0;
      out          <= 0;
    end else begin
      proportional <= error * Kp;
      integral     <= integral + error * Ki;
      out          <= proportional + integral;
    end
  end

endmodule
