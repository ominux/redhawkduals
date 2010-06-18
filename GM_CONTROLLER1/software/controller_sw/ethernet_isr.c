#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include "system.h"

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

#include "sys/alt_irq.h"

#include "globals.h"
#include "types.h"
#include "ethernet_isr.h"

volatile int p_edge_capture;
short isr_update;

/*---------------------------------------------------------------------------------------------
 * timer_packet_interrupt_isr
 *-------------------------------------------------------------------------------------------*/
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void timer_packet_interrupt_isr(void* context)
#else
void timer_packet_interrupt_isr(void* context, alt_u32 id)
#endif
{
	volatile int* p_edge_capture_ptr = (volatile int*) context;

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0x0 );

	// get the packet
	get_player_info();

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0xf );
	/* Store the value in the Button's edge capture register in *context. */
	*p_edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE);
	/* Reset the Button's edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE, 0xf);

	/* Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.  */
	IORD_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE);
}

/*---------------------------------------------------------------------------------------------
 * get_player_info
 * Goes to the ethernet core on the board and gets all the player data
 *-------------------------------------------------------------------------------------------*/
void get_player_info()
{
	volatile alt_u32 input_packet_reg;
	alt_u32 output_packet_reg = 0;
	alt_u32 mask;
	int i;

	isr_update = TRUE;

	/* tell the core your ready to receive data */
	mask = 1 << 30; // bit 31 is the rdy_read
	output_packet_reg = output_packet_reg | mask;
	IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);

	for (i = 0; i < 256; i++)
	{
		/* spin for send data */
		input_packet_reg = IORD_ALTERA_AVALON_PIO_DATA(INPUT_PACKET_BASE);
		mask = 1 << 16; // bit 17 will go high when the send packet can be read

		while ((input_packet_reg & mask) == 0)
		{
			//printf("%x: Spin for packet: %x\n", i, input_packet_reg);
			input_packet_reg = IORD_ALTERA_AVALON_PIO_DATA(INPUT_PACKET_BASE);
		}
	
		/* store the packet and increment the counter */
		packets[i+256] = (alt_u16)input_packet_reg;

		/* send the ack bit */
		mask = 1 << 31; 
		output_packet_reg = mask;
		IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
		/* turn off - assumes NIOS slower than design ... might throw delay */
		output_packet_reg = 0;
		IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
	}

	/* find the bits for each of the actions - Player 1 */
	p1_ship.cA_hookedup_to = 	(packets[256] & 0xE000) >> 13;
	p1_ship.c2_hookedup_to = 	(packets[256] & 0x1C00) >> 10;
	p1_ship.c3_hookedup_to = 	(packets[256] & 0x0380) >> 7;
	p1_ship.c4_hookedup_to = 	(packets[256] & 0x0070) >> 4;
	p1_ship.engine = 		(packets[256] & 0x0008) >> 3;
	p1_ship.c5_hookedup_to = 	(packets[257] & 0xE000) >> 13;
	p1_ship.c6_hookedup_to = 	(packets[257] & 0x1C00) >> 10;
	p1_ship.c7_hookedup_to = 	(packets[257] & 0x0380) >> 7;
	p1_ship.c8_hookedup_to = 	(packets[257] & 0x0070) >> 4;
	p1_ship.engine_left_right = 	(packets[257] & 0x000C) >> 2;
	p1_ship.sensor_state = 	(packets[258] &	0x00C0) >> 6;
	p1_ship.sensor_move = 	(packets[258] & 0xFF00) >> 8;
	p1_ship.cannon_fire = 	(packets[259] &	0x8000) >> 15;
	p1_ship.cannon_power = 	(packets[259] & 0x7FC0) >> 5;
	p1_ship.checksum =		packets[260];

	/* player 2 */
	p2_ship.cA_hookedup_to = 	(packets[320] & 0xE000) >> 13;
	p2_ship.c2_hookedup_to = 	(packets[320] & 0x1C00) >> 10;
	p2_ship.c3_hookedup_to = 	(packets[320] & 0x0380) >> 7;
	p2_ship.c4_hookedup_to = 	(packets[320] & 0x0070) >> 4;
	p2_ship.engine = 	(packets[320] & 0x0008) >> 3;
	p2_ship.c5_hookedup_to = 	(packets[321] & 0xE000) >> 13;
	p2_ship.c6_hookedup_to = 	(packets[321] & 0x1C00) >> 10;
	p2_ship.c7_hookedup_to = 	(packets[321] & 0x0380) >> 7;
	p2_ship.c8_hookedup_to = 	(packets[321] & 0x0070) >> 4;
	p2_ship.engine_left_right = 	(packets[321] & 0x000C) >> 2;
	p2_ship.sensor_state = 	(packets[322] &	0x00C0) >> 6;
	p2_ship.sensor_move = 	(packets[322] & 0xFF00) >> 8;
	p2_ship.cannon_fire = 	(packets[323] &	0x8000) >> 15;
	p2_ship.cannon_power = 	(packets[323] & 0x7FC0) >> 5;
	p2_ship.checksum =		packets[324];

	/* now send the packets of the ship back */
	for (i = 0; i < 256; i++)
	{
		/* send the word */
		output_packet_reg = packets[i]; 
		IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
		/* send the next bit send ready on idx 29 */
		mask = 1 << 29; 
		output_packet_reg = output_packet_reg | mask;
		IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
		/* turn off - assumes NIOS slower than design ... might throw delay */
		output_packet_reg = 0;
		IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
	}

	/* send all sends there */
	mask = 1 << 28; 
	output_packet_reg = mask;
	IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
}

