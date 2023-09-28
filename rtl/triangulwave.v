module triangular_signal(
  input [31:0] clk,
  output reg signed [31:0] triangular_output
);

  parameter CNT_MAX = 2500; // sets frequency of the signal to 10 kHz
  reg signed [31:0] cnt_reg = 0;
  reg direction = 1'b1;

  always @(posedge clk[31]) begin
    if (cnt_reg == CNT_MAX - 1) begin
      direction <= ~direction;
      cnt_reg <= 0;
    end else begin
      cnt_reg <= cnt_reg + 1;
    end
    if (direction) begin
      triangular_output <= cnt_reg * 2 - CNT_MAX;
    end else begin
      triangular_output <= CNT_MAX - (cnt_reg * 2);
    end
  end
endmodule







