
module logic_circuit(
	input CLK,
	output LED_R
);


reg [28:0] counter = 0;

always @(posedge CLK) begin
	counter <= counter+1;
end

wire a  = counter[27];
wire b = counter[26];
wire c = counter[25];

assign LED_R = (a&b) | (~a&c);

endmodule


