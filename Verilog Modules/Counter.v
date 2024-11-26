module ThirtyTwoBitCounter (
	input wire CLK,
	input wire RST,
	output wire[31:0] ValueOut
);

reg[31:0] Value = 0;
assign ValueOut = Value;

always @(posedge CLK) begin
	if (RST) begin
		Value <= 0;
	end
	else begin
		Value <= Value + 1;
	end
end

endmodule

