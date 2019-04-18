module frequency_check(sys_clk,reset,testmode,range,th,hundred,ten,one,out_range);
  input sys_clk,reset,range;
  input [1:0] testmode;
  output [6:0]th;
  output [6:0]hundred;
  output [6:0]ten;
  output [6:0]one;
  output out_range;
  wire [6:0] th;
  wire [6:0] hundred;
  wire [6:0] ten;
  wire [6:0] one;
  wire [3:0] th_d;
  wire [3:0] hundred_d;
  wire [3:0] ten_d;
  wire [3:0] one_d;
  wire [3:0] th_c;
  wire [3:0] hu_c;
  wire [3:0] ten_c;
  wire [3:0] one_c;
  wire w_enable,clear,save;
  wire c_clk;
  wire sigin,o_sigin,r_s;
  wire out_range;
  
  assign out_range=range;
  count_clk c_c(.sys_clk(sys_clk),.reset(reset),.c_clk(c_clk));
  signalinput s_i(.sysclk(sys_clk),.resetb(reset),.testmode(testmode)
              ,.sigin(sigin));
  signal_process s(.sigin(sigin),.range(range),.o_sigin(o_sigin));
  control_s c_s(.c_clk(c_clk),.reset(reset),.w_enable(w_enable)
                ,.clear(clear),.save(save));
  count c(.w_enable(w_enable),.clear(clear),.sigin(o_sigin),.th_d(th_d)
          ,.hundred_d(hundred_d),.ten_d(ten_d),.one_d(one_d));
  Lock L(.c_clk(c_clk),.save(save),.th_d(th_d),.hundred_d(hundred_d)
          ,.ten_d(ten_d),.one_d(one_d),.th_c(th_c),.hu_c(hu_c)
          ,.ten_c(ten_c),.one_c(one_c));
  display d(.c_clk(sys_clk),.th_c(th_c),.hu_c(hu_c),.ten_c(ten_c)
          ,.one_c(one_c),.th(th),.hundred(hundred),.ten(ten),.one(one));
  
endmodule
