module sort_task(a,b,c,d,ra,rb,rc,rd);
parameter width = 4;
input [width-1:0] a,b,c,d;
output reg[width-1:0] ra,rb,rc,rd;

always@(a or b or c or d)
begin
	sort(a,b,c,d,ra,rb,rc,rd);
end

task sort;
input [width-1:0] a,b,c,d;
output reg[width-1:0] ra,rb,rc,rd;
reg [width-1:0]temp;
integer i,j;
reg [width-1:0]data[3:0];

begin
data[0] = a;
data[1] = b;
data[2] = c;
data[3] = d;

for(i=0;i<3;i=i+1)
	begin
	for(j=0;j<3-i;j=j+1)
		begin
		if(data[j]>data[j+1])
			begin
			temp = data[j+1];
			data[j+1] = data[j];
			data[j] = temp;
			end
		end
	end

ra = data[0];
rb = data[1];
rc = data[2];
rd = data[3];
end

endtask

endmodule

