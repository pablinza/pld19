/* Descripcion de un temporizador generico no redisparable */
module timer(clk, start, out);
input wire clk,start;
output reg out = 0;
parameter DIVCLK = 10; //parametro divisor de ciclos
reg[7:0] cnt = 0; //variable de 8 bits
reg startOK = 0; //bandera del timer
always @(posedge clk) //Solo con flancos ascendentes
begin
  
  if(start == 1) //Si start se activa
  begin 
    startOK = 1; //Inicia la cuenta del timer
    out <= 1; //Salida es alta
  end
  if(startOK == 1) //Si el timer ha iniciado
  begin
    cnt = cnt + 1; //Incrementa contador
    if(cnt == DIVCLK) //Si el contador llega al fin
    begin
      out <= 0; //Salida a nivel bajo
      cnt = 0; //Reinicia contador
      startOK = 0; //Finaliza timer
    end
  end  
end
endmodule

 
