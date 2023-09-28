module clk_generator1(
  output reg [31:0] clk
);

parameter PERIOD = 2000;

reg [31:0] counter;

always @(posedge clk[31])
begin
  counter <= counter + 1;
  if (counter >= (PERIOD - 1)) begin
    counter <= 0;
    clk <= ~clk;
  end
end

initial begin
  clk <= 0;
  counter <= 0;
end

endmodule
