/* Descripcion HDL de un latch tipo D*/
module latchD(inD, inE, outQ);
  input inD, inE;
  output outQ;
  reg Q;
  always @ (inD or inE)
  if(inE)
  begin
    Q <= inD;
  end
 assign outQ = Q;
endmodule  
