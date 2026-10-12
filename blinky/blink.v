
// Slow Blinking LED

module blink_test(
input CLK,
output LED_G,
output LED_R,
output LED_B);


reg [28:0] counter = 0;
always @(posedge CLK) counter <= counter + 1;

assign LED_R = (counter[27] & counter[28]);
assign LED_G = (counter[27] | counter[28]);

assign LED_B = 1'b1;



endmodule

