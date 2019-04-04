/* Descripcion HDL de un flip-flop tipo D*/
module ffD(D, CLK, Q);
  input D, CLK;
  output reg Q;
  always @ (posedge CLK)
  begin
    Q <= D;
  end
endmodule
