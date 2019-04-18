`timescale 1ns/1ns

module frequency_check_tb;
  reg sys_clk,reset,range;
  reg [1:0] testmode;
  wire [6:0]th;
  wire [6:0]hundred;
  wire [6:0]ten;
  wire [6:0]one;
  wire out_range;
  
  frequency_check F(.sys_clk(sys_clk),.reset(reset),.testmode(testmode),.range(range)
                  ,.th(th),.hundred(hundred),.ten(ten),.one(one),.out_range(out_range));
  
  
  initial
  begin
    reset<=1;
    sys_clk<=0;
    range<=0;
    testmode<=2'b00;
    
    
  end
  
  always #10 sys_clk=~sys_clk;
  
endmodule
  