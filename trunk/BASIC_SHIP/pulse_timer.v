/* Based on a 50 MHz clock sends a pulse up down and a single clock pulse based on pulse_time */
module pulse_timer(clk, rst_n, pulse_clk, pulse_1_clk_on, pulse_time);
input clk, rst_n; 
output reg pulse_clk; 
output reg pulse_1_clk_on; 
input [31:0]pulse_time;

reg [4:0]pulse_state;
reg pulse_fast;
parameter PULSE_DONE = 26'd2000000;
parameter 	
		PCOUNTDOWN		=	5'd1,
		PRESET_TIMER		=	5'd0;

reg [32:0]pulse_timer; // spots for 50MHz ticks

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		pulse_timer <= 32'd0;
		pulse_state <= PRESET_TIMER;
		pulse_clk <= 1'b1;
		pulse_1_clk_on <= 1'b0;
	end
	else 
	begin
		case (pulse_state)
			PRESET_TIMER:
			begin
				pulse_state <= PCOUNTDOWN; 
				pulse_timer <= 32'd0;
				pulse_clk <= ~pulse_clk;
				pulse_1_clk_on <= 1'b1;
			end
			PCOUNTDOWN:
			begin
				pulse_state <= (pulse_timer >= pulse_time) ? PRESET_TIMER : PCOUNTDOWN; 
				pulse_timer <= pulse_timer + 1'b1;
				pulse_1_clk_on <= 1'b0;
			end
		endcase
	end
end

endmodule
