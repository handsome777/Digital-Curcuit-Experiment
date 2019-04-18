`timescale 1ns/1ps
module chuankou_tb;
	reg sys_clk,UART_RX,reset;
	wire UART_TX;

 	chuankou c(.sys_clk(sys_clk),.UART_RX(UART_RX),.reset(reset),.UART_TX(UART_TX));


 	initial
 	begin
 		sys_clk<=0;
		reset<=1;
		UART_RX<=1;
		#1000
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=1;
		#1041600
		
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		#104160
		UART_RX<=0;
		#104160
		UART_RX<=1;
		

end

 	always #10 sys_clk<=~sys_clk;



 endmodule // chuanko_tb