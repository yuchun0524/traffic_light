module counter(clk, rst, pass, recount, count);
  input clk, rst, recount, pass;
  output [10:0] count;
  reg [10:0] count;
  always@ (posedge clk )
  begin
    if (rst)
      count = 1;
    else
      if (pass == 1 && recount == 1)
        count = 1;
      else
        count = (recount == 1)? 11'd1: count + 1;
  end
endmodule