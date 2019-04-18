`timescale 1ns/1ps;
module add_dec_tb;
reg hit,reset;
wire [6:0] cout1;
add_dec uut(.hit(hit),.reset(reset),.cout(cout1));
initial 
  begin
    reset=0;
    hit=1;
    #10
    reset=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    #50
    hit=1;
    #100
    hit=0;
    $stop;
  end
endmodule
