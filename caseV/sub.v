module sub(
    input [3:0] a,
    input [3:0] b,
    input bin,
    output [3:0] diff,
    output bout
);

    wire [3:0] neg_b;
    assign neg_b = ~b + 1;

    assign {bout, diff} = a + neg_b + bin;

endmodule
