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
module crystal_read (
		input system_clk, 
		input rst_n, 
		input get_crystal_array, 
		input [7:0]GPIO_0i,
		output reg [7:0]GPIO_0o,
		output reg [3:0] power_crystal_A_hooked_up_to,
		output reg [3:0] power_crystal_2_hooked_up_to,
		output reg [3:0] power_crystal_3_hooked_up_to,
		output reg [3:0] power_crystal_4_hooked_up_to,
		output reg [3:0] power_crystal_5_hooked_up_to,
		output reg [3:0] power_crystal_6_hooked_up_to,
		output reg [3:0] power_crystal_7_hooked_up_to,
		output reg [3:0] power_crystal_8_hooked_up_to 
		);

reg [19:0]timer;
parameter TIMER_COUNT=20'd50000;

reg [3:0]next_crystals;
reg [4:0]crystal_state;
parameter 	
		IDLE			=	5'd1,
		IDLE2			=	5'd2,
		START_A			=	5'd3,
		READ_A			=	5'd4,
		START_2			=	5'd5,
		READ_2			=	5'd6,
		START_3			=	5'd7,
		READ_3			=	5'd8,
		START_4			=	5'd9,
		READ_4			=	5'd10,
		START_5			=	5'd11,
		READ_5			=	5'd12,
		START_6			=	5'd13,
		READ_6			=	5'd14,
		START_7			=	5'd15,
		READ_7			=	5'd16,
		START_8			=	5'd17,
		READ_8			=	5'd18,
		NEXT_2			=	5'd19,
		NEXT_3			=	5'd20,
		NEXT_4			=	5'd21,
		NEXT_5			=	5'd22,
		NEXT_6			=	5'd23,
		NEXT_7			=	5'd24,
		NEXT_8			=	5'd25,
		ERROR			= 	5'b11111;
	
/* this sets values for your ship to control - very simple */
always @ (posedge system_clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		crystal_state <= IDLE;
		power_crystal_A_hooked_up_to <= 4'd7;
		power_crystal_2_hooked_up_to <= 4'd0;
		power_crystal_3_hooked_up_to <= 4'd1;
		power_crystal_4_hooked_up_to <= 4'd2;
		power_crystal_5_hooked_up_to <= 4'd3;
		power_crystal_6_hooked_up_to <= 4'd4;
		power_crystal_7_hooked_up_to <= 4'd5;
		power_crystal_8_hooked_up_to <= 4'd6;
		timer <= 20'd0;
	end
	else 
	begin
		case(crystal_state)
			IDLE:
			begin
				crystal_state <= get_crystal_array == 1'b1 ? IDLE2 : IDLE;
			end
			IDLE2:
			begin
				crystal_state <= get_crystal_array == 1'b0 ? START_A : IDLE2;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_A:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_A : START_A;
				GPIO_0o[0] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_A:
			begin
				crystal_state <= NEXT_2;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_A_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_A_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_A_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_A_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_A_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_A_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_A_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_A_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end
			NEXT_2:
			begin
				crystal_state <= START_2;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_2:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_2 : START_2;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_2:
			begin
				crystal_state <= NEXT_3;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_2_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_2_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_2_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_2_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_2_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_2_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_2_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_2_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end			
			NEXT_3:
			begin
				crystal_state <= START_3;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_3:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_3 : START_3;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_3:
			begin
				crystal_state <= NEXT_4;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_3_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_3_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_3_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_3_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_3_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_3_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_3_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_3_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end
			NEXT_4:
			begin
				crystal_state <= START_4;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_4:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_4 : START_4;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_4:
			begin
				crystal_state <= NEXT_5;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_4_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_4_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_4_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_4_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_4_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_4_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_4_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_4_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end			
			NEXT_5:
			begin
				crystal_state <= START_5;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_5:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_5 : START_5;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_5:
			begin
				crystal_state <= NEXT_6;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_5_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_5_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_5_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_5_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_5_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_5_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_5_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_5_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end			
			NEXT_6:
			begin
				crystal_state <= START_6;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_6:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_6 : START_6;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_6:
			begin
				crystal_state <= NEXT_7;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_6_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_6_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_6_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_6_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_6_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_6_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_6_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_6_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end			
			NEXT_7:
			begin
				crystal_state <= START_7;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_7:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_7 : START_7;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_7:
			begin
				crystal_state <= NEXT_8;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_7_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_7_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_7_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_7_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_7_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_7_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_7_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_7_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end
			NEXT_8:
			begin
				crystal_state <= START_8;
				timer <= 20'd0;
				GPIO_0o[0] <= 1'b0;
				GPIO_0o[1] <= 1'b0;
				GPIO_0o[2] <= 1'b0;
				GPIO_0o[3] <= 1'b0;
				GPIO_0o[4] <= 1'b0;
				GPIO_0o[5] <= 1'b0;
				GPIO_0o[6] <= 1'b0;
				GPIO_0o[7] <= 1'b0;
			end
			START_8:
			begin
				crystal_state <= (timer > TIMER_COUNT) ? READ_8 : START_8;
				GPIO_0o[next_crystals] <= 1'b1;
				timer <= timer + 1'b1;
			end
			READ_8:
			begin
				crystal_state <= IDLE;

				case (GPIO_0i[7:0])
					8'b00000001:
					begin
						next_crystals <= 4'd0;
						power_crystal_8_hooked_up_to <= 4'd0;
					end
					8'b00000010:
					begin
						next_crystals <= 4'd1;
						power_crystal_8_hooked_up_to <= 4'd1;
					end
					8'b00000100:
					begin
						next_crystals <= 4'd2;
						power_crystal_8_hooked_up_to <= 4'd2;
					end
					8'b00001000:
					begin
						next_crystals <= 4'd3;
						power_crystal_8_hooked_up_to <= 4'd3;
					end
					8'b00010000:
					begin
						next_crystals <= 4'd4;
						power_crystal_8_hooked_up_to <= 4'd4;
					end
					8'b00100000:
					begin
						next_crystals <= 4'd5;
						power_crystal_8_hooked_up_to <= 4'd5;
					end
					8'b01000000:
					begin
						next_crystals <= 4'd6;
						power_crystal_8_hooked_up_to <= 4'd6;
					end
					8'b10000000:
					begin
						next_crystals <= 4'd7;
						power_crystal_8_hooked_up_to <= 4'd7;
					end
					default:
					begin
						next_crystals <= 4'b1111;
						power_crystal_8_hooked_up_to <= 4'b1111;
					end
				endcase
			end
		endcase
	end
end

endmodule
