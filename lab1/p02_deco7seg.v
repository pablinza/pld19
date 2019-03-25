/*	Practica de la materia Sistemas Digitales II
	Descripcion HDL para:
		Decodificador para 7 Segmentos CC
	Mapa Bit 7 6 5 4 3 2 1 0
	     Seg x g f e d c b a 	 x = no conectado
*/
module deco7seg(in, out);
  input [3:0]in;
  output reg [6:0]out;
always @(*) //Siempre que exista cambio
  case(in)
    0: out <= 7'b0111111;
    1: out <= 7'b0000110;
    2: out <= 7'b1011011;
    3: out <= 7'b1001111;
    4: out <= 7'b1100110;
    5: out <= 7'b1101101;
    6: out <= 7'b1111101;
    7: out <= 7'b0000111;
    8: out <= 7'b1111111;
    9: out <= 7'b1101111;
  endcase
endmodule