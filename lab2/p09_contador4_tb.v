/* Test de prueba para el modulo contador4 */
module contador4_test();
  reg clk;
  wire [3:0] salida;
  contador4 cn1(clk, salida); //instanciando el contador4
  defparam cn1.MOD = 4; //Modificacion de su parametro MOD
  initial begin
    clk = 0;
    forever #50 clk = ~clk; //oscilacion cada 50ps
  end
endmodule
