module traffic_light (
    input  clk,
    input  rst,
    input  pass,
    output R,
    output G,
    output Y
);
wire recount;
wire [10:0] count;

counter a1(.clk(clk), .rst(rst), .pass(pass), .recount(recount), .count(count));
traffic_control a2(.clk(clk), .rst(rst), .pass(pass), .count(count), .R(R), .G(G), .Y(Y), .recount(recount));
endmodule