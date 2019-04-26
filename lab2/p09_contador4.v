/* Creacion de un contador de 4 bits con modulo configurable */
module contador4(clk, salida);
  input clk; 
  output [3:0] salida;
  reg [3:0] contador = 0; //Variable contador de 4 bits
  parameter MOD = 9;	//Parametro
  always @(posedge clk)
  begin
    if(contador == (MOD-1))	//Si contador = parametro
      contador <= 0;
    else
      contador <= contador + 1;
  end
  assign salida = contador;
endmodule
