module rx_packet(clk, rst_n, process_packet, rx_waiting, pb_data_rx, pb_wren_rx, pb_address_rx, rx_fifo_rd_req, rx_fifo_rd_data, read_ether, from_address, to_address, local_address, read_counter); 

input clk, rst_n; 
input process_packet;
output reg rx_waiting;
output reg [15:0]pb_data_rx;
output reg pb_wren_rx; 
output reg [8:0]pb_address_rx; 
output reg rx_fifo_rd_req;
input [15:0]rx_fifo_rd_data; 

output reg [15:0]read_ether; 
output reg [47:0]from_address; 
output reg [47:0]to_address; 
input wire [47:0]local_address; 

output reg [10:0] read_counter;

reg [5:0] e_state;
reg [10:0] counter;
reg [8:0]next_address; 

parameter STATE_LENGTH1=	5'd0, 
	  STATE_MAC3=		5'd1, 
	  STATE_MAC2=		5'd2, 
	  STATE_MAC1=		5'd3, 
	  STATE_ETHER=		5'd4, 
	  STATE_DATA_READ=	5'd5, 
	  STATE_DATA_WRITE1=	5'd6,
	  IDLE=			5'd7,
	  IDLE2=		5'd8,
	  ERROR=		5'd9,
	  STATE_MAC3_2=		5'd10, 
	  STATE_MAC2_2=		5'd11, 
	  STATE_MAC1_2=		5'd12, 
	  STATE_DATA_WRITE2=	5'd13,
	  STATE_LENGTH2=	5'd14,
	  DELAY_SPIN=		5'd15,
	  START=		5'd16;

