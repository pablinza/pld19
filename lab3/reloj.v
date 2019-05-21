/* Sistemas Digitales II - U.E.B. / Pablo Cesar Zarate Arancibia  *
 * Descripcion Verilog para rutinas utilizadas con el reloj del   * 
 * sistema FPGA */
module divisor_16b(clkin, clkout);
  input clkin;
  output clkout;
  reg [15:0] contador = 0;
  reg pulso = 0;
  parameter CNT = 50000;
always @(posedge clkin)
  begin
  if(contador == (CNT-1))
    begin
    contador = 0;
    pulso = ~pulso;
    end
  else
  contador = contador +1;
  end
  assign clkout = pulso;
endmodule

module divisor_8b(clkin, clkout);
  input clkin;
  output clkout;
  reg [7:0] contador = 0;
  reg pulso = 0;
  parameter CNT = 10;
always @(posedge clkin)
  begin
  if(contador == (CNT-1))
    begin
    contador = 0;
    pulso = ~pulso;
    end
  else
  contador = contador +1;
  end
  assign clkout = pulso;
endmodule


