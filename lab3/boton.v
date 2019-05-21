/* Sistemas Digitales II - U.E.B. / Pablo Cesar Zarate Arancibia  *
 * Descripcion Verilog para implementar pulsadores de entrada con * 
 * retardo y Eliminacion de ruido */
module boton_ret1(clkin, boton, out);
  input boton, clkin;
  output out;
  reg [9:0] cnt = 0;
  reg st = 0;
  parameter CNT = 5;
  always @(posedge clkin)
  begin
    if(boton != st)
      begin
        cnt <= cnt + 1;
        if(cnt == (CNT-1))
          begin
          st <= ~st;
          cnt <= 0;
          end
      end
    else
      cnt <= 0;
  end
  assign out = st;
endmodule


