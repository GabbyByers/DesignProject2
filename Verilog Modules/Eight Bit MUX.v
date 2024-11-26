module EightBitMUX (
	input wire[7:0] A,
	input wire[7:0] B,
	input wire S,
	output wire[7:0] Q
);

assign Q = (S)? B : A;

endmodule

