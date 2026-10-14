
module logic_circuit(
	input [2:0] SW,
	output LED_R
);


assign LED_R = (SW[0]&SW[1]) | (~SW[0]&SW[2]) ;

endmodule
