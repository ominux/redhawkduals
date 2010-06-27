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
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "system.h"

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_pixel_buffer.h"

#include "sys/alt_irq.h"
#include "sys/alt_stdio.h"

#include "globals.h"
#include "types.h"
#include "util.h"
#include "ethernet_isr.h"
#include "draw.h"
#include "game_loop.h"
#include "ship.h"
#include "io.h"

alt_up_pixel_buffer_dev * pixel_buf_dev;
ship_t p1_ship;
ship_t p2_ship;

alt_u16 packets[512];
short new_game;
alt_u32 output_packet_reg;
alt_u8 game_mode;

/*---------------------------------------------------------------------------------------------
 * (function: main)
 *-------------------------------------------------------------------------------------------*/
int main()
{
	/* Declare variable for received character. */
	FILE *LCD;
	alt_u32 output_packet_reg = 0;
	int partial_second_counter;
	int second_counter = 1;
	short game_status;
	volatile alt_u32 input_packet_reg;
	alt_u32 mask;
	short start_up_system = TRUE;
	short first_draw = TRUE;
	char game_start[9] = "new game";
	static string_t time;

	/* initialize time */
	time.string = (char*)malloc(sizeof(char)*(10));
	number_to_character_string(&time, 0);

	/* intialize the new game */
	new_game = TRUE;

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

	while (1)
	{
		/* once all packets transmitted to nios display */
		if (new_game == TRUE)
		{
			alt_u8 input_mode;

			mask = 1 << 27; // reserve input 28 for communicate game on

			/* tell the hardawre it's a new game */
			output_packet_reg = output_packet_reg | mask;
			IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);

			input_packet_reg = IORD_ALTERA_AVALON_PIO_DATA(INPUT_PACKET_BASE);
			while ((input_packet_reg & mask) == 0) // wait until it's = 1
			{
				output_packet_reg = output_packet_reg | mask;
				IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);
				input_packet_reg = IORD_ALTERA_AVALON_PIO_DATA(INPUT_PACKET_BASE);

				fprintf(LCD, "Start game with switch 2 - High to Low\n");
			}

			/* mode for the game */
			/* if 24 is high == 1 then crystal structure ignored */
			input_mode = (input_packet_reg >> 24) & 0x07;
			if (input_mode == 1)
			{
				game_mode = POWER_SIMPLE;
			}
			else
			{
				game_mode = BASIC;
			}

			/* Clear the screen */
			alt_up_pixel_buffer_clear_screen (pixel_buf_dev, 0);

			/* disable while we set up the new game */
			disable_packet_interrupt();
			isr_update = FALSE;

			/* go into the game loop */
			new_game = FALSE;
		
			/* reinitialize ships */
			re_init_ship(&p1_ship, 315, 22, 22, 0);
			re_init_ship(&p2_ship, 135, 298, 218, 1);

			/* tell the hardawre it's a new game */
			output_packet_reg = 0;
			IOWR_ALTERA_AVALON_PIO_DATA(OUTPUT_PACKET_BASE, output_packet_reg);

			/* initialize the receive path */
			init_packet_interrupt_isr();
		}
		else if (new_game == FALSE)
		{
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
	
			if (start_up_system == TRUE)
			{
				game_status = LIVE;

				draw_string(pixel_buf_dev, 0xFFFF, 0, 100, 100, game_start, 8);

				/* wait for a message so we can start */
				if (isr_update == TRUE)
				{
					isr_update = FALSE;
					start_up_system = FALSE;
					/* clean message */
					draw_string(pixel_buf_dev, 0x0000, 0, 100, 100, game_start, 8);
				}
			}
			else
			{
				if (isr_update == TRUE)
				{

					/* time keeping and drawing of seconds */
					draw_string(pixel_buf_dev, 0x0000, 0, 150, 3, time.string, time.size);
					second_counter++;
					number_to_character_string(&time, second_counter);
					draw_string(pixel_buf_dev, 0xFFFF, 0, 150, 3, time.string, time.size);

					partial_second_counter = 0;
					isr_update = FALSE;
					if (second_counter == 60)
					{
						game_status = game_loop(1, 0, 0, first_draw);
						second_counter = 1;
					}
					else
					{
						game_status = game_loop(1, second_counter, 0, first_draw);
					}

				}
				else
				{
					partial_second_counter ++;
					game_status = game_loop(0, second_counter, partial_second_counter, first_draw);
				}

				if (first_draw == TRUE)
				{
					first_draw = FALSE;
				}
			}

			if (game_status != LIVE)
			{
				/* END of game */
				char game_over[10] = "game over";
				char player1[8] = "p1 wins";
				char player2[8] = "p2 wins";
				char tie[4] = "tie";
				
				draw_string(pixel_buf_dev, 0xFFFF, 0, 100, 100, game_over, 9);
				if (game_status == P1)
				{
					draw_string(pixel_buf_dev, 0xFFFF, 0, 100, 106, player1, 7);
				}
				else if (game_status == P2)
				{
					draw_string(pixel_buf_dev, 0xFFFF, 0, 100, 106, player2, 7);
				}
				else if (game_status == TIE)
				{
					draw_string(pixel_buf_dev, 0xFFFF, 0, 100, 106, tie, 3);
				}

				new_game = TRUE;
				second_counter = 1;
				start_up_system = TRUE;
				first_draw = TRUE;
			}
		}
 	}

 	return( 0 );
}
