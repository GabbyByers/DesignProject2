module TFlipFlop (
	input wire CLK,
	input wire EN,
	input wire RST,
	output wire Q
);

reg State = 0;
assign Q = State;

always @(posedge CLK) begin
	if (RST) begin
		State <= 0;
	end
	else if (EN) begin
		State <= !State;
	end
end

endmodule

