/* Creacion de un modulo Divisor para el clock de 50MHz que posee 
 * la tarjeta de pruebas EP2C5T144 Cyclone II, para conectar un LED
 * con destello cada medio segundo 500ms 
 * Fosc=50Mhz -> Tosc=20ns se requiere 500ms -> 500ms / 20ns = 25000000
 */
module divisor(clkin, clkout);
  input clkin;
  output clkout;
  reg [24:0] contador = 0; //2e25 = 33554432
  reg pulso = 0;
always @(posedge clkin)
  begin
  if(contador == (25000000-1)) 
    begin
    contador = 0;
    pulso = ~pulso; //Oscilacion de salida
    end
  else
  contador = contador +1;
  end
  assign clkout = pulso;
endmodule
