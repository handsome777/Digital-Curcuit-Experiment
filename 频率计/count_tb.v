`timescale 1ns/1ps
module count_tb;
  reg w_enable,clear,sigin;
  wire [3:0]th_d;
  wire [3:0]hundred_d;
  wire [3:0]ten_d;
  wire [3:0]one_d;
  
  count c(.w_enable(w_enable),.clear(clear),.sigin(sigin),.th_d(th_d),.hundred_d(hundred_d),.ten_d(ten_d),.one_d(one_d));
  
  initial
  begin
    w_enable<=1'b1;
    clear<=1'b0;
    sigin<=1'b0;
  end

always #5 sigin<=~sigin;

endmodule