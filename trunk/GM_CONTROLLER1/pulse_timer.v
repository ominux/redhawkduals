/*

This software/hardware design was originally created by Peter Jamieson
jamiespa@muohio.edu  http://www.users.muohio.edu/jamiespa/

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

*/ 
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
