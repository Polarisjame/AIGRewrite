module adder16(cout,sum,a,b,cin);
output cout;
parameter my_size=16;
output[my_size-1:0] sum;
input[my_size-1:0] a,b;
input cin;
adder my_adder(cout,sum,a,b,cin); 
endmodule

module adder(cout,sum,a,b,cin);
parameter size=16;
output cout;
output[size-1:0] sum;
input cin;
input[size-1:0] a,b;
assign {cout,sum}=a+b+cin;
endmodule