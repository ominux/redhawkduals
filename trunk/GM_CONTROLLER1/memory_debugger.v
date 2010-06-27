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
module memory_debug_r_and_w(clk, 
		rst_n, 
		pb_address_debug,
		pb_data_debug,
		pb_wren_debug,
		read_do,
		read_do_next,
		read_start_address,
		read_num,
		write_do,
		write_clear,
		write_start_address,
		write_num,
		ready_for_next
		);

input clk, rst_n;
output reg [8:0]pb_address_debug;
output reg [15:0]pb_data_debug;
output reg pb_wren_debug;
input read_do;
input read_do_next;
input [8:0]read_start_address;
input [8:0]read_num;
input write_do;
input write_clear;
input [8:0]write_start_address;
input [8:0]write_num;
output reg ready_for_next; 

reg [3:0] m_state;
reg [8:0] m_counter;
reg [8:0] m_read_counter;

parameter 	M_IDLE1=	4'd0, 
		M_IDLE2=	4'd1, 
		M_IDLE3=	4'd2, 
		M_INIT_READ=	4'd3, 
		M_READ_NEXT=	4'd4,
		M_INCREMENT=	4'd5,
		M_INIT_WRITE= 	4'd6,
		M_WRITE_NEXT1=	4'd7;

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		m_state <= M_IDLE1;
		m_read_counter <= 9'h0;
		m_counter <= 9'h0;
		pb_address_debug <= 9'h0;
		pb_wren_debug <= 1'b0;
		pb_data_debug <= 16'd0; 
		ready_for_next <= 1'b1;
	end
	else 
	begin
		case (m_state)
			M_IDLE1:
			begin
				m_state <= (read_do == 1'b1) ? M_IDLE2 : (write_do == 1'b1) ? M_IDLE3 : M_IDLE1; 

				m_read_counter <= 9'h0;
				m_counter <= 9'h0;
				pb_address_debug <= 9'h0;
				pb_wren_debug <= 1'b0;
				pb_data_debug <= 16'd0; 
				ready_for_next <= 1'b1;
			end
			M_IDLE2:
			begin
				m_state <= (read_do == 1'b0) ? M_INIT_READ : M_IDLE2; 

				m_counter <= 9'h0;
				pb_address_debug <= 9'h0;
				pb_wren_debug <= 1'b0;
				m_read_counter <= read_num;
				pb_address_debug <= read_start_address;

				ready_for_next <= 1'b0;
			end
			M_INCREMENT:
			begin
				m_state <= M_INIT_READ;

				m_counter <= m_counter + 1'b1;
				pb_wren_debug <= 1'b0;
			end
			M_INIT_READ:
			begin
				m_state <= (read_do_next == 1'b1) ? M_READ_NEXT : M_INIT_READ;

				pb_wren_debug <= 1'b0;
			end
			M_READ_NEXT:
			begin
				m_state <= (m_counter == m_read_counter) ? M_IDLE1 : (read_do_next == 1'b0) ? M_INCREMENT : M_READ_NEXT; 

				pb_address_debug <= m_counter;
				pb_wren_debug <= 1'b0;
			end
			M_IDLE3:
			begin
				m_state <= (write_do == 1'b0) ? M_INIT_WRITE : M_IDLE3; 

				m_read_counter <= 9'h0;
				m_counter <= 9'h0;
				pb_wren_debug <= 1'b0;

				ready_for_next <= 1'b0;
				pb_address_debug <= write_start_address;
			end
			M_INIT_WRITE:
			begin
				m_state <= M_WRITE_NEXT1;

				m_read_counter <= write_num;
				m_counter <= 9'h0;
				pb_wren_debug <= 1'b0;
			end
			M_WRITE_NEXT1:
			begin
				m_state <= (m_counter == m_read_counter) ? M_IDLE1 : M_WRITE_NEXT1; 

				m_counter <= m_counter + 1'b1;
				pb_data_debug <= (write_clear == 1'b1) ? 16'd0 : m_counter + 1'd1; // + 1'd1 gets rid of 0
				pb_address_debug <= m_counter;
				pb_wren_debug <= 1'b1;
			end
		endcase
	end
end

endmodule

