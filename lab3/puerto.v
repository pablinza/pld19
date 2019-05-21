/* Sistemas Digitales II - U.E.B. / Pablo Cesar Zarate Arancibia  *
 * Descripcion Verilog para diversas practicas con los puertos    * 
 * digitales de la FPGA */
module puerto_rot(butrh, butlf, butrs, clkin, leds);
input butrh, butlf, butrs, clkin;
output reg [7:0] leds;
always @(posedge clkin)
begin
	if(butrs == 1)
		leds <= 8'b00000000;
	else
	begin
		if(butrh == 1)
		begin
			if(leds == 8'h00)
				leds <= 8'h80;
			else
				leds <= leds >> 1;	
		end
		if(butlf == 1)
		begin
			if(leds == 8'h00)
				leds <= 8'h01;
			else
				leds <= leds << 1;	
		end
	end
end
endmodule
