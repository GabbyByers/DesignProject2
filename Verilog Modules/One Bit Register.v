module OneBitRegister (
	input wire D,
	input wire EN,
	input wire RST,
	input wire CLK,
	output wire Q
);

reg Val = 0;
assign Q = Val;

always @(posedge CLK) begin
	if (EN) begin
		Val <= D;
	end
	else if (RST) begin
		Val <= 0;
	end
end

endmodule

