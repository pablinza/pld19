module astable_test;
  reg clk;
  wire out;
  timerosc osc1(clk, out);
  defparam osc1.DIVCLK = 1;
  initial begin
    clk = 0;
    forever #50 clk = ~clk;
  end
endmodule
    
