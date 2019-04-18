module check_d(clk,d,r,flag,q);
  input clk,d,r;
  output flag;
  output [5:0]q;
  
  wire [5:0]q;
  wire flag;
  
  D d1(.clk(clk),.d(d),.r(r),.q(q[5]));
  D d2(.clk(clk),.d(q[5]),.r(r),.q(q[4]));
  D d3(.clk(clk),.d(q[4]),.r(r),.q(q[3]));
  D d4(.clk(clk),.d(q[3]),.r(r),.q(q[2]));
  D d5(.clk(clk),.d(q[2]),.r(r),.q(q[1]));
  D d6(.clk(clk),.d(q[1]),.r(r),.q(q[0]));
  and and1(flag,q[0],~q[1],q[2],~q[3],q[4],q[5]);
endmodule

module D(clk,d,r,q);
  input clk,d,r;
  output q;
  reg q;
  
  always @(posedge clk or negedge r)
  begin
     if(~r) 
        begin
        q<=0;
      end
     else
     begin
      q<=d;
    end
  end
endmodule
