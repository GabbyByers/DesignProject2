module MUX (
	input wire A,
	input wire B,
	input wire S,
	output wire Q
);

assign Q = (S)? B : A;

endmodule

