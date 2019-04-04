module ffJKpre_test;
  reg CLK, J, K, PRE, CLR;
  wire Q, Qn;
  ffJKpre sh1(CLK, J, K, Q, Qn, PRE, CLR); 
  initial begin 
      PRE = 1; CLR = 1; CLK = 0;
      forever #50 CLK = ~CLK;  //Genera reloj  
  end
  initial begin
    #105 J = 0; K = 1;
    #100 J = 0; K = 0;
    #100 J = 1; K = 0;
    #100 J = 0; K = 0;
    #100 J = 1; K = 1;
    #100 J = 1; K = 1;
    #100 J = 0; K = 0;
    #100 CLR = 0;
    #100 CLR = 1;
    #100 PRE = 0;
    #100 PRE = 1;
    #100 CLR = 0;
  end
endmodule