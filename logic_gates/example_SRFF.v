// SR Flip Flop

module sr_counter(
 input wire CLK,
 output reg LED_R
);

reg [28:0] counter = 0;

wire S;
wire R;

assign S = counter[24];
assign R = counter[23];

always @(posedge CLK) begin
	counter <= counter +1'b1;

	case({S,R})
		2'b00 : LED_R <= LED_R;
		2'b01 : LED_R <= 1'b0;
		2'b10 : LED_R <= 1'b1;
		2'b11 : LED_R <= 1'b0;
	endcase
end

endmodule





