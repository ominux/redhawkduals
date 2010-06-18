/* Using a state machine, debounces the switches */
module debounce_DE2_SW (clk, rst_n, SW, SWO);
input rst_n, clk;
input [17:0]SW;
output [17:0]SWO;
wire [17:0]SWO;

debouncer sw0(clk, rst_n, SW[0], SWO[0]);
debouncer sw1(clk, rst_n, SW[1], SWO[1]);
debouncer sw2(clk, rst_n, SW[2], SWO[2]);
debouncer sw3(clk, rst_n, SW[3], SWO[3]);
debouncer sw4(clk, rst_n, SW[4], SWO[4]);
debouncer sw5(clk, rst_n, SW[5], SWO[5]);
debouncer sw6(clk, rst_n, SW[6], SWO[6]);
debouncer sw7(clk, rst_n, SW[7], SWO[7]);
debouncer sw8(clk, rst_n, SW[8], SWO[8]);
debouncer sw9(clk, rst_n, SW[9], SWO[9]);
debouncer sw10(clk, rst_n, SW[10], SWO[10]);
debouncer sw11(clk, rst_n, SW[11], SWO[11]);
debouncer sw12(clk, rst_n, SW[12], SWO[12]);
debouncer sw13(clk, rst_n, SW[13], SWO[13]);
debouncer sw14(clk, rst_n, SW[14], SWO[14]);
debouncer sw15(clk, rst_n, SW[15], SWO[15]);
debouncer sw16(clk, rst_n, SW[16], SWO[16]);
debouncer sw17(clk, rst_n, SW[17], SWO[17]);

endmodule

module debouncer (clk, rst_n, noisy, clean);
input rst_n, clk, noisy;
output clean;
   
reg xnew, clean;

reg [1:0] b_state;
reg [19:0] b_counter;

parameter 	ON=		2'd0, 
		ON_2_OFF=	2'd1, 
		OFF=		2'd2, 
		OFF_2_ON=	2'd3;

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		b_state <= OFF;
		b_counter <= 20'b0;
		clean <= 1'b0;
	end
	else 
	begin
		case (b_state)
			ON:
			begin
				b_state <= (noisy == 1'b0) ? ON_2_OFF : ON; 
				b_counter <= 20'b0;
				clean <= 1'b1;
			end
			OFF:
			begin
				b_state <= (noisy == 1'b1) ? OFF_2_ON : OFF; 
				b_counter <= 20'b0;
				clean <= 1'b0;
			end
			ON_2_OFF:
			begin
				b_state <= (b_counter >= 20'd5000) ? OFF : ON_2_OFF;  // 5000 50 MHz ticks of the clock...experimentally determined
				b_counter <= b_counter + 1'b1;
				clean <= 1'b1;
			end
			OFF_2_ON:
			begin
				b_state <= (b_counter >= 20'd5000) ? ON : OFF_2_ON;  // 5000 50 MHz ticks of the clock...experimentally determined
				b_counter <= b_counter + 1'b1;
				clean <= 1'b0;
			end
		endcase
	end
end
	
endmodule
