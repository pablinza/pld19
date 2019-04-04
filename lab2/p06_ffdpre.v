/* Descripcion HDL de un flip-flop tipo D
 * con entradas de control asincronas PRE
 * y CLR activas en bajo */

module ffDpre(D, CLK, Q, PRE, CLR);
  input D, CLK, PRE, CLR;
  output reg Q;
  always @ (posedge CLK)
  begin
    if(PRE == 0)
      Q <= 1;
    if(CLR == 0)
        Q <= 0;
    if((PRE == 1) && (CLR == 1))    
      Q <= D;
  end
endmodule
