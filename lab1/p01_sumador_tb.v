module Sum_test;  //Prueba RTL para sumador
reg inA, inB; //Entrada tipo registro
wire outS, outC;  //Salidas tipo cable
Sum s1(inA, inB, outS, outC);
initial
  begin
  inA = 0;
  inB = 0;
  #100  //Espera 100 unidades de tiempo ps
  inA = 1;
  inB = 0;
  #100  //Espera 100 unidades de tiempo ps
  inA = 0;
  inB = 1;
  #100  //Espera 100 unidades de tiempo ps
  inA = 1;
  #100; //Espera 100 unidades de tiempo ps
  $finish;
  end
endmodule