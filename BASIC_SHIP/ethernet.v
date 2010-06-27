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
/* This is the high level module that works with ethernet chip.  It is responsible for sending, receiving, and processing packets */
module data_tx_rx(
	input system_clk,
	input rst_n,

	/* ethernet chip interface */
	inout	[15:0]	ENET_DATA,				//	DM9000A DATA bus 16Bits
	output	ENET_CMD,				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
	output	ENET_CS_N,				//	DM9000A Chip Select
	output	ENET_WR_N,				//	DM9000A Write
	output	ENET_RD_N,				//	DM9000A Read
	output	ENET_RST_N,				//	DM9000A Reset
	input	ENET_INT,				//	DM9000A Interrupt
	input	ENET_CLK,				//	DM9000A Clock 25 MHz

	/* received details */
	output reg [3:0] power_A_B, // these are the amplification powers for each crystal
	output reg [3:0] power_A_C,
	output reg [3:0] power_A_D,
	output reg [3:0] power_A_E,
	output reg [3:0] power_A_F,
	output reg [3:0] power_A_G,
	output reg [3:0] power_A_H,
	output reg [3:0] power_B_C,
	output reg [3:0] power_B_D,
	output reg [3:0] power_B_E,
	output reg [3:0] power_B_F,
	output reg [3:0] power_B_G,
	output reg [3:0] power_B_H,
	output reg [3:0] power_C_D,
	output reg [3:0] power_C_E,
	output reg [3:0] power_C_F,
	output reg [3:0] power_C_G,
	output reg [3:0] power_C_H,
	output reg [3:0] power_D_E,
	output reg [3:0] power_D_F,
	output reg [3:0] power_D_G,
	output reg [3:0] power_D_H,
	output reg [3:0] power_E_F,
	output reg [3:0] power_E_G,
	output reg [3:0] power_E_H,
	output reg [3:0] power_F_G,
	output reg [3:0] power_F_H,
	output reg [3:0] power_G_H,
	output reg [3:0]sensor_detected_something, // 3'd1 = ship, 3'd2 = wall_n, 3'd3 = wall_s, 3'd4 = wall_e, 3'd5 wall_w
	output reg [15:0]x_coord, // where you are
	output reg [15:0]y_coord, // where you are
	output reg [15:0]rx_checksum, // checksum that you should get back on next transmission
	
	/* what the ship is sending */
	// 3+3+3+3+3+3+3+3+1+1+2+8+1+10 = 47bits
	input [2:0] power_crystal_A_hooked_up_to, // these are the hookups for the ship
	input [2:0] power_crystal_2_hooked_up_to,
	input [2:0] power_crystal_3_hooked_up_to,
	input [2:0] power_crystal_4_hooked_up_to,
	input [2:0] power_crystal_5_hooked_up_to,
	input [2:0] power_crystal_6_hooked_up_to,
	input [2:0] power_crystal_7_hooked_up_to,
	input [2:0] power_crystal_8_hooked_up_to,
	input engines_on,
	input [1:0]engines_left_right,// 2'b00 = Don't Move, 2'b01 = Move Left, 2'b10 = Move Right
	input [1:0]sensor_movement_state, // 2'b00 = Don't Move, 2'b01 = Move Left, 2'b10 = Move Right
	input [7:0]sensor_movement_per_sample, // 90 degrees at .5 degree increments = 180...180/samples/sec...4 control samples per s, therefore, 45 is max number 
	input cannon_fire, // 
	input [9:0]cannon_power,
	input [15:0]tx_checksum, // checksum that you might send to verify
	
	/* status info */
	output wire no_packets_to_read,
	output wire link_status,
	input player_number,
	output wire bad_packet

		);

/* locks on the system for arbitrating memories usage */		
reg receiving_signal;
reg updating_send_signals;
reg send_ship_data;

/* packet buffer control signals */
reg [5:0]pb_address_rx_r; 
reg [5:0]pb_address_tx_w;
reg pb_wren_tx;
reg [15:0]pb_data_tx;

