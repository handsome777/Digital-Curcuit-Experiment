`timescale 1ns/1ns

module check_tb();
  reg clk,reset,in_put;
  wire flag;
  wire [2:0]led;
  
  fsm c(.clk(clk),.reset(reset),.in_put(in_put),.flag(flag),.led(led));
  
  initial 
    begin
    clk <= 0;		
		reset <= 0;			
		in_put <= 0;	
		#2 reset <= 1;
		#2 in_put  <= 1;	
		#2 in_put  <= 0;	
		#2 in_put  <= 1;	
		#2 in_put  <= 0;	
		#2 in_put  <= 1;
		#2 in_put  <= 0;	
		#2 in_put  <= 1;	
		#2 in_put  <= 1;	
		#2 in_put  <= 0;	
		#6 reset <= 0;		
		#2 reset <= 1;
	end
	always #1 clk <= ~clk;	

endmodule
