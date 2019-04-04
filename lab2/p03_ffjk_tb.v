module ffJK_tb;
reg J, K, clk;
wire Q, Qn;
  ffJK sh1(J, K, clk, Q, Qn);
initial begin
  J = 0; K = 0; clk = 0;
  forever #50 clk = ~clk;
end

initial begin
  #100 K = 1;
  #100 J = 1;
  #100;
  #100;
  #100 J = 1; K = 0;
  #100;
  #100 J = 0;
  $finish;
  end
endmodule  
