module gm_controller
	(
		////////////////////	Clock Input	 	////////////////////	 
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[17:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		HEX4,							//	Seven Segment Digit 4
		HEX5,							//	Seven Segment Digit 5
		HEX6,							//	Seven Segment Digit 6
		HEX7,							//	Seven Segment Digit 7
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[8:0]
		LEDR,							//	LED Red[17:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		////////////////////////	IRDA	////////////////////////
		IRDA_TXD,						//	IRDA Transmitter
		IRDA_RXD,						//	IRDA Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask 
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask 
		SRAM_LB_N,						//	SRAM Low-byte Data Mask 
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	ISP1362 Interface	////////////////
		OTG_DATA,						//	ISP1362 Data bus 16 Bits
		OTG_ADDR,						//	ISP1362 Address 2 Bits
		OTG_CS_N,						//	ISP1362 Chip Select
		OTG_RD_N,						//	ISP1362 Write
		OTG_WR_N,						//	ISP1362 Read
		OTG_RST_N,						//	ISP1362 Reset
		OTG_FSPEED,						//	USB Full Speed,	0 = Enable, Z = Disable
		OTG_LSPEED,						//	USB Low Speed, 	0 = Enable, Z = Disable
		OTG_INT0,						//	ISP1362 Interrupt 0
		OTG_INT1,						//	ISP1362 Interrupt 1
		OTG_DREQ0,						//	ISP1362 DMA Request 0
		OTG_DREQ1,						//	ISP1362 DMA Request 1
		OTG_DACK0_N,					//	ISP1362 DMA Acknowledge 0
		OTG_DACK1_N,					//	ISP1362 DMA Acknowledge 1
		////////////////////	LCD Module 16X2		////////////////
		LCD_ON,							//	LCD Power ON/OFF
		LCD_BLON,						//	LCD Back Light ON/OFF
		LCD_RW,							//	LCD Read/Write Select, 0 = Write, 1 = Read
		LCD_EN,							//	LCD Enable
		LCD_RS,							//	LCD Command/Data Select, 0 = Command, 1 = Data
		LCD_DATA,						//	LCD Data bus 8 bits
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK,						//	VGA BLANK
		VGA_SYNC,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,  						//	VGA Blue[9:0]
		////////////	Ethernet Interface	////////////////////////
		ENET_DATA,						//	DM9000A DATA bus 16Bits
		ENET_CMD,						//	DM9000A Command/Data Select, 0 = Command, 1 = Data
		ENET_CS_N,						//	DM9000A Chip Select
		ENET_WR_N,						//	DM9000A Write
		ENET_RD_N,						//	DM9000A Read
		ENET_RST_N,						//	DM9000A Reset
		ENET_INT,						//	DM9000A Interrupt
		ENET_CLK,						//	DM9000A Clock 25 MHz
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////	TV Decoder		////////////////////////
		TD_DATA,    					//	TV Decoder Data bus 8 bits
		TD_HS,							//	TV Decoder H_SYNC
		TD_VS,							//	TV Decoder V_SYNC
		TD_RESET,						//	TV Decoder Reset
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input			CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	[3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	[17:0]	SW;						//	Toggle Switch[17:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
output	[6:0]	HEX4;					//	Seven Segment Digit 4
output	[6:0]	HEX5;					//	Seven Segment Digit 5
output	[6:0]	HEX6;					//	Seven Segment Digit 6
output	[6:0]	HEX7;					//	Seven Segment Digit 7
////////////////////////////	LED		////////////////////////////
output	[8:0]	LEDG;					//	LED Green[8:0]
output	[17:0]	LEDR;					//	LED Red[17:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			UART_RXD;				//	UART Receiver
////////////////////////////	IRDA	////////////////////////////
output			IRDA_TXD;				//	IRDA Transmitter
input			IRDA_RXD;				//	IRDA Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask 
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output	[21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	[15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output	[17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask 
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask 
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	ISP1362 Interface	////////////////////////
inout	[15:0]	OTG_DATA;				//	ISP1362 Data bus 16 Bits
output	[1:0]	OTG_ADDR;				//	ISP1362 Address 2 Bits
output			OTG_CS_N;				//	ISP1362 Chip Select
output			OTG_RD_N;				//	ISP1362 Write
output			OTG_WR_N;				//	ISP1362 Read
output			OTG_RST_N;				//	ISP1362 Reset
output			OTG_FSPEED;				//	USB Full Speed,	0 = Enable, Z = Disable
output			OTG_LSPEED;				//	USB Low Speed, 	0 = Enable, Z = Disable
input			OTG_INT0;				//	ISP1362 Interrupt 0
input			OTG_INT1;				//	ISP1362 Interrupt 1
input			OTG_DREQ0;				//	ISP1362 DMA Request 0
input			OTG_DREQ1;				//	ISP1362 DMA Request 1
output			OTG_DACK0_N;			//	ISP1362 DMA Acknowledge 0
output			OTG_DACK1_N;			//	ISP1362 DMA Acknowledge 1
////////////////////	LCD Module 16X2	////////////////////////////
inout	[7:0]	LCD_DATA;				//	LCD Data bus 8 bits
output			LCD_ON;					//	LCD Power ON/OFF
output			LCD_BLON;				//	LCD Back Light ON/OFF
output			LCD_RW;					//	LCD Read/Write Select, 0 = Write, 1 = Read
output			LCD_EN;					//	LCD Enable
output			LCD_RS;					//	LCD Command/Data Select, 0 = Command, 1 = Data
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT;					//	SD Card Data
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	PS2_DAT;				//	PS2 Data
input			PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_CLK;   				//	VGA Clock
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output			VGA_BLANK;				//	VGA BLANK
output			VGA_SYNC;				//	VGA SYNC
output	[9:0]	VGA_R;   				//	VGA Red[9:0]
output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
////////////////	Ethernet Interface	////////////////////////////
inout	[15:0]	ENET_DATA;				//	DM9000A DATA bus 16Bits
output			ENET_CMD;				//	DM9000A Command/Data Select, 0 = Command, 1 = Data
output			ENET_CS_N;				//	DM9000A Chip Select
output			ENET_WR_N;				//	DM9000A Write
output			ENET_RD_N;				//	DM9000A Read
output			ENET_RST_N;				//	DM9000A Reset
input			ENET_INT;				//	DM9000A Interrupt
output			ENET_CLK;				//	DM9000A Clock 25 MHz
////////////////////	Audio CODEC		////////////////////////////
inout			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////	TV Devoder		////////////////////////////
input	[7:0]	TD_DATA;    			//	TV Decoder Data bus 8 bits
input			TD_HS;					//	TV Decoder H_SYNC
input			TD_VS;					//	TV Decoder V_SYNC
output			TD_RESET;				//	TV Decoder Reset
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

//	Turn on all display
//assign	HEX0		=	7'h00;
//assign	HEX1		=	7'h00;
//assign	HEX2		=	7'h00;
//assign	HEX3		=	7'h00;
//assign	HEX4		=	7'h00;
//assign	HEX5		=	7'h00;
//assign	HEX6		=	7'h00;
//assign	HEX7		=	7'h00;
assign	LCD_ON		=	1'b1;
assign	LCD_BLON	=	1'b1;

//	All inout port turn to tri-state
//assign	DRAM_DQ		=	16'hzzzz;
assign	FL_DQ		=	8'hzz;
//assign	SRAM_DQ		=	16'hzzzz;
assign	OTG_DATA	=	16'hzzzz;
assign	LCD_DATA	=	8'hzz;
assign	SD_DAT		=	1'bz;
//assign	I2C_SDAT	=	1'bz;
//assign	AUD_ADCLRCK	=	1'bz;
//assign	AUD_DACLRCK	=	1'bz;
//assign	AUD_BCLK	=	1'bz;
assign	GPIO_0		=	36'hzzzzzzzzz;
assign	GPIO_1		=	36'hzzzzzzzzz;

wire rst_n;
//reg rst_n_tmp;
//assign rst_n = SW[17]; // don't debounce reset since ddebouncer depends on reset
assign rst_n = KEY[0]; // don't debounce reset since ddebouncer depends on reset
//always @ (posedge system_clk) 
//begin
//	rst_n_tmp <= SW[17];
//	rst_n <= rst_n_tmp;
//end

wire ENET_CLK;
assign ENET_CLK = VGA_CLK;

wire [17:0]SWO;
wire system_clk;
debounce_DE2_SW debSW(system_clk, rst_n, SW, SWO);

wire pulse_fast;
wire pulse_fast_1_clk;
pulse_timer quart_sec(system_clk, rst_n, pulse_fast, pulse_fast_1_clk, 32'd2000000);
wire pulse_2_sec;
wire pulse_2_sec_1_clk_on;
assign LEDG[6] = pulse_2_sec;
pulse_timer two_sec(system_clk, rst_n, pulse_2_sec, pulse_2_sec_1_clk_on, 32'd50000000);

assign LEDR[17:2] = SWO[16] == 1'b1 ? {memory_usage_state, pb_address, pb_wren} : {1'b0};

wire [26:0]leds_from_nios;
processor1 the_processor1(
                    // 1) global signals:
                     .clk_0(system_clk),
                     .reset_n(rst_n),

                    // the_de_boards_0
                     .DRAM_CLK_from_the_de_boards_0(DRAM_CLK),
                     .AUD_XCK_from_the_de_boards_0(AUD_XCK), // if want, then need 27MHz clock uncommented
                     .VGA_CLK_from_the_de_boards_0(VGA_CLK),
                     .ext_clk_27_to_the_de_boards_0(CLOCK_27),
                     .ext_clk_50_to_the_de_boards_0(CLOCK_50),
		     .system_clk_from_the_de_boards_0(system_clk),

                    // the_lcd_0
                     .LCD_E_from_the_lcd_0(LCD_EN),
                     .LCD_RS_from_the_lcd_0(LCD_RS),
                     .LCD_RW_from_the_lcd_0(LCD_RW),
                     .LCD_data_to_and_from_the_lcd_0(LCD_DATA),

                    // the_leds
                     .out_port_from_the_leds(leds_from_nios),

                    // the_push_buttons
                     .in_port_to_the_push_buttons(interrupt_line),

                    // the_sdram_0
                     .zs_addr_from_the_sdram_0(DRAM_ADDR),
                     .zs_ba_from_the_sdram_0({DRAM_BA_1, DRAM_BA_0}),
                     .zs_cas_n_from_the_sdram_0(DRAM_CAS_N),
                     .zs_cke_from_the_sdram_0(DRAM_CKE),
                     .zs_cs_n_from_the_sdram_0(DRAM_CS_N),
                     .zs_dq_to_and_from_the_sdram_0(DRAM_DQ),
                     .zs_dqm_from_the_sdram_0({DRAM_UDQM, DRAM_LDQM}),
                     .zs_ras_n_from_the_sdram_0(DRAM_RAS_N),
                     .zs_we_n_from_the_sdram_0(DRAM_WE_N),

                    // the_switches
                     .in_port_to_the_switches({memory_usage_state, pb_wren}),

                    // the_input_packet
                     .in_port_to_the_input_packet(nios_packets_in),
                    // the_output_packet
                     .out_port_from_the_output_packet(nios_packets_out),

		    // the_sram_0
                     .SRAM_ADDR_from_the_sram_0(SRAM_ADDR),
                     .SRAM_CE_N_from_the_sram_0(SRAM_CE_N),
                     .SRAM_DQ_to_and_from_the_sram_0(SRAM_DQ),
                     .SRAM_LB_N_from_the_sram_0(SRAM_LB_N),
                     .SRAM_OE_N_from_the_sram_0(SRAM_OE_N),
                     .SRAM_UB_N_from_the_sram_0(SRAM_UB_N),
                     .SRAM_WE_N_from_the_sram_0(SRAM_WE_N),

		    // the_vga_0
                     .VGA_BLANK_from_the_vga_0(VGA_BLANK),
                     .VGA_B_from_the_vga_0(VGA_B),
                     .VGA_G_from_the_vga_0(VGA_G),
                     .VGA_HS_from_the_vga_0(VGA_HS),
                     .VGA_R_from_the_vga_0(VGA_R),
                     .VGA_SYNC_from_the_vga_0(VGA_SYNC),
                     .VGA_VS_from_the_vga_0(VGA_VS),

                    // the_audio_0
                     .AUD_ADCDAT_to_the_audio_0(AUD_ADCDAT),
                     .AUD_ADCLRCK_to_and_from_the_audio_0(AUD_ADCLRCK),
                     .AUD_BCLK_to_and_from_the_audio_0(AUD_BCLK),
                     .AUD_DACDAT_from_the_audio_0(AUD_DACDAT),
                     .AUD_DACLRCK_to_and_from_the_audio_0(AUD_DACLRCK),

                    // the_audio_and_video_config_0
                     .I2C_SCLK_from_the_audio_and_video_config_0(I2C_SCLK),
                     .I2C_SDAT_to_and_from_the_audio_and_video_config_0(I2C_SDAT)


                  );
	
wire [31:0]nios_packets_out; // 31=ack 30=rdy_read 15:0 - data out 29=data_ready 28=data_done_transmission 27= new_game_init
wire [8:0]pb_address;
wire [15:0]pb_data;
wire pb_wren;

assign pb_address = (memory_usage_state == ARBITRATE) ? 9'd0 : (memory_usage_state == TX) ? pb_address_tx : (memory_usage_state == RX) ? pb_address_rx : (memory_usage_state == PROC_READ) ? pb_address_proc_read : (memory_usage_state == PROC_WRITE) ? pb_address_proc_write : pb_address_debug;
assign pb_data = (memory_usage_state == ARBITRATE) ? 16'd0 : (memory_usage_state == RX) ? pb_data_rx : (memory_usage_state == PROC_WRITE) ? pb_data_proc_write : pb_data_debug;
assign pb_wren = (memory_usage_state == ARBITRATE) ? 1'd0 : (memory_usage_state == TX) ? pb_wren_tx : (memory_usage_state == RX) ? pb_wren_rx : (memory_usage_state == PROC_READ) ? pb_wren_proc_read : (memory_usage_state == PROC_WRITE) ? pb_wren_proc_write : pb_wren_debug;

reg [2:0]memory_usage_state;
parameter 	
		ARBITRATE=	3'd0,
		TX=		3'd1,
		RX=		3'd2,
		PROC_READ=	3'd3,
		PROC_WRITE=	3'd4,
		DEBUG=		3'd5;

always@(posedge system_clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
	begin
		memory_usage_state <= DEBUG;
	end
	else
	begin
		if (transmitting_to_players == 1'b1)
		begin
			memory_usage_state <= TX; 
		end
		else if (no_packets_to_read == 1'b0 && memory_bus_free == 1'b1) // the fifo in the ethernet will sit here until all processed
		begin
			memory_usage_state <= RX; 
		end
		else if (sending_to_nios) // last part temp stop
		begin
			memory_usage_state <= PROC_READ; 
		end
		else if (receiving_from_nios)
		begin
			memory_usage_state <= PROC_WRITE; 
		end
		else if (SWO[13] == 1'b1 || SWO[11] == 1'b1)
		begin
			memory_usage_state <= DEBUG; 
		end
	end
end	

wire [15:0] pb_q;
/* Memory to store packets in both NIOS and ETHernet */
packet_buffer p2_packets (
	pb_address,
	system_clk,
	pb_data,
	pb_wren,
	pb_q);

reg [8:0]pb_address_proc_read;
reg pb_wren_proc_read;
reg [31:0]nios_packets_in;
reg [15:0]pb_data_proc_write;
reg [8:0]pb_address_proc_write;
reg pb_wren_proc_write;
reg send_ship_data;
reg transmitting_to_players;
reg memory_bus_free;
reg sending_to_nios;
reg receiving_from_nios;
reg [2:0]players_tx;
reg [47:0]player_send_address;
reg [8:0]player_data_address;
reg [3:0]interrupt_line;

reg [5:0]pb_to_proc_state;
reg [8:0]count;
parameter 	RESET_TIMER=		5'd0,
		INIT_SEND=		5'd1,
		SEND=			5'd2,
		WAIT_ACK=		5'd3,
		READ_PB=		5'd4,
		INIT_RECEIVE=		5'd5,
		RECEIVE_PACKETS=	5'd6,
		WAIT_UNTIL_LOW=		5'd7,
		RECEIVE_DATA_WRITE=	5'd8,
		TRANSMIT_PLAYERS=	5'd9,
		REQUEST_TX=		5'd10,
		TX_COMPLETE=		5'd11,
		TX_NEXT=		5'd12,
		NEXT_ADDRESS_TO_WRITE=	5'd13,
		PROC_INTERRUPT_FOR_TRANSFER= 5'd14,
		NEW_GAME= 		5'd15,
		WAIT_FOR_USERS=		5'd16,
		WAIT_FOR_USERS2=	5'd17,
		COUNTDOWN=		5'b11111;
parameter TIMER_OUT= 32'd50000000;
reg [31:0]timer;
reg [31:0]reset_game_timer;
reg reset_game;

always@(posedge system_clk or negedge rst_n)
begin
	if (rst_n == 1'b0)
	begin
		pb_to_proc_state <= RESET_TIMER;
		pb_address_proc_read <= 9'd0;
		count <= 9'd0;
		pb_wren_proc_read <= 1'b0;
		nios_packets_in[15:0] <= 16'hFFFF;
		nios_packets_in[16] <= 1'b0;
		nios_packets_in[31] <= 1'b0; // send request
		nios_packets_in[27] <= 1'b0;
		memory_bus_free <= 1'b1; 
		sending_to_nios <= 1'b0;
		receiving_from_nios <= 1'b0;
		transmitting_to_players <= 1'b0;
		interrupt_line <= 4'd0;
		reset_game <= 1'b0;
	end
	else
	begin
		case (pb_to_proc_state)
			RESET_TIMER:
			begin
				pb_to_proc_state <= nios_packets_out[27] == 1'b1 ? NEW_GAME : (SWO[0] == 1'b1) ? COUNTDOWN : RESET_TIMER; 
				timer <= 32'd0;
				reset_game_timer <= 32'd0;
				memory_bus_free <= 1'b1; 
				sending_to_nios <= 1'b0;
				receiving_from_nios <= 1'b0;
				transmitting_to_players <= 1'b0;

				nios_packets_in[27] <= 1'b0;
				reset_game <= 1'b0;

				nios_packets_in[31] <= 1'b0;
				interrupt_line <= 4'd0;
			end
			NEW_GAME:
			begin
				pb_to_proc_state <= (reset_game_timer >= TIMER_OUT && SWO[2] == 1'b1) ? WAIT_FOR_USERS : NEW_GAME; 
				reset_game_timer <= reset_game_timer + 1'b1;

				/* unique window and short, so just does once */
				reset_game <= (reset_game_timer > 32'd3 && reset_game_timer <= 32'd5) ? 1'b1 : 1'b0; // only reset the memory once
			end
			WAIT_FOR_USERS:
			begin
				pb_to_proc_state <= (SWO[2] == 1'b1) ? WAIT_FOR_USERS2 : WAIT_FOR_USERS;
				nios_packets_in[27] <= 1'b1; // send the pulse saying the hardware is resetting
			end
			WAIT_FOR_USERS2:
			begin
				pb_to_proc_state <= (SWO[2] == 1'b0 &&  nios_packets_out[27] == 1'b0) ? RESET_TIMER : WAIT_FOR_USERS2;
			end
			COUNTDOWN:
			begin
				pb_to_proc_state <= (timer >= TIMER_OUT && no_packets_to_read == 1'b1) ? PROC_INTERRUPT_FOR_TRANSFER : COUNTDOWN; 
				timer <= timer + 1'b1;

				count <= 9'd256;
				pb_wren_proc_read <= 1'b0;
				pb_address_proc_read <= 9'd256;

				nios_packets_in[31] <= 1'b0;
			end	
			PROC_INTERRUPT_FOR_TRANSFER:
			begin
				pb_to_proc_state <= INIT_SEND;
				sending_to_nios <= 1'b1;
				interrupt_line <= 4'hF;
			end
			INIT_SEND:
			begin
				pb_to_proc_state <= (nios_packets_out[30] == 1'b1) ? READ_PB : INIT_SEND; // wait for rdy_read

				memory_bus_free <= 1'b0; // locks from packet_rx
				sending_to_nios <= 1'b1;
				pb_wren_proc_read <= 1'b0;

				nios_packets_in[31] <= 1'b1; // send request
				interrupt_line <= 4'h0;
			end
			READ_PB:
			begin
				pb_to_proc_state <= (nios_packets_out[31] == 1'b1) ? READ_PB : SEND; // make sure ack is back down

				pb_address_proc_read <= count;
				pb_wren_proc_read <= 1'b0;

				nios_packets_in[31] <= 1'b0;
			end
			SEND:
			begin
				pb_to_proc_state <= WAIT_ACK;

				nios_packets_in[15:0] <= pb_q;
				nios_packets_in[16] <= 1'b1;

				count <= count + 1'b1;
				pb_wren_proc_read <= 1'b0;
			end
			WAIT_ACK:
			begin
				pb_to_proc_state <= (nios_packets_out[31] == 1'b0) ? WAIT_ACK : (count == 9'd0) ? INIT_RECEIVE : READ_PB; // wait for the ack
				nios_packets_in[16] <= (nios_packets_out[31] == 1'b0) ? 1'b1 : 1'b0;

				pb_wren_proc_read <= 1'b0;

			end
			INIT_RECEIVE:
			begin
				pb_to_proc_state <= RECEIVE_PACKETS;

				pb_wren_proc_write <= 1'b0;
				pb_address_proc_write <= 9'd0;				

				receiving_from_nios <= 1'b1;
				sending_to_nios <= 1'b0;

				players_tx <= 3'd0;
			end
			RECEIVE_PACKETS:
			begin
				pb_to_proc_state <= (nios_packets_out[28] == 1'b1) ? TRANSMIT_PLAYERS : (nios_packets_out[29] == 1'b1) ? WAIT_UNTIL_LOW : RECEIVE_PACKETS;

				pb_data_proc_write <= nios_packets_out[15:0];		
				pb_wren_proc_write <= 1'b0;
			end
			WAIT_UNTIL_LOW:
			begin
				pb_to_proc_state <= (nios_packets_out[29] == 1'b0) ? RECEIVE_DATA_WRITE : WAIT_UNTIL_LOW;
			end
			RECEIVE_DATA_WRITE:
			begin
				pb_to_proc_state <= NEXT_ADDRESS_TO_WRITE;

				pb_wren_proc_write <= 1'b1;
			end
			NEXT_ADDRESS_TO_WRITE:
			begin
				pb_to_proc_state <= RECEIVE_PACKETS;

				pb_wren_proc_write <= 1'b0;
				pb_address_proc_write <= pb_address_proc_write + 1'b1;
			end
			TRANSMIT_PLAYERS:
			begin
				pb_to_proc_state <= (transfer_ready == 1'b1) ? REQUEST_TX : TRANSMIT_PLAYERS;

				receiving_from_nios <= 1'b0;
				transmitting_to_players <= 1'b1;

				player_send_address <= players_tx + 1'b1; // number + 1...gm is 0address
				player_data_address <= 9'd64 * players_tx; // all data is located at address 0 and up in incrtements of 64

				send_ship_data <= (transfer_ready == 1'b1) ? 1'b1 : 1'b0;
			end
			REQUEST_TX:
			begin
				pb_to_proc_state <= (transfer_ready == 1'b0) ? TX_COMPLETE : REQUEST_TX;

				send_ship_data <= 1'b0;
			end
			TX_COMPLETE:
			begin
				pb_to_proc_state <= (transfer_ready == 1'b1) ? TX_NEXT : TX_COMPLETE;
			end
			TX_NEXT:
			begin
				pb_to_proc_state <= (players_tx == 3'd1) ? RESET_TIMER : TRANSMIT_PLAYERS; // number of players - 1 since add happens later

				players_tx <= players_tx + 1'b1;
			end
			default:
				pb_to_proc_state <= RESET_TIMER;
		endcase
	end
end

wire [15:0] to_see2;
assign to_see2 = (SWO[15] == 1'b0) ? {5'd0, num_read_packets} : pb_to_proc_state;
seg7 h4(to_see2[3:0],HEX4);
seg7 h5(to_see2[7:4],HEX5);
seg7 h6(to_see2[11:8],HEX6);
seg7 h7(to_see2[15:12],HEX7);

wire [15:0] to_see1;
assign to_see1 = (SWO[15] == 1'b0) ? pb_q : 16'hF;
seg7 h0(to_see1[3:0],HEX0);
seg7 h1(to_see1[7:4],HEX1);
seg7 h2(to_see1[11:8],HEX2);
seg7 h3(to_see1[15:12],HEX3);

wire [8:0]pb_address_debug;
wire [15:0]pb_data_debug;
wire pb_wren_debug;
wire debug_memory_ready;
memory_debug_r_and_w debug_pb(
		.clk(system_clk), 
		.rst_n(rst_n), 
		.pb_address_debug(pb_address_debug),
		.pb_data_debug(pb_data_debug),
		.pb_wren_debug(pb_wren_debug),
		.read_do(SWO[13]),
		.read_do_next((SWO[12] & pulse_fast) | ~KEY[1]),
		.read_start_address(9'd0),
		.read_num(9'd128),
		.write_do(SWO[11] || reset_game),
		.write_clear(SWO[12] || reset_game),
		.write_start_address(9'd0),
		.write_num(9'd510),
		.ready_for_next(debug_memory_ready)
		);

////ETHERNET****************************

wire tx_fifo_full;
wire [15:0]rx_fifo_rd_data;
wire no_packets_to_read;
assign LEDR[0] = no_packets_to_read;
//Ethernet Module Instantiation
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
						.rx_fifo_full(LEDR[1]),

						.tx_fifo_wr_clk(system_clk),
						.tx_fifo_wr_req(tx_fifo_wr_req),
						.tx_fifo_wr_data(tx_fifo_wr_data),
						.tx_fifo_full(tx_fifo_full),
						
						.halt(1'b0),
						.link_status(LEDG[7]),
						.from_address({48'hFFFFFFFFFFFF}),
						.rx_bad_packet(LEDG[5]) 
						);

/* RECEIVE CONTROL */
reg move_packet_to_pb;
assign LEDG[2:1] = receive_packet_state;
assign LEDG[3] = rx_waiting;

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
				receive_packet_state <= (no_packets_to_read == 1'b0 && memory_bus_free == 1'b1) ? WAIT_RECEIVE : START_RECEIVE;
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

wire rx_fifo_rd_req;
wire [15:0]pb_data_rx;
wire [8:0]pb_address_rx;
wire pb_wren_rx;
wire [10:0]packet_B_counter_rx;
wire [10:0]packet_B_size_rx;
wire [15:0]read_ether_rx; 
wire [47:0]from_address_rx; 
wire [47:0]to_address_rx; 
wire rx_waiting;
rx_packet recevie_packet(.clk(system_clk), 
			.rst_n(rst_n), 
			.process_packet(move_packet_to_pb), 
			.rx_waiting(rx_waiting), 
			.pb_data_rx(pb_data_rx), 
			.pb_wren_rx(pb_wren_rx), 
			.pb_address_rx(pb_address_rx), 
			.rx_fifo_rd_req(rx_fifo_rd_req), 
			.rx_fifo_rd_data(rx_fifo_rd_data),
			.read_ether(read_ether_rx), 
			.from_address(from_address_rx), 
			.to_address(to_address_rx), 
			.local_address(48'h000000000000), // master = 0
			.read_counter(num_read_packets)
			); 

wire [8:0]pb_address_tx;
wire pb_wren_tx;
wire tx_fifo_wr_req;
wire [15:0]tx_fifo_wr_data; 
wire transfer_ready;
wire [10:0]num_read_packets;
tx_packet send_packet(	.clk(system_clk), 
			.rst_n(rst_n), 
			.send_packet(send_ship_data), 
			.transfer_ready(transfer_ready),
			.destination_address(player_send_address), 
			.pb_address_start(player_data_address), // where the send stuff is stored
			.num_words_16(11'd68), // more than we need... 
			.pb_q(pb_q), 
			.pb_wren(pb_wren_tx), 
			.pb_address(pb_address_tx), 
			.tx_fifo_wr_req(tx_fifo_wr_req),
			.tx_fifo_wr_data(tx_fifo_wr_data),
			.tx_fifo_full(tx_fifo_full)
			);

endmodule
