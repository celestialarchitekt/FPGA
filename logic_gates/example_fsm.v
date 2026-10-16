// FSM  finite state machine

module fsm_led(
	input CLK,
	output reg LED_R,
	output reg LED_G,
	output reg LED_B
);


reg [28:0] counter=0;

always @(posedge CLK) begin
	counter <= counter+1;
end

// 24th bit as the the state change bit
wire slow_tick = counter[23];

// define the states
localparam STATE_RED = 2'b00;
localparam STATE_GREEN = 2'b01;
localparam STATE_BLUE = 2'b10;
localparam STATE_ALL = 2'b11;

reg[1:0] current_state = STATE_RED;


// state change
always @(posedge slow_tick) begin
	case(current_state)
		STATE_RED    : current_state <= STATE_GREEN;
		STATE_GREEN  : current_state <= STATE_BLUE;
		STATE_BLUE   : current_state <= STATE_ALL;
		STATE_ALL    : current_state <= STATE_RED;
		default      : current_state <= STATE_RED;
	endcase
end

always @(*) begin
	LED_R = 1'b1;
	LED_G = 1'b1;
	LED_B = 1'b1;

	case (current_state)
	
		STATE_RED   : LED_R = 1'b0;
		STATE_GREEN : LED_G = 1'b0;
		STATE_BLUE  : LED_B = 1'b0;
		STATE_ALL   : begin
			LED_R = 1'b0;
			LED_G = 1'b0;		
		end
	endcase
end

endmodule







