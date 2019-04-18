
module count_clk(sys_clk,reset,c_clk);
  input sys_clk,reset;
  output c_clk;
  reg c_clk=1'b0;
  
  parameter CNT=26'd50000000;
  
  reg [25:0] cnt=26'd0;
  
  always @(posedge sys_clk,negedge reset)
  begin
    if(~reset)
      begin
        cnt<=26'd0;
        c_clk<=1'b0;
      end
    else
      begin
        if(cnt>=CNT)
          cnt<=26'd0;
        else
          cnt<=cnt+26'd2;
          
        if(cnt==26'd0)
          c_clk=~c_clk;
      end
  end
  
endmodule
