module check(clk,reset,in_put,flag,led);
input clk,reset,in_put;
output flag;
output [2:0]led;

fsm f(.clk(clk),.reset(reset),.in_put(in_put),.flag(flag),.led(led));
endmodule


module fsm(clk,reset,in_put,flag,led);
input clk,reset,in_put;
output flag;
output [2:0]led;
reg flag;
reg [2:0]led;

always @(negedge clk or negedge reset)
begin
  if(~reset)
    begin
      led<=3'b000;
      flag<=0;
    end
  else
    begin
      case(led)
        3'b000:
          if(in_put)
            begin
              led<=3'b001;
              flag<=0;
            end
          else
            begin
              flag<=0;
              led<=3'b000;
            end
        3'b001:
          if(~in_put)
            begin
              flag<=0;
              led<=3'b010;
            end
          else
            begin
              flag<=0;
              led<=3'b001;
            end
        3'b010:
          if(in_put)
            begin
              flag<=0;
              led<=3'b011;
            end
          else
            begin
              flag<=0;
              led<=3'b000;
            end
        3'b011:
          if(in_put)
            begin
              flag<=0;
              led<=3'b001;
            end
          else
            begin
              flag<=0;
              led<=3'b100;
            end
        3'b100:
          if(in_put)
            begin
              flag<=0;
              led<=3'b101;
            end
          else
            begin
              flag<=0;
              led<=3'b000;
            end
        3'b101:
          if(in_put)
            begin
              flag<=1;
              led<=3'b001;
            end
          else
            begin
              flag<=0;
              led<=3'b100;
            end
       endcase
    end
      
end

endmodule

