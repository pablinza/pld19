/* Descripcion HDL de un flip-flop tipo JK*/
module ffJK(J, K, clk, Q, Qn);
  input J, K, clk;
  output Qn;
  output reg Q;
  always @(negedge clk)
  begin
    case({J,K})
    2'b00 : Q <= Q;
    2'b01 : Q <= 0;
    2'b10 : Q <= 1;
    2'b11 : Q <= ~Q;
    endcase
  end
  assign Qn = ~Q;
endmodule
  
