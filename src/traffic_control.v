module traffic_control (clk, rst, pass, count, R, G, Y, recount);
  input clk, rst, pass;
  input [10:0] count;
  output R, G, Y, recount;
  reg [2:0] state;
  reg R, G, Y, recount;
  `define SG_time 1023
  `define None_time 127
  `define G_time 127
  `define Y_time 511
  `define R_time 1023
  parameter SG_light = 3'b000, None_light1 = 3'b001, G_light1 = 3'b010, None_light2 = 3'b011, G_light2 = 3'b100, Y_light = 3'b101, R_light = 3'b110;
always@( posedge clk )
begin
  if (rst)
   begin
     recount = 1;
     state = SG_light;
     R = 1'b0;
     G = 1'b1;
     Y = 1'b0;
   end
  else
    begin
     if(pass == 1)
       begin
         if (state != SG_light)
           begin
             recount = 1;
             state = SG_light;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         else
           begin
             recount = 0;
           end
       end
     else
       begin
     case(state)
       SG_light: begin
         if ( count == `SG_time)
           begin
             recount = 1;
             state = None_light1;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         end
       None_light1: begin
         if (count == `None_time)
           begin
             recount = 1;
             state = G_light1;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b0;
           end
         end
       G_light1: begin
         if (count == `G_time)
           begin
             recount = 1;
             state = None_light2;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         end
       None_light2: begin
         if (count == `None_time)
           begin
             recount = 1;
             state = G_light2;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b0;
           end
         end
       G_light2: begin
         if (count == `G_time)
           begin
             recount = 1;
             state = Y_light;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b1;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         end
       Y_light: begin
         if ( count == `Y_time)
           begin
             recount = 1;
             state = R_light;
             R = 1'b1;
             G = 1'b0;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b1;
           end
         end
       R_light: begin
         if (count == `R_time)
           begin
             recount = 1;
             state = SG_light;
             R = 1'b0;
             G = 1'b1;
             Y = 1'b0;
           end
         else  begin
             recount = 0;
             R = 1'b1;
             G = 1'b0;
             Y = 1'b0;
           end
         end
       default: begin
             recount = 0;
             state = SG_light;
             R = 1'b0;
             G = 1'b0;
             Y = 1'b0;
           end
         endcase
       end
     end
     end
endmodule