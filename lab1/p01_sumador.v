/*	Practica de la materia Sistemas Digitales II
	Descripcion HDL para:
		Sumador de 1-bit
*/
module Sum(inA, inB, outS, outC); 
  input inA, inB; //Entradas 
  output outS, outC; //Salidas
  and (outC, inA, inB);
  xor (outS, inA, inB);
endmodule
