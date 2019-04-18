`timescale 1ns/1ps

module check_d_tb();
  reg clk,d,r;
  wire flag;
  wire [5:0]q;
  
  check_d dm (.clk(clk),.d(d),.r(r),.flag(flag),.q(q));
  
  initial
    begin
      clk<=1;
      r<=1;
      #2 d  <= 1;	
		  #2 d  <= 0;	
	   	#2 d  <= 1;	
	   	#2 d  <= 0;	
	   	#2 d  <= 1;
		  #2 d <= 1;	
		  #2 d  <= 0;	
		  #2 d  <= 1;	
		  r<=0;
		  #2 d  <= 0;
		  #2 d  <= 1;	
		  #2 d  <= 1;	
      
    end
    
    always #1 clk<=~clk;
    
  endmodule
  
