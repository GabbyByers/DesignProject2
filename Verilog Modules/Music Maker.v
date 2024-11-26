module MarryHadALittleLamb (
	input wire CLK,
	input wire RST,
	output wire Music
);

reg C4_Tone = 0;
reg D4_Tone = 0;
reg E4_Tone = 0;

reg[31:0] C4_Counter = 0;
reg[31:0] D4_Counter = 0;
reg[31:0] E4_Counter = 0;

reg[31:0] MasterCounter = 0;
reg[7:0] State = 0;

reg[31:0] Pauses  = 32'b00011111011111110111011101111111;
reg[31:0] C_Notes = 32'b11110000000001000000000000000100;
reg[31:0] D_Notes = 32'b00001011000010100000111100001010;
reg[31:0] E_Notes = 32'b00000100111100011111000011110001;

assign Music = ((MasterCounter < 32'd2000000) & Pauses[State] == 1)? 0 : (C_Notes[State] == 1)? C4_Tone : (D_Notes[State] == 1)? D4_Tone : (E_Notes[State] == 1)? E4_Tone : 0;

always @(posedge CLK) begin

	if (RST) begin
		C4_Tone <= 0;
		D4_Tone <= 0;
		E4_Tone <= 0;
		C4_Counter <= 0;
		D4_Counter <= 0;
		E4_Counter <= 0;
		MasterCounter <= 0;
		State <= 0;
	end
	else begin
		if (C4_Counter <= 32'd95785) begin
			C4_Counter <= C4_Counter + 1;
		end
		else begin
			C4_Counter <= 0;
			C4_Tone = !C4_Tone;
		end
		
		if (D4_Counter <= 32'd85324) begin
			D4_Counter <= D4_Counter + 1;
		end
		else begin
			D4_Counter <= 0;
			D4_Tone = !D4_Tone;
		end
		
		if (E4_Counter <= 32'd75987) begin
			E4_Counter <= E4_Counter + 1;
		end
		else begin
			E4_Counter <= 0;
			E4_Tone = !E4_Tone;
		end
		
		if (MasterCounter < 32'd20000000) begin
			MasterCounter <= MasterCounter + 1;
		end
		else begin
			MasterCounter <= 0;
			if (State >= 8'd31) begin
				State <= 0;
			end
			else begin
				State <= State + 1;
			end
		end
	end
end

endmodule