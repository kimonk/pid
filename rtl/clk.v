module clk_generator(
  output reg [31:0] clk
);

parameter PERIOD = 20;

reg [31:0] counter;

always @(posedge $timeunit)
begin
  counter <= counter + 1;
  if (counter >= ((PERIOD/($timeunit))*1000_000)) begin
    counter <= 0;
    clk <= ~clk;
  end
end

initial begin
  clk <= 0;
  counter <= 0;
end

endmodule