module ZeroCorrection (
	input wire[7:0] A,
	output wire[7:0] Q
);

assign Q = (A == 0)? 8'd12 : A;

endmodule

