module chuankou(sys_clk,UART_RX,reset,UART_TX);
	input sys_clk,UART_RX,reset;
	output UART_TX;


	wire [7:0]RX_DATA;
	wire RX_STATUS;
	wire [7:0]TX_DATA;
	wire TX_EN;
	wire TX_STATUS;


	receiver r(.sys_clk(sys_clk),.UART_Rx(UART_RX),.RX_data(RX_DATA),.RX_status(RX_STATUS));
	controller c(.sys_clk(sys_clk),.RX_data(RX_DATA),.RX_status(RX_STATUS),.TX_data(TX_DATA),
	           .TX_en(TX_EN),.TX_status(TX_STATUS));
	sender s(.sys_clk(sys_clk),.reset(reset),.TX_data(TX_DATA),.TX_en(TX_EN),
	         .TX_status(TX_STATUS),.UART_tx(UART_TX));

endmodule // chuankou