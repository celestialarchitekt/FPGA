// JK FF using Verilog

module JKFF(
	input CLK,
	output reg LED_R
);

reg [28:0] counter = 0;

 wire J = counter[23];
 wire K = counter[24];

 always @(posedge CLK) begin
	counter <= counter + 1'b1;

	case({J,K})
		2'b00: LED_R <= LED_R;
		2'b01: LED_R <= 1'b0;    // ON 
		2'b10: LED_R <= 1'b1;    // OFF
		2'b11: LED_R <= ~LED_R; // toggle 

	endcase	
 end

endmodule




