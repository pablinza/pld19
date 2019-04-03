module deco7seg_test; //Prueba RTL para decoder
reg [3:0]in;
wire [6:0]out;
integer i;
deco7seg dec1(in, out);
initial 
  begin
  for(i = 0; i < 10; i = i+1)
  #100 in <= i;
  end
endmodule
