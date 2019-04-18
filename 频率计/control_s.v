`timescale 1ns/1ps

module control_s(c_clk,reset,w_enable,clear,save);
  input c_clk,reset;
  output w_enable,clear,save;
  reg w_enable1;
  reg clear1;
  reg save1;

  
  assign w_enable=w_enable1;
  assign clear=clear1;
  assign save=save1;
  
  initial
  begin
   w_enable1<=1'b1;
   clear1<=1'b0;
   save1<=1'b0;
  end

  
  always@(posedge c_clk,negedge reset)
  begin
    if(~reset)
      begin
        clear1<=1'b0;
        save1<=1'b0;
      end
    else
      begin
       save1<=~save1;
       #0.5
       clear1<=~clear1;
     end
  end
  
endmodule