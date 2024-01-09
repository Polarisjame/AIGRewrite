module checker1(
    input [7:0] data_in,
    output reg parity_bit
);

always @(data_in) begin
    parity_bit = ^data_in;
end

endmodule
