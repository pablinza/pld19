/* Descripcion HDL de un flip-flop tipo JK
 * con entradas de control asincronas PRE
 * y CLR activas en bajo */

module ffJKpre(CLK, J, K, Q, Qn, PRE, CLR);
  input CLK, J, K, PRE, CLR;
  output Qn;
  output reg Q;
  always @(negedge CLK or PRE or CLR)
  begin
    if(PRE == 0)
      Q <= 1;
    if(CLR == 0)
        Q <= 0;
    if((PRE == 1) && (CLR == 1))
    begin
      case({J,K})
      2'b00 : Q <= Q;
      2'b01 : Q <= 0;
      2'b10 : Q <= 1;
      2'b11 : Q <= ~Q;
      endcase
    end
  end
  assign Qn = ~Q;
endmodule