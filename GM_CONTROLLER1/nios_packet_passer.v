
module pb_to_nios_passer(
		input clk, 
		input rst_n,
		output reg [8:0]pb_address_proc_read,
		output reg pb_wren_proc_read,
		output reg [31:0]nios_packets_in_or_input_signals,
		input [31:0]nios_packets_out_or_output_signals,
		input [15:0]pb_q,
		input do_transfer,
		output reg transfered
		);

reg [3:0]pb_to_proc_state;
reg [8:0]count;
parameter 	IDLE=		4'd0,
		INIT_SEND=	4'd1,
		SEND=		4'd2,
		WAIT_ACK=	4'd3,
		READ_PB=	4'd4,
		IDLE2=		4'hF;

always@(posedge clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
	begin
		pb_to_proc_state <= IDLE;
		pb_address_proc_read <= 9'd0;
		count <= 9'd0;
		pb_wren_proc_read <= 1'b0;
		nios_packets_in_or_input_signals[15:0] <= 16'hFFFF;
		nios_packets_in_or_input_signals[16] <= 1'b0;
		nios_packets_in_or_input_signals[31] <= 1'b0; // send request
		transfered <= 1'b1;
	end
	else
	begin
		case (pb_to_proc_state)
			IDLE:
			begin
				pb_to_proc_state <= (do_transfer == 1'b1) ? IDLE2 : IDLE;

				count <= 9'd0;
				pb_wren_proc_read <= 1'b0;
				transfered <= 1'b1;
			end	
			IDLE2:
			begin
				pb_to_proc_state <= (do_transfer == 1'b0) ? INIT_SEND : IDLE2;

				count <= 9'd0;
				pb_wren_proc_read <= 1'b0;

				pb_address_proc_read <= count;

				nios_packets_in_or_input_signals[31] <= 1'b0; // send request
				transfered <= 1'b0;
			end	
			INIT_SEND:
			begin
				pb_to_proc_state <= (nios_packets_out_or_output_signals[30] == 1'b1) ? READ_PB : INIT_SEND; // wait for rdy_read

				pb_wren_proc_read <= 1'b0;

				nios_packets_in_or_input_signals[31] <= 1'b1; // send request
			end
			READ_PB:
			begin
				pb_to_proc_state <= (nios_packets_out_or_output_signals[31] == 1'b1) ? READ_PB : SEND; // make sure ack is back down

				pb_address_proc_read <= count;
				pb_wren_proc_read <= 1'b0;

				nios_packets_in_or_input_signals[31] <= 1'b0;
			end
			SEND:
			begin
				pb_to_proc_state <= WAIT_ACK;

				nios_packets_in_or_input_signals[15:0] <= pb_q;
				nios_packets_in_or_input_signals[16] <= 1'b1;

				count <= count + 1'b1;
				pb_wren_proc_read <= 1'b0;
			end
			WAIT_ACK:
			begin
				pb_to_proc_state <= (nios_packets_out_or_output_signals[31] == 1'b0) ? WAIT_ACK : (count == 9'd256) ? IDLE : READ_PB; // wait for the ack
				nios_packets_in_or_input_signals[16] <= (nios_packets_out_or_output_signals[31] == 1'b0) ? 1'b1 : 1'b0;

				pb_wren_proc_read <= 1'b0;
			end
			default:
				pb_to_proc_state <= IDLE;
		endcase
	end
end


endmodule
