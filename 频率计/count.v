module count(w_enable,clear,sigin,th_d,hundred_d,ten_d,one_d);
  input w_enable,clear,sigin;
  output [3:0]th_d;
  output [3:0]hundred_d;
  output [3:0]ten_d;
  output [3:0]one_d;
  reg [3:0]th_d1;
  reg [3:0]hundred_d1;
  reg [3:0]ten_d1;
  reg [3:0]one_d1;
  assign th_d=th_d1;
  assign hundred_d=hundred_d1;
  assign ten_d=ten_d1;
  assign one_d=one_d1;
  initial
  begin
    th_d1<=4'b0;
    hundred_d1<=4'b0;
    ten_d1<=4'b0;
    one_d1<=4'b0;
  end
  
  always@(posedge sigin)
  begin
    if(w_enable) begin
        if(clear) begin
            th_d1<=4'b0;
            hundred_d1<=4'b0;
            ten_d1<=4'b0;
            one_d1<=4'b0;
          end
        else begin
            if(one_d1!=4'b1001)
              one_d1<=one_d1+4'b0001;
            else if(ten_d1!=4'b1001) begin
                one_d1<=4'b0;
                ten_d1<=ten_d1+4'b0001;
              end
            else if(hundred_d1!=4'b1001) begin
                one_d1<=4'b0;
                ten_d1<=4'b0;
                hundred_d1<=hundred_d1+4'b0001;
              end
            else begin
                one_d1<=4'b0;
                ten_d1<=4'b0;
                hundred_d1<=4'b0;
                th_d1<=th_d1+4'b0001;
              end
            end
          end
        end
endmodule