/* states for the ethern controller */
reg [4:0]receive_send_state;
reg [4:0]after_spin_read;
parameter 	
		COUNTDOWN		=	5'd1,
		BEGIN_UPDATE_GD		=	5'd2,
		UPACKET1		=	5'd3,
		UPACKET2		=	5'd4,
		UPACKET3		=	5'd5,
		UPACKET4		=	5'd6,
		UPACKET5		=	5'd7,
		UPACKET6		=	5'd8,
		UPACKET7		=	5'd9,
		UPACKET8		=	5'd10,
		UPACKET9		= 	5'd11,
		UPACKET10		= 	5'd12,
		UPACKET11		= 	5'd13,
		UPACKET12		= 	5'd14,
		UPACKET13		= 	5'd15,
		BEGIN_SEND		=	5'd16,
		SPACKET1		=	5'd17,
		SPACKET2		=	5'd18,
		SPACKET3		=	5'd19,
		SPACKET4		=	5'd20,
		REQUEST_TX		=	5'd21,
		TURN_OFF_PROC_SIGS	=	5'd22,
		TX_COMPLETE		= 	5'd23,
		SPIN_READ1		=	5'd24,
		SPIN_READ2		=	5'd25,
		WAIT_FOR_YOUR_PACKET	=	5'd26,
		INIT			=	5'd0;

