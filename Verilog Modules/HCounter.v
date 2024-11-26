module HCounter (
	output wire[7:0] ValueOut,
	
	input wire RST,
	input wire INC,
	input wire CLK
);

reg[7:0] Value = 8'h00;;
assign ValueOut = Value;

always @(posedge CLK) begin
	if (RST) begin
		Value <= 8'h00;
	end
	else if (INC) begin
		if (Value == 8'h0B) begin
			Value <= 0;
		end
		else begin
			Value <= Value + 1;
		end
	end
end

endmodule

