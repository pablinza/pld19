/* Test para prueba del latchSR */
module latchSR_test;
  reg S, R;
  wire Q, Qn;
  latchSR latch1(S, R, Q, Qn); 
  initial begin
    #105 S = 1; R = 1;
    #100 S = 0; R = 1;
    #100 S = 1; R = 1;
    #100 S = 1; R = 0;
    #100 S = 1; R = 1;
    #100 S = 0; R = 1;
    end
endmodule