always @ (posedge system_clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		receive_send_state <= INIT;

		receiving_signal <= 1'b0;
		updating_send_signals <= 1'b0;

		pb_address_rx_r <= 6'd0; 
		pb_address_tx_w <= 6'd0;
		pb_wren_tx <= 1'b0;
		pb_data_tx <= 16'd0;

		send_ship_data <= 1'b0;

		power_A_B <= 4'd0;
		power_A_C <= 4'd0;
		power_A_D <= 4'd0;
		power_A_E <= 4'd0;
		power_A_F <= 4'd0;
		power_A_G <= 4'd0;
		power_A_H <= 4'd0;
		power_B_C <= 4'd0;
		power_B_D <= 4'd0;
		power_B_E <= 4'd0;
		power_B_F <= 4'd0;
		power_B_G <= 4'd0;
		power_B_H <= 4'd0;
		power_C_D <= 4'd0;
		power_C_E <= 4'd0;
		power_C_F <= 4'd0;
		power_C_G <= 4'd0;
		power_C_H <= 4'd0;
		power_D_E <= 4'd0;
		power_D_F <= 4'd0;
		power_D_G <= 4'd0;
		power_D_H <= 4'd0;
		power_E_F <= 4'd0;
		power_E_G <= 4'd0;
		power_E_H <= 4'd0;
		power_F_G <= 4'd0;
		power_F_H <= 4'd0;
		power_G_H <= 4'd0;
		x_coord <= 16'd0;
		y_coord <= 16'd0;
		sensor_detected_something <= 3'd0;
		rx_checksum <= 16'd0;
		
	end
	else 
	begin
	case (receive_send_state)
			INIT:
			begin
				receive_send_state <= WAIT_FOR_YOUR_PACKET; 

				updating_send_signals <= 1'b0;
				receiving_signal <= 1'b0;

				pb_address_rx_r <= 6'd0; 
				pb_address_tx_w <= 6'd0;
				pb_wren_tx <= 1'b0;
				pb_data_tx <= 16'd0;

				send_ship_data <= 1'b0;
			end
			WAIT_FOR_YOUR_PACKET:
			begin
				/* waits until packet for this player is sent ... then we process and send back our state */
				receive_send_state <= (found_your_packet == 1'b1) ? BEGIN_UPDATE_GD : WAIT_FOR_YOUR_PACKET;
			end
			BEGIN_UPDATE_GD:
			begin
				receive_send_state <= SPIN_READ1;
				after_spin_read <= UPACKET1;
				receiving_signal <= 1'b1; // lock that we're receiving
				
				pb_address_rx_r <= 6'd0; // store all the ships receive data at address 64 
			end
			SPIN_READ1: // spins to allow at least two cycle read from on-chip memory
			begin
				receive_send_state <= SPIN_READ2;
			end
			SPIN_READ2:
			begin
				receive_send_state <= after_spin_read;
			end
			/* Send the packets of information */
			UPACKET1:
			begin
				after_spin_read <= UPACKET2;
				receive_send_state <= SPIN_READ1;

				power_A_B <= pb_q_rx[3:0]; // 4 bits
				power_A_C <= pb_q_rx[7:4]; // 8 bits
				power_A_D <= pb_q_rx[11:8]; // 12 bits
				power_A_E <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET2:
			begin
				after_spin_read <= UPACKET3;
				receive_send_state <= SPIN_READ1;

				power_A_F <= pb_q_rx[3:0]; // 4 bits
				power_A_G <= pb_q_rx[7:4]; // 8 bits
				power_A_H <= pb_q_rx[11:8]; // 12 bits
				power_B_C <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET3:
			begin
				after_spin_read <= UPACKET4;
				receive_send_state <= SPIN_READ1;

				power_B_D <= pb_q_rx[3:0]; // 4 bits
				power_B_E <= pb_q_rx[7:4]; // 8 bits
				power_B_F <= pb_q_rx[11:8]; // 12 bits
				power_B_G <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET4:
			begin
				after_spin_read <= UPACKET5;
				receive_send_state <= SPIN_READ1;

				power_B_H <= pb_q_rx[3:0]; // 4 bits
				power_C_D <= pb_q_rx[7:4]; // 8 bits
				power_C_E <= pb_q_rx[11:8]; // 12 bits
				power_C_F <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET5:
			begin
				after_spin_read <= UPACKET6;
				receive_send_state <= SPIN_READ1;

				power_C_G <= pb_q_rx[3:0]; // 4 bits
				power_C_H <= pb_q_rx[7:4]; // 8 bits
				power_D_E <= pb_q_rx[11:8]; // 12 bits
				power_D_F <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET6:
			begin
				after_spin_read <= UPACKET7;
				receive_send_state <= SPIN_READ1;

				power_D_G <= pb_q_rx[3:0]; // 4 bits
				power_D_H <= pb_q_rx[7:4]; // 8 bits
				power_E_F <= pb_q_rx[11:8]; // 12 bits
				power_E_G <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET7:
			begin
				after_spin_read <= UPACKET8;
				receive_send_state <= SPIN_READ1;

				power_E_H <= pb_q_rx[3:0]; // 4 bits
				power_F_G <= pb_q_rx[7:4]; // 8 bits
				power_F_H <= pb_q_rx[11:8]; // 12 bits
				power_G_H <= pb_q_rx[15:12]; // 16 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET8:
			begin
				after_spin_read <= UPACKET9;
				receive_send_state <= SPIN_READ1;

				sensor_detected_something <= pb_q_rx[3:0]; // 4 bits

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET9:
			begin
				after_spin_read <= UPACKET10;
				receive_send_state <= SPIN_READ1;

				x_coord <= pb_q_rx; 

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET10:
			begin
				after_spin_read <= UPACKET11;
				receive_send_state <= SPIN_READ1;

				y_coord <= pb_q_rx; 

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			UPACKET11:
			begin
				after_spin_read <= BEGIN_SEND;
				receive_send_state <= SPIN_READ1;

				rx_checksum <= pb_q_rx; 

				pb_address_rx_r <= pb_address_rx_r + 1'b1;
			end
			/* once packets all received then send our state - first we need to store in the packe buffer */
			BEGIN_SEND:
			begin
				receive_send_state <= SPACKET1;
				updating_send_signals <= 1'b1; // no longer receiving but sending so should take at least one cycle here
				receiving_signal <= 1'b0;
				
				pb_address_tx_w <= 6'd0; // store all the ships receive send data at address 0 
				pb_wren_tx <= 1'b1;
				pb_data_tx <= {power_crystal_A_hooked_up_to, // 3
							power_crystal_2_hooked_up_to, // 6 
							power_crystal_3_hooked_up_to, // 9
							power_crystal_4_hooked_up_to, // 12
							engines_on, // 13
							3'b000}; 
			end
			SPACKET1:
			begin
				receive_send_state <= SPACKET2;

				pb_address_tx_w <= pb_address_tx_w + 1'b1;
				pb_wren_tx <= 1'b1;
				pb_data_tx <= {power_crystal_5_hooked_up_to, // 3
							power_crystal_6_hooked_up_to, // 6 
							power_crystal_7_hooked_up_to, // 9
							power_crystal_8_hooked_up_to, // 12
							engines_left_right, // 13
							2'b000}; 
			end
			SPACKET2:
			begin
				receive_send_state <= SPACKET3;
				
				pb_address_tx_w <= pb_address_tx_w + 1'b1;
				pb_wren_tx <= 1'b1;
				pb_data_tx <= {sensor_movement_per_sample, // 8
							sensor_movement_state, // 10
							6'b000000};
			end
			SPACKET3:
			begin
				receive_send_state <= SPACKET4;
				
				pb_address_tx_w <= pb_address_tx_w + 1'b1;
				pb_wren_tx <= 1'b1;
				pb_data_tx <= {cannon_fire, // 1
							cannon_power, // 11
							5'b00000};
			end
			SPACKET4:
			begin
				receive_send_state <= TURN_OFF_PROC_SIGS;
				
				pb_address_tx_w <= pb_address_tx_w + 1'b1;
				pb_wren_tx <= 1'b1;
				pb_data_tx <= tx_checksum;
			end
			TURN_OFF_PROC_SIGS:
			begin
				receive_send_state <= (transfer_ready == 1'b1) ? REQUEST_TX : TURN_OFF_PROC_SIGS;

				pb_wren_tx <= 1'b0;
			end
			/* now we ask the ethernet to transmit */
			REQUEST_TX:
			begin
				receive_send_state <= TX_COMPLETE;

				updating_send_signals <= 1'b0; 
				receiving_signal <= 1'b0;
				send_ship_data <= 1'b1;
			end
			TX_COMPLETE:
			begin
				receive_send_state <= (transfer_ready == 1'b1) ? INIT : TX_COMPLETE;

				send_ship_data <= 1'b0;
			end
			default:
				receive_send_state <= INIT;
		endcase
	end // reset else
end // always
	
/* This is an on-chip memory to store received packets */
assign pb_address_rx = (receiving_signal == 1'b1) ? pb_address_rx_r : pb_address_rx_w;
wire [15:0] pb_q_rx;
wire [5:0] pb_address_rx;
packet_buffer p2_packets_rx (
	pb_address_rx,
	system_clk,
	pb_data_rx,
	pb_wren_rx,
	pb_q_rx);

/* this is an on-chip memory to store the send packets */
assign pb_address_tx = (updating_send_signals == 1'b1) ? pb_address_tx_w : pb_address_tx_r;
wire [15:0] pb_q_tx;
wire [5:0] pb_address_tx;
packet_buffer p2_packets_tx (
	pb_address_tx,
	system_clk,
	pb_data_tx,
	pb_wren_tx,
	pb_q_tx);

////ETHERNET****************************

wire tx_fifo_full;
wire [15:0]rx_fifo_rd_data;
//Ethernet Module Instantiation - Adam Shapiros with slight modification : (http://sourceforge.net/apps/mediawiki/cu-hw-gps/index.php?title=DM9000A)
dm9000a_controller ethernet (			.clk(system_clk),
						.reset_n(rst_n),
						.enet_clk(ENET_CLK),
						.enet_int(ENET_INT),
						.enet_rst_n(ENET_RST_N),
						.enet_cs_n(ENET_CS_N),
						.enet_cmd(ENET_CMD),
						.enet_wr_n(ENET_WR_N),
						.enet_rd_n(ENET_RD_N),
						.enet_data(ENET_DATA),
						
						.rx_fifo_rd_clk(system_clk),
						.rx_fifo_rd_req(rx_fifo_rd_req),
						.rx_fifo_rd_data(rx_fifo_rd_data),
						.rx_fifo_empty(no_packets_to_read),
						//.rx_fifo_full(),

						.tx_fifo_wr_clk(system_clk),
						.tx_fifo_wr_req(tx_fifo_wr_req),
						.tx_fifo_wr_data(tx_fifo_wr_data),
						.tx_fifo_full(tx_fifo_full),
						
						.halt(1'b0),
						.link_status(link_status),
						.from_address(player_number == 1'b1 ? 48'h000000000002 : 48'h000000000001), // player 1 or 2
						.rx_bad_packet(bad_packet) 
						);

/* RECEIVE CONTROL */
/* If not in the main loop of processing, receives packets and processes them */						
reg move_packet_to_pb;

reg [1:0]receive_packet_state;
parameter
		DO_RECEIVE 	= 2'd3,
		START_RECEIVE 	= 2'd2,
		WAIT_RECEIVE 	= 2'd1,
		RECEIVE_NEXT 	= 2'd0;

always@(posedge system_clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
	begin
		receive_packet_state <= START_RECEIVE;
	end
	else
	begin
		case(receive_packet_state)
			START_RECEIVE:
			begin
				receive_packet_state <= (no_packets_to_read == 1'b0) ? WAIT_RECEIVE : START_RECEIVE;
			end
			WAIT_RECEIVE:
			begin
				receive_packet_state <= (rx_waiting == 1'b1) ? DO_RECEIVE : WAIT_RECEIVE;
			
				move_packet_to_pb <= 1'b1;
			end
			DO_RECEIVE:
			begin
				receive_packet_state <= (rx_waiting == 1'b0) ? RECEIVE_NEXT : DO_RECEIVE;

				move_packet_to_pb <= 1'b0;
			end
			RECEIVE_NEXT:
			begin
				receive_packet_state <= (rx_waiting == 1'b1) ? START_RECEIVE : RECEIVE_NEXT ;
			end
		endcase
	end
end	

/* module receives a packet and puts it in the receive buffer */
wire rx_fifo_rd_req;
wire [15:0]pb_data_rx;
wire [5:0]pb_address_rx_w;
wire pb_wren_rx;
wire [15:0]read_ether_rx; 
wire [47:0]from_address_rx; 
wire [47:0]to_address_rx; 
wire rx_waiting;
wire found_your_packet;
rx_packet recevie_packet(.clk(system_clk), 
			.rst_n(rst_n), 
			.process_packet(move_packet_to_pb), 
			.rx_waiting(rx_waiting), 
			.pb_data_rx(pb_data_rx), 
			.pb_wren_rx(pb_wren_rx), 
			.pb_address_rx(pb_address_rx_w), 
			.rx_fifo_rd_req(rx_fifo_rd_req), 
			.rx_fifo_rd_data(rx_fifo_rd_data),
			.read_ether(read_ether_rx), 
			.from_address(from_address_rx), 
			.to_address(to_address_rx), 
			.local_address(player_number == 1'b1 ? 48'h000000000002 : 48'h000000000001), // player 1 or 2
			.receiving_signal(receiving_signal),
			.found_packet(found_your_packet)
			); 

/* TRansfers packet from the transfer buffer */
wire [5:0]pb_address_tx_r;
wire tx_fifo_wr_req;
wire [15:0]tx_fifo_wr_data; 
wire transfer_ready;
tx_packet send_packet(	.clk(system_clk), 
			.rst_n(rst_n), 
			.send_packet(send_ship_data), 
			.transfer_ready(transfer_ready),
			.destination_address(48'h0000000000000000), // master
			.pb_address_start(6'd0), // where the send stuff is stored
			.num_words_16(11'd64), // more than we need... 
			.pb_q(pb_q_tx), 
			.pb_address(pb_address_tx_r), 
			.tx_fifo_wr_req(tx_fifo_wr_req),
			.tx_fifo_wr_data(tx_fifo_wr_data),
			.tx_fifo_full(tx_fifo_full)
			);

endmodule

/* Module transfers packets to the receive buffer from the ethernets receive fifo */
module rx_packet(clk, rst_n, process_packet, rx_waiting, pb_data_rx, pb_wren_rx, pb_address_rx, rx_fifo_rd_req, rx_fifo_rd_data, read_ether, from_address, to_address, local_address, receiving_signal, found_packet);

input clk, rst_n; 
input process_packet;
output reg rx_waiting;
output reg [15:0]pb_data_rx;
output reg pb_wren_rx; 
output reg [5:0]pb_address_rx; 
output reg rx_fifo_rd_req;
input [15:0]rx_fifo_rd_data; 

output reg [15:0]read_ether; 
output reg [47:0]from_address; 
output reg [47:0]to_address; 
input wire [47:0]local_address; 

input receiving_signal;
output reg found_packet;

reg [10:0] read_counter;

reg [5:0] e_state;
reg [10:0] counter;
reg [5:0]next_address; 

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
	  SEND_SIGNALS=		5'd16,
	  START=		5'd17;

/* For ENDIAN reversal in some cases */
wire [15:0]rx_fifo_rd_reverse;
assign rx_fifo_rd_reverse = {rx_fifo_rd_data[7:0], rx_fifo_rd_data[15:8]};
reg [7:0]delay_spin_count;
reg to_me;

always @ (posedge clk or negedge rst_n) 
begin
	if (rst_n == 1'b0) 
	begin
		e_state <= IDLE;
		pb_data_rx <= 16'h0;
		pb_wren_rx <= 1'b0; 
		pb_address_rx <= 6'h0; 
		rx_fifo_rd_req <= 1'b0;

		read_counter <= 11'h0;
		counter <= 11'h0;

		rx_waiting <= 1'b1;
		delay_spin_count <= 8'd0;
		to_me <= 1'b0;
		found_packet <= 1'b0;
	end
	else 
	begin
	case (e_state)
			IDLE:
			begin
				e_state <= (process_packet == 1'b1) ? IDLE2 : IDLE; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 
				rx_fifo_rd_req <= 1'b0;

				rx_waiting <= 1'b1;
				found_packet <= 1'b0;
			end
			IDLE2:
			begin
				e_state <= (process_packet == 1'b0) ? DELAY_SPIN : IDLE2; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 
				rx_fifo_rd_req <= 1'b0;

				counter <= 11'h0;
				rx_waiting <= 1'b0;

				delay_spin_count <= 8'd0;
			end
			DELAY_SPIN:
			begin
				/* need the delay spin so that we give the ethernet module time to read all the packet */
				e_state <= (delay_spin_count == 8'd200) ? STATE_LENGTH1 : DELAY_SPIN; 

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 
				rx_fifo_rd_req <= 1'b0;

				counter <= 11'h0;
				rx_waiting <= 1'b0;
				delay_spin_count <= delay_spin_count +1'b1;
			end
			STATE_LENGTH1: 
			begin
				e_state <= STATE_LENGTH2;

				read_counter <= rx_fifo_rd_data[10:0];
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2; // 2 bytes per 16 bit packet
			end
			STATE_LENGTH2: 
			begin
				e_state <= STATE_MAC3;

				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC3: 
			begin
				e_state <= STATE_MAC2;

				to_address[47:32] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end 
			STATE_MAC2: 
			begin
				e_state <= STATE_MAC1;

				to_address[31:16] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC1: 
			begin
				e_state <= STATE_MAC3_2;

				to_address[15:0] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC3_2: 
			begin
				e_state <= STATE_MAC2_2;

				from_address[47:32] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 


				counter <= counter + 2'd2;
			end 
			STATE_MAC2_2: 
			begin
				e_state <= STATE_MAC1_2;

				from_address[31:16] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_MAC1_2: 
			begin
				e_state <= STATE_ETHER;

				from_address[15:0] <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b1;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_ETHER: 
			begin
				e_state <= STATE_DATA_READ;

				read_ether <= rx_fifo_rd_reverse;
				rx_fifo_rd_req <= 1'b0;

				pb_data_rx <= 16'h0;
				pb_wren_rx <= 1'b0; 
				pb_address_rx <= 6'h0; 

				counter <= counter + 2'd2;
			end
			STATE_DATA_READ: 
			begin

				rx_fifo_rd_req <= 1'b1;

				pb_wren_rx <= 1'b0; 

				/* choose the location to store the packet based on the address */
				if (to_address == local_address)
				begin
					e_state <= STATE_DATA_WRITE1;
					to_me <= 1'b1;
					next_address <= 6'd0;
				end
				else	
				begin
					e_state <= STATE_DATA_WRITE2;
					to_me <= 1'b0;
				end
			end
			STATE_DATA_WRITE1: 
			begin
				/* packet we care about since it's addressed to us, so store */
				rx_fifo_rd_req <= (counter > read_counter) ? 1'b0 : (receiving_signal == 1'b0) ? 1'b1 : 1'b0;
				pb_data_rx <= rx_fifo_rd_data;
				pb_wren_rx <= (receiving_signal == 1'b0) ? 1'b1 : 1'b0;

				e_state <= (counter>read_counter) ? SEND_SIGNALS : STATE_DATA_WRITE1;

				counter <= (receiving_signal == 1'b0) ? counter + 2'd2 : counter;
				/* increment to next address */			 
				pb_address_rx <= next_address;
				next_address <= (receiving_signal == 1'b0) ? next_address + 1'b1 : next_address;
			end
			STATE_DATA_WRITE2: 
			begin
				/* not a packet we care about */
				rx_fifo_rd_req <= (counter > read_counter) ? 1'b0 : 1'b1;
				e_state <= (counter>read_counter) ? SEND_SIGNALS : STATE_DATA_WRITE2;
				counter <= counter + 2'd2;
			end
			SEND_SIGNALS:
			begin
				e_state <= IDLE;
				if (to_me == 1'b1)
					found_packet <= 1'b1;
			end
			default: e_state <= ERROR;
		endcase
	end
end
endmodule

/* This module transmits a packet to the master from the packet buffer memory */
module tx_packet(clk, rst_n, send_packet, transfer_ready, destination_address, pb_address_start, num_words_16, pb_q, pb_address, tx_fifo_wr_req, tx_fifo_wr_data, tx_fifo_full);

input clk, rst_n; 
input send_packet;
output reg transfer_ready; 
input [5:0]pb_address_start; 
input [10:0]num_words_16; 
input [15:0]pb_q;
output reg [5:0]pb_address; 
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
	  ERROR=4'd10;

parameter ETHER_TYPE = 16'h0A0A;

/* Exit counter - used to figure out when the wraparound will happen */
assign exit_counter = (counter == num_words_16-11'd2) ? 11'd0 : counter+11'd2;

always @ (posedge clk or negedge rst_n) begin
	if (rst_n == 1'b0) 
	begin
		e_state <= IDLE;
		counter <= 11'b0;

		pb_address <= 6'h0;

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

				transfer_ready <= 1'b1;
			end
			IDLE2:
			begin
				e_state <= (send_packet == 1'b0) ? STATE_LENGTH : IDLE2; 
				tx_fifo_wr_req <= 1'b0;
				tx_fifo_wr_data <= 16'b0;

				transfer_ready <= 1'b0;
			end
			STATE_LENGTH: 
			begin
				tx_fifo_wr_data <= {5'b00000,num_words_16};
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC3 : STATE_LENGTH;
			end
			STATE_MAC3: 
			begin
				tx_fifo_wr_data <= destination_address[47:32];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC2 : STATE_MAC3;
			end 
			STATE_MAC2: 
			begin
				tx_fifo_wr_data <= destination_address[31:16];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_MAC1 : STATE_MAC2;
			end
			STATE_MAC1: 
			begin
				tx_fifo_wr_data <= destination_address[15:0];
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_ETHER : STATE_MAC1;
			end
			STATE_ETHER: 
			begin
				tx_fifo_wr_data <= ETHER_TYPE;
				tx_fifo_wr_req <= ~tx_fifo_full;
				e_state <= ~tx_fifo_full ? STATE_DATA_READ1 : STATE_ETHER;

				pb_address <= pb_address_start;
			end
			STATE_DATA_READ1: 
			begin
				/* two cycles to read properly from memory */
				tx_fifo_wr_req <= 1'b0;
				e_state <= ~tx_fifo_full ? STATE_DATA_READ2 : STATE_DATA_READ1;

				tx_fifo_wr_data <= pb_q;
			end
			STATE_DATA_READ2: 
			begin
				tx_fifo_wr_req <= 1'b0;
				e_state <= ~tx_fifo_full ? STATE_DATA_WRITE : STATE_DATA_READ2;

				tx_fifo_wr_data <= pb_q;
			end
			STATE_DATA_WRITE: 
			begin
				tx_fifo_wr_data <= pb_q;

				tx_fifo_wr_req <= ~tx_fifo_full;

				counter <= ~tx_fifo_full ? exit_counter : counter;
				e_state <= (exit_counter==11'd0 && ~tx_fifo_full) ? IDLE : //all done
						 (exit_counter!=11'd0 && ~tx_fifo_full) ? STATE_DATA_READ1 : //next word
						 STATE_DATA_WRITE; //write this word over

				/* increment to next address */			 
				pb_address <= pb_address + 1'b1;
			end
			default: e_state <= ERROR;
		endcase
	end
end

endmodule

