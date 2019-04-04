/* Descripcion de un latch tipo SR*/
module latchSR(inS, inR, outQ, outQn);
  input inS, inR;
  output outQ, outQn;
  wire outQ, outQn;
  nand(outQ, inS, outQn);
  nand(outQn, inR, outQ);
endmodule

