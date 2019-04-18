module add_dec(hit,cout,reset,ud);
  input hit;
  input reset; 
  input ud;
  output [6:0] cout;
  
  wire [3:0] cnt;
  BCD7 U0(.din(cnt),.dout(cout));
  count U1(.reset(reset),.hit(hit),.cnt(cnt),.ud(ud));
endmodule

module BCD7(din,dout);
  input  [3:0] din;
  output [6:0] dout;
  
  assign dout=(din==4'h0)?7'b1000000:
             (din==4'h1)?7'b1111001:
             (din==4'h2)?7'b0100100:
             (din==4'h3)?7'b0110000:
             (din==4'h4)?7'b0011001:
             (din==4'h5)?7'b0010010:
             (din==4'h6)?7'b0000010:
             (din==4'h7)?7'b1111000:
             (din==4'h8)?7'b0000000:
             (din==4'h9)?7'b0010000:
             (din==4'hA)?7'b0001000:
             (din==4'hB)?7'b0000011:
             (din==4'hC)?7'b1000110:
             (din==4'hD)?7'b0100001:
             (din==4'hE)?7'b0000110:
             (din==4'hF)?7'b0001110:7'b0;
endmodule
           
module count(hit,reset,cnt,ud);
  input hit;
  input reset;
  input ud;
  output [3:0] cnt;
  reg [3:0] cnt;
  always@(negedge hit or negedge reset)
    begin
      if(~reset) cnt<=4'b0;
      else
        begin
           if(ud)
             begin
                   if(~hit)
                    begin
                     if(cnt==4'b1111) cnt=4'b0;
                     else
                       begin
                        if(cnt[1]&cnt[2]&cnt[0]) cnt[3]=~cnt[3];
                        if(cnt[0]&cnt[1]) cnt[2]=~cnt[2];
                        if(cnt[0]) cnt[1]=~cnt[1];
                        cnt[0]=~cnt[0];
                       end
                    end
               end
          else
            begin
             if(~hit)
              begin
                if(cnt==4'b0) cnt=4'b1111;
              else
                begin
                  if(!(cnt[1]||cnt[2]||cnt[0])) cnt[3]=~cnt[3];
                  if(!(cnt[0]||cnt[1])) cnt[2]=~cnt[2];
                  if(!(cnt[0])) cnt[1]=~cnt[1];
                  cnt[0]=~cnt[0];
                end
              end
            end
          end
        end
endmodule










  
