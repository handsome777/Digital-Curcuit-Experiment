module controller(sys_clk,RX_data,RX_status,TX_data,TX_en,TX_status);
	input [7:0]RX_data;
	input RX_status,sys_clk;
	output [7:0]TX_data;
	output TX_en;
	input TX_status;

	reg [7:0]TX_d;
	reg TX_en_b;

	initial
		begin
			TX_en_b<=0;
			TX_d<=0;
		end

	assign TX_data=TX_d;
	assign TX_en=TX_en_b;

	always@(posedge sys_clk)
	begin
		if(RX_status)
			begin
				if(RX_data[7])
					TX_d<=~RX_data;
				else
					TX_d<=RX_data;
			end

		if(RX_status)
			TX_en_b<=1;
		else if(~TX_status)
			TX_en_b<=0;
	end

endmodule // controller