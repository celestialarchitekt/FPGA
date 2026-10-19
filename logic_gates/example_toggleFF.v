// T Flip-Flop using Verilog with Counter Automation

module T_FF(
    input CLK,
    output reg LED_R
);

    reg [28:0] counter = 0;

    // Use a counter bit to drive the T (Toggle) input slowly
    wire T = counter[24]; 

    always @(posedge CLK) begin
        counter <= counter + 1'b1;

        if (T) begin
            LED_R <= ~LED_R; // Toggle state (flips output)
        end else begin
            LED_R <= LED_R;  // Hold state (keeps current output)
        end
    end

endmodule
