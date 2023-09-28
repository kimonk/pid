module clk_generator32(
  output reg [31:0] clk
);

parameter PERIOD = 15624; // 50 MHz / 3.2 MHz = 15624

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
