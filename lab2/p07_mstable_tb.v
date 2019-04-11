/* Prueba de temporizador generico no redisparable */
module mstable_test;
reg start, clk;
wire out;
timer t0(.clk(clk), .start(start), .out(out));
defparam t0.DIVCLK = 10;
initial begin
  start = 0; clk = 0;
  forever #50 clk = ~clk;
end
initial begin
  #200 start = 1;
  #100 start = 0;
end
endmodule




