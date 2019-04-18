module signal_process(sigin,range,o_sigin);
  input sigin,range;
  output o_sigin;
  reg [2:0] c;
  reg o_sigin1;
  wire sigin1;
  
  assign o_sigin=range?o_sigin1:sigin;
  
  initial
  begin
   c<=3'b000;
   o_sigin1<=1'b1;
 end
  
  always @(posedge sigin )
  begin
    if(range)
      begin
            if(c<3'b100)
              c<=c+3'b001;
            else
              begin
                c<=3'b000;
                o_sigin1=~o_sigin1;
              end
        end
  end
endmodule
