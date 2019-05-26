/* Sistemas Digitales II - U.E.B. / Pablo Cesar Zarate Arancibia  *
 * Descripcion Verilog de los modulos utilizados en la primera    *
 * practica de laboratorio: Trabajo del selector de mesa */
module selector(swin, swout, clk, rst, cso);
  input [3:0] swin;
  input clk, rst;
  output reg [3:0] swout = 4'b0000;
  output reg cso = 0;
  reg lock = 0;
  always @(posedge clk)
  begin
    if((lock == 0) && (swin != 4'b0000)) //si lock es 0 y se hay un pulsador presionado
      begin
        case (swin)
          4'b0001:
          begin
            swout <= 4'b0001; //Activa el led que corresponde al SW1
            cso <= 1;	//Senal para desactivar al modulo secuenciador
            lock <= 1;  //Bloquea el modulo actual
          end
          4'b0010:
          begin
            swout <= 4'b0010;
            cso <= 1;
            lock <= 1;
          end
          4'b0100:
          begin
            swout <= 4'b0100;
            cso <= 1;
            lock <= 1;
          end
          4'b1000:
          begin
            swout <= 4'b1000;
            cso <= 1;
            lock <= 1;
          end
        endcase
      end
    if(rst == 1) //Si lock no es 0 y se presiona Reset
      begin
          lock <= 0;	//Desbloquea el modulo actual
          swout <= 0; //Las salida se iniciar en 0
          cso <= 0; //Habilta al modulo secuenciador
        end
  end
endmodule
module secuenciador(clk, csi, out);
  input clk, csi;
  output reg [3:0] out = 4'b0000;
  reg [7:0] cnt = 0;
  always @(posedge clk)
  begin
  if(csi == 0) //Si el modulo esta habilitado
    begin
      cnt <= cnt + 1;
      if(cnt > 99) //Cada 99ms si el clk es 1ms
        begin
          out <= out >> 1; //Desplaza 1 bit a la derecha
          if(out == 0)
            out <= 4'b1000;
          cnt <= 0;
          end
    end
  else	//Si el modulo esta deshabilitado
    out <= 0;
  end
endmodule
