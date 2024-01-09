module modulo(
    input [3:0] data_in,
    output reg [1:0] remainder
);

always @(data_in) begin
    remainder <= data_in % 4;
end

endmodule
