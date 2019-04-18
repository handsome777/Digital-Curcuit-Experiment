module Lock(c_clk,save,th_d,hundred_d,ten_d,one_d,th_c,hu_c,ten_c,one_c);
  input c_clk,save;
  input [3:0]th_d;
  input [3:0]hundred_d;
  input [3:0]ten_d;
  input [3:0]one_d;
  output [3:0]th_c;
  output [3:0]hu_c;
  output [3:0]ten_c;
  output [3:0]one_c;
  
  reg [3:0]th_cb;
  reg [3:0]hu_cb;
  reg [3:0]ten_cb;
  reg [3:0]one_cb;
  
  assign th_c=th_cb;
  assign hu_c=hu_cb;
  assign ten_c=ten_cb;
  assign one_c=one_cb;
  
  always @(posedge c_clk)
  begin
    if(~save)
      begin
        th_cb<=th_d;
        hu_cb<=hundred_d;
        ten_cb<=ten_d;
        one_cb<=one_d;
      end
  end
  
endmodule