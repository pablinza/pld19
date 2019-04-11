module timerosc(clk, out);
  input wire clk; 
  output reg out= 0;
  reg [7:0] count = 0;
  parameter DIVCLK = 4;
  always @(posedge clk)
  begin
    count = count + 1;
    if(count == DIVCLK)
    begin  
      out <= ~out;
      count = 0;
    end
  end
endmodule
