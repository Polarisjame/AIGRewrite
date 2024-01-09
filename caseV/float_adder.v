module float_adder(
    input [31:0] float_a,
    input [31:0] float_b,
    output reg [31:0] float_sum
);

always @(float_a, float_b) begin
    float_sum <= float_a + float_b;
end

endmodule
