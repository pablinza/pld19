/****************************************************************
 * 				Implementacion FPGA								*
 * Diseñar e implementar una unidad aritmética de 4 bits		*
 * que permita realizar suma, resta, multiplicación y división 	*
 * con dos números de un dígito como entrada y mostrar el 		*
 * resultado en un numero de tres dígitos, que se visualizaran	*
 * el pantallas de 7 Segmentos.									*
 * El documento consta de 3 modulos con el siguiente orden:		*
 * 			alu4bit -> bintobcd -> bcdto7seg					*
 ****************************************************************/

//Unidad aritmetica de 4 bits realizar operaciones (+ - * /)
module alu4bit(A, B, OP, S);
input [3:0] A, B;
input [1:0] OP;
output reg [7:0] S;
always @(A or B or OP)
begin
  case (OP)
    2'b00: S <= A + B;
    2'b01: S <= A - B;
    2'b10: S <= A * B;
    2'b11: S <= A / B;
  endcase 
end
endmodule

//Decodificador binario(bin) a BCD digitos(mil cent uni)
module bintobcd(bin, cen, dec, uni);
  input [7:0] bin;
  output reg [3:0] cen, dec, uni;
  integer i;
  always @(bin)
  begin
    cen = 4'b0000;
    dec = 4'b0000;
    uni = 4'b0000;
    for(i=7; i>=0; i=i-1)
    begin
      //Adiciona un 3 a las columnas mayores a 5
      if(cen >= 5)
        cen = cen + 3;
      if(dec >= 5)
        dec = dec + 3;
      if(uni >= 5)
        uni = uni + 3;
      //Un desplazamiento a la izquierda 
      cen = cen << 1;
      cen[0] = dec[3];
      dec = dec << 1;
      dec[0] = uni[3];
      uni = uni << 1;
      uni[0] = bin[i]; 
    end   
  end
endmodule

//Decodificador BCD a pantalla de 7 segmentos
module bcdto7seg(bcd, seg);
  input [3:0] bcd;
  output reg [6:0] seg;
  always @(bcd)
  begin
    case (bcd)
      4'b0000: seg <= 7'b0111111;
      4'b0001: seg <= 7'b0000110;
      4'b0010: seg <= 7'b1011011;
      4'b0011: seg <= 7'b1001111;
      4'b0100: seg <= 7'b1100110;
      4'b0101: seg <= 7'b1101101;
      4'b0110: seg <= 7'b1111100;
      4'b0111: seg <= 7'b0000111;
      4'b1000: seg <= 7'b1111111;
      4'b1001: seg <= 7'b1100111;
    endcase
  end
endmodule

