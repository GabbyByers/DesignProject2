module Parser (
	input  wire [7:0] A,
	output wire [3:0] ones,
	output wire [3:0] tens
);

assign ones = A % 10;
assign tens = (A / 10) % 10;

endmodule