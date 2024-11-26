module ThirtyTwoBitComparator (
	input wire[31:0] A,
	input wire[31:0] B,
	output wire EQ
);

assign EQ = (A == B)? 1 : 0;

endmodule