/* For ENDIAN reversal in some cases */
wire [15:0]rx_fifo_rd_reverse;
assign rx_fifo_rd_reverse = {rx_fifo_rd_data[7:0], rx_fifo_rd_data[15:8]};
reg [7:0]delay_spin_count;

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		e_state <= IDLE;
		pb_data_rx <= 16'h0;
		pb_wren_rx <= 1'b0; 
		pb_address_rx <= 9'h0; 
		rx_fifo_rd_req <= 1'b0;

		read_counter <= 11'h0;
		counter <= 11'h0;

		rx_waiting <= 1'b1;
		delay_spin_count <= 8'd0;
	end
	else 
	begin
	case (e_state)
			IDLE:
			begin
				e_state <= (process_packet == 1'b1) ? IDLE2 : IDLE; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 
				rx_fifo_rd_req <= 1'b0;

				rx_waiting <= 1'b1;
			end
			IDLE2:
			begin
				e_state <= (process_packet == 1'b0) ? DELAY_SPIN : IDLE2; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 
				rx_fifo_rd_req <= 1'b0;

				counter <= 11'h0;
				rx_waiting <= 1'b0;

				delay_spin_count <= 8'd0;
			end
			DELAY_SPIN:
			begin
				e_state <= (delay_spin_count == 8'd200) ? STATE_LENGTH1 : DELAY_SPIN; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 
				rx_fifo_rd_req <= 1'b0;

				counter <= 11'h0;
				rx_waiting <= 1'b0;
				delay_spin_count <= delay_spin_count +1'b1;

	//			rx_fifo_rd_req <= (delay_spin_count == 8'd200) ? 1'b1 : 1'b0;
			end
			STATE_LENGTH1: 
			begin
				e_state <= STATE_LENGTH2;

				read_counter <= rx_fifo_rd_data[10:0];
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2; // 2 bytes per 16 bit packet
			end
			STATE_LENGTH2: 
			begin
				e_state <= STATE_MAC3;

				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC3: 
			begin
				e_state <= STATE_MAC2;

				to_address[47:32] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end 
			STATE_MAC2: 
			begin
				e_state <= STATE_MAC1;

				to_address[31:16] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC1: 
			begin
				e_state <= STATE_MAC3_2;

				to_address[15:0] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC3_2: 
			begin
				e_state <= STATE_MAC2_2;

				from_address[47:32] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end 
			STATE_MAC2_2: 
			begin
				e_state <= STATE_MAC1_2;

				from_address[31:16] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC1_2: 
			begin
				e_state <= STATE_ETHER;

				from_address[15:0] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_ETHER: 
			begin
				e_state <= STATE_DATA_READ;

				read_ether <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b0;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 9'h0; 

				counter <= counter + 2'd2;
			end
			STATE_DATA_READ: 
			begin
				e_state <= STATE_DATA_WRITE1;

				rx_fifo_rd_req <= 1'b1;

				pb_wren_rx <= 1'b0; 

				next_address <= 9'd256 + (9'd64 * (from_address - 1'b1)); // 512 bytes handles 4 players receive at 256 + 64 * player_id -1 
				/* choose the location to store the packet based on the address */
			end
			STATE_DATA_WRITE1: 
			begin
				rx_fifo_rd_req <= (counter > read_counter) ? 1'b0 : 1'b1;
				pb_data_rx <= rx_fifo_rd_data;
				pb_wren_rx <= 1'b1;

				e_state <= (counter>read_counter) ? IDLE : STATE_DATA_WRITE1;

				counter <= counter + 2'd2;
				/* increment to next address */			 
				pb_address_rx <= next_address;
				next_address <= next_address + 1'b1;
			end
			default: e_state <= ERROR;
		endcase
	end
end
endmodule

module tx_packet(clk, rst_n, send_packet, transfer_ready, destination_address, pb_address_start, num_words_16, pb_q, pb_wren, pb_address, tx_fifo_wr_req, tx_fifo_wr_data, tx_fifo_full);

input clk, rst_n; 
input send_packet;
output reg transfer_ready; 
input [8:0]pb_address_start; 
input [10:0]num_words_16; 
input [15:0]pb_q;
output reg pb_wren; 
output reg [8:0]pb_address; 
output reg tx_fifo_wr_req;
output reg [15:0]tx_fifo_wr_data; 
input tx_fifo_full;
input [47:0]destination_address;

reg [3:0] e_state;
reg [10:0] counter;
wire [10:0] exit_counter;

parameter STATE_LENGTH=4'd0, 
	  STATE_MAC3=4'd1, 
	  STATE_MAC2=4'd2, 
	  STATE_MAC1=4'd3, 
	  STATE_ETHER=4'd4, 
	  STATE_DATA_READ1=4'd5, 
	  STATE_DATA_READ2=4'd6, 
	  STATE_DATA_WRITE=4'd7,
	  IDLE=4'd8,
	  IDLE2=4'd9,
	  DELAY_SPIN=		4'd10,
	  ERROR=		4'd11;

parameter ETHER_TYPE = 16'h0A0A;

reg [7:0]spin;

/* Exit counter - used to figure out when the wraparound will happen */
assign exit_counter = (counter == num_words_16-11'd2) ? 11'd0 : counter+11'd2;

always @ (posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0) 
	begin
		e_state <= IDLE;
		counter <= 11'b0;

		pb_address <= 9'h0;
		pb_wren <= 1'b0; 

		transfer_ready <= 1'b1;
	end
	else 
	begin
	case (e_state)
			IDLE:
			begin
				e_state <= (send_packet == 1'b1) ? IDLE2 : IDLE; 
				tx_fifo_wr_req <= 1'b0;
				tx_fifo_wr_data <= 16'b0;
				pb_wren <= 1'b0; 

				transfer_ready <= 1'b1;

				spin <= 8'd0;
			end
			IDLE2:
			begin
				e_state <= (send_packet == 1'b0) ? STATE_LENGTH : IDLE2; 
				tx_fifo_wr_req <= 1'b0;
				tx_fifo_wr_data <= 16'b0;
				pb_wren <= 1'b0; 

				transfer_ready <= 1'b0;
			end
			STATE_LENGTH: 
			begin
				tx_fifo_wr_data <= {5'b00000,num_words_16}; //TODO: CHECK ENDIANNESS
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC3 : STATE_LENGTH;
				pb_wren <= 1'b0; 
			end
			STATE_MAC3: 
			begin
				tx_fifo_wr_data <= destination_address[47:32];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC2 : STATE_MAC3;
				pb_wren <= 1'b0; 
			end 
			STATE_MAC2: 
			begin
				tx_fifo_wr_data <= destination_address[31:16];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC1 : STATE_MAC2;
				pb_wren <= 1'b0; 
			end
			STATE_MAC1: 
			begin
				tx_fifo_wr_data <= destination_address[15:0];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_ETHER : STATE_MAC1;
				pb_wren <= 1'b0; 
			end
			STATE_ETHER: 
			begin
				tx_fifo_wr_data <= ETHER_TYPE; //TODO: ENDIANNESS
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_DATA_READ1 : STATE_ETHER; //data_read?
				pb_wren <= 1'b0; 

				pb_address <= pb_address_start;
			end
			STATE_DATA_READ1: begin
				tx_fifo_wr_req <= 1'b0;
				e_state <= ~tx_fifo_full ? STATE_DATA_READ2 : STATE_DATA_READ1;
				pb_wren <= 1'b0; 

				tx_fifo_wr_data <= pb_q;
			end
			STATE_DATA_READ2: begin
				tx_fifo_wr_req <= 1'b0;
				e_state <= ~tx_fifo_full ? STATE_DATA_WRITE : STATE_DATA_READ2;
				pb_wren <= 1'b0; 

				tx_fifo_wr_data <= pb_q;
			end
			STATE_DATA_WRITE: 
			begin
				tx_fifo_wr_data <= pb_q;

				tx_fifo_wr_req <= ~tx_fifo_full;

				counter <= ~tx_fifo_full ? exit_counter : counter;
				e_state <= (exit_counter==11'd0 && ~tx_fifo_full) ? DELAY_SPIN : //all done
						 (exit_counter!=11'd0 && ~tx_fifo_full) ? STATE_DATA_READ1 : //next word
						 STATE_DATA_WRITE; //write this word over

				/* increment to next address */			 
				pb_address <= pb_address + 1'b1;
			end
			DELAY_SPIN:
			begin
				tx_fifo_wr_req <= 1'b0;

				e_state <= (spin > 8'd128) ? IDLE : DELAY_SPIN;
				spin <= spin + 1'b1;
			end
			default: e_state <= ERROR;
		endcase
	end
end

endmodule

