module display(c_clk,th_c,hu_c,ten_c,one_c,th,hundred,ten,one);
  input c_clk;
  input [3:0]th_c;
  input [3:0]hu_c;
  input [3:0]ten_c;
  input [3:0]one_c;
  output [6:0]th;
  output [6:0]hundred;
  output [6:0]ten;
  output [6:0]one;
  
  reg [6:0]th;
  reg [6:0]hundred;
  reg [6:0]ten;
  reg [6:0]one;
  
  wire s_c;
  
  scan s(.s_clk(c_clk),.s_c(s_c));
  
  
  always @(posedge s_c)
  begin
    
    case(th_c)
      4'b0000:th=7'b1000000;
      4'b0001:th=7'b1111001;
      4'b0010:th=7'b0100100;
      4'b0011:th=7'b0110000;
      4'b0100:th=7'b0011001;
      4'b0101:th=7'b0010010;
      4'b0110:th=7'b0000010;
      4'b0111:th=7'b1111000;
      4'b1000:th=7'b0000000;
      4'b1001:th=7'b0010000;
    endcase
    
    case(hu_c)
      4'b0000:hundred=7'b1000000;
      4'b0001:hundred=7'b1111001;
      4'b0010:hundred=7'b0100100;
      4'b0011:hundred=7'b0110000;
      4'b0100:hundred=7'b0011001;
      4'b0101:hundred=7'b0010010;
      4'b0110:hundred=7'b0000010;
      4'b0111:hundred=7'b1111000;
      4'b1000:hundred=7'b0000000;
      4'b1001:hundred=7'b0010000;
    endcase
    
    case(ten_c)               
         4'b0000:ten=7'b1000000;
         4'b0001:ten=7'b1111001;
         4'b0010:ten=7'b0100100;
         4'b0011:ten=7'b0110000;
         4'b0100:ten=7'b0011001;
         4'b0101:ten=7'b0010010;
         4'b0110:ten=7'b0000010;
         4'b0111:ten=7'b1111000;
         4'b1000:ten=7'b0000000;
         4'b1001:ten=7'b0010000;
       endcase
    
    case(one_c)         
      4'b0000:one=7'b1000000;
      4'b0001:one=7'b1111001;
      4'b0010:one=7'b0100100;
      4'b0011:one=7'b0110000;
      4'b0100:one=7'b0011001;
      4'b0101:one=7'b0010010;
      4'b0110:one=7'b0000010;
      4'b0111:one=7'b1111000;
      4'b1000:one=7'b0000000;
      4'b1001:one=7'b0010000;
    endcase
  end
endmodule

module scan(s_clk,s_c);
  input s_clk;
  output s_c;
  
  reg s_c=1'b0;
  
  parameter CNT=26'd50000;
  
  reg [25:0] cnt=26'd0;
  
  always @(posedge s_clk)
  begin
      begin
        if(cnt>=CNT)
          cnt<=26'd0;
        else
          cnt<=cnt+26'd2;
          
        if(cnt==26'd0)
          s_c=~s_c;
      end
  end
endmodule



