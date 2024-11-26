module Comparator (
	input wire[7:0] A,
	input wire[7:0] B,
	output wire EQ
);

assign EQ = (A == B)? 1 : 0;

endmodule