/*---------------------------------------------------------------------------------------------
 * init_packet_interrupt_isr
 *-------------------------------------------------------------------------------------------*/
void init_packet_interrupt_isr()
{
	void* p_edge_capture_ptr = (void*) &p_edge_capture;
	/* Enable all 4 button interrupts. */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0xf);
	/* Reset the edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE, 0xf); // needs to be high for all four buttons since the push button is high

	/*
	 * Register the interrupt handler.
	 * Provision is made here for systems that might have either the
	 * legacy or enhanced interrupt API active, or for the Nios II IDE
	 * which does not support enhanced interrupts. For systems created using
	 * the Nios II softawre build tools, the enhanced API is recommended
	 * for new designs.
	 */
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
	alt_ic_isr_register(PUSH_BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID,PUSH_BUTTONS_IRQ, timer_packet_interrupt_isr, p_edge_capture_ptr, 0x0);
#else
	alt_irq_register( PUSH_BUTTONS_IRQ, p_edge_capture_ptr, timer_packet_interrupt_isr);
#endif
}

/*---------------------------------------------------------------------------------------------
 * update_packets_to_send_back
 *-------------------------------------------------------------------------------------------*/
void update_packets_to_send_back(ship_t *ship, int address_start)
{
	packets[address_start+0] = 	((ship->A_E_val << 12) & 0xF000) | 
					((ship->A_D_val << 8) &  0x0F00) |
					((ship->A_C_val << 4) &  0x00F0) |
					((ship->A_B_val) 	&  0x000F);
	packets[address_start+1] = 	((ship->B_C_val << 12) & 0xF000) | 
					((ship->A_H_val << 8) &  0x0F00) |
					((ship->A_G_val << 4) &  0x00F0) |
					((ship->A_F_val) 	&  0x000F);
	packets[address_start+2] = 	((ship->B_G_val << 12) & 0xF000) | 
					((ship->B_F_val << 8) &  0x0F00) |
					((ship->B_E_val << 4) &  0x00F0) |
					((ship->B_D_val) 	&  0x000F);
	packets[address_start+3] = 	((ship->C_F_val << 12) & 0xF000) | 
					((ship->C_E_val << 8) &  0x0F00) |
					((ship->C_D_val << 4) &  0x00F0) |
					((ship->B_H_val) 	&  0x000F);
	packets[address_start+4] = 	((ship->D_F_val << 12) & 0xF000) | 
					((ship->D_E_val << 8) &  0x0F00) |
					((ship->C_H_val << 4) &  0x00F0) |
					((ship->C_G_val) 	&  0x000F);
	packets[address_start+5] = 	((ship->E_G_val << 12) & 0xF000) | 
					((ship->E_F_val << 8) &  0x0F00) |
					((ship->D_H_val << 4) &  0x00F0) |
					((ship->D_G_val) 	&  0x000F);
	packets[address_start+6] = 	((ship->G_H_val << 12) & 0xF000) | 
					((ship->F_H_val << 8) &  0x0F00) |
					((ship->F_G_val << 4) &  0x00F0) |
					((ship->E_H_val) 	&  0x000F);
	packets[address_start+7] = 	ship->sensor_detected_something;
	packets[address_start+8] = 	roundf(ship->x);
	packets[address_start+9] = 	roundf(ship->y);
	packets[address_start+10] = 	ship->rx_checksum;
}
