/* Test para el divisor 25Mhz a 500ms*/
`timescale 1ns/1ns //Escala de simulacion 1ns
module divisor_test();
  reg clkin;
  wire clkout;
divisor dv1(clkin, clkout);	//Instanciando al divisor
initial begin
  clkin = 0;
  forever #10 clkin = ~clkin;
end
endmodule
