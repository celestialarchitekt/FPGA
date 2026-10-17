// D Flip Flop using Verilog
// The D Flip Flop holds the state , does not immediately pass the input to output.
// Millions of these DFF and one has a RAM-

module d_ff(
	input CLK,
	output reg LED_R
);

reg [28:0] counter = 0;

always @(posedge CLK) begin
 counter <= counter + 1'b1;
end

// takes 0.7 seconds to change state, 0 to 1 then another 0.7 seconds for 1 to 0 so total 1.4 seconds
wire slow_tick = counter[23];

reg d_input = 0;

// d_input stays for 1.4 seconds
always @(posedge slow_tick) begin
	d_input <= ~d_input;

end

// the moment the clk rises 0 to 1 , approx 83.3nano sec, assign the d_input to LED_R
// 1.4sec + 83.3 nano seconds approx
always @(posedge CLK) begin
	LED_R <= d_input;
	
end

endmodule
