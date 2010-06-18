#include <stdio.h>
#include <unistd.h>
#include "system.h"

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_pixel_buffer.h"

#include "sys/alt_irq.h"
#include "sys/alt_stdio.h"

#include "globals.h"
#include "types.h"
#include "ethernet_isr.h"
#include "draw.h"
#include "game_loop.h"
#include "ship.h"
#include "io.h"

alt_up_pixel_buffer_dev * pixel_buf_dev;
ship_t p1_ship;
ship_t p2_ship;

alt_u16 packets[512];

/*---------------------------------------------------------------------------------------------
 * (function: main)
 *-------------------------------------------------------------------------------------------*/
int main()
{
	/* Declare variable for received character. */
	FILE *LCD;
	alt_u32 output_packet_reg = 0;
	int partial_second_counter;
	int second_counter = 0;

	/* initialize the lcd */
	LCD = fopen(LCD_0_NAME, "w");

	/* Write some simple text to the LCD. */
	if (LCD != NULL )
	{
		fprintf(LCD, "\nThis is the LCD Display.\n");
		fprintf(LCD, "If you can see this, your LCD is functional.\n");
	}

	/* initialize the output packet to all 0s */
	output_packet_reg = 0;
	IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);

	/* open the Pixel Buffer port */
	pixel_buf_dev =  alt_up_pixel_buffer_open_dev ("/dev/pixel_buffer_0"); // needed to make sure the library was loaded through university program !!!
	if ( pixel_buf_dev == NULL)
		alt_printf ("Error: could not open pixel buffer device \n");
	else
		alt_printf ("Opened pixel buffer device \n");

	/* initialize the ships at opposite ends of the field of play */
	init_draw();
	init_ship(&p1_ship, 315, 22, 22, 0);
	init_ship(&p2_ship, 135, 298, 218, 1);

	/* Clear the screen */
	alt_up_pixel_buffer_clear_screen (pixel_buf_dev, 0);

	/* initialize the receive path */
	init_packet_interrupt_isr();

	game_loop(0, 0, 0);
	while (1)
	{
#if 0 // POLLING
		alt_u32 mask;
		volatile alt_u32 debug_reg;
		volatile alt_u32 input_packet_reg;

		/* read the port - polling */
		input_packet_reg = IORD_ALTERA_AVALON_PIO_DATA(INPUT_PACKET_BASE);
		debug_reg = IORD_ALTERA_AVALON_PIO_DATA(SWITCHES_BASE);
		mask = 1 << 31;

		//printf("Waiting for send: %x\n", input_packet_reg);
	       
		if ((input_packet_reg & mask) > 0)
		{

			/* IF - the read request signal is high */
			//printf("Reading Packets\n");

			get_player_info()
		}
#endif
		/* once all packets transmitted to nios display */

		fprintf(LCD, "p1 c: %x %x %x %x %x %x %x %x; e: %x l_r: %x;\ns dir: %x spe: %x; fire: %x pow: %x\n",
				p1_ship.cA_hookedup_to,	
				p1_ship.c2_hookedup_to,	
				p1_ship.c3_hookedup_to,	
				p1_ship.c4_hookedup_to,	
				p1_ship.c5_hookedup_to,	
				p1_ship.c6_hookedup_to,	
				p1_ship.c7_hookedup_to,	
				p1_ship.c8_hookedup_to,	
				p1_ship.engine,
				p1_ship.engine_left_right,
				p1_ship.sensor_state,
				p1_ship.sensor_move,
				p1_ship.cannon_fire,
				p1_ship.cannon_power);
	
		fprintf(LCD, "p2 c: %x %x %x %x %x %x %x %x; e: %x l_r: %x;\ns dir: %x spe: %x; fire: %x pow: %x\n",
				p2_ship.cA_hookedup_to,	
				p2_ship.c2_hookedup_to,	
				p2_ship.c3_hookedup_to,	
				p2_ship.c4_hookedup_to,	
				p2_ship.c5_hookedup_to,	
				p2_ship.c6_hookedup_to,	
				p2_ship.c7_hookedup_to,	
				p2_ship.c8_hookedup_to,	
				p2_ship.engine,
				p2_ship.engine_left_right,
				p2_ship.sensor_state,
				p2_ship.sensor_move,
				p2_ship.cannon_fire,
				p2_ship.cannon_power);
	
		usleep(ONE_SEC/UPDATES_PER_SECOND); // every half second

		if (isr_update == TRUE)
		{
			partial_second_counter = 0;
			game_loop(1, second_counter, 0);
			isr_update = FALSE;
		}
		else
		{
			partial_second_counter ++;
			game_loop(0, second_counter, partial_second_counter);
		}

		if (second_counter == 60)
		{
			second_counter = 0;
		}
		else
		{
			second_counter++;
		}
 	}

 	return( 0 );
}
