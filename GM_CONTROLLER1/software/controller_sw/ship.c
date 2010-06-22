#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <io.h>
#include <math.h>

#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_pixel_buffer.h"

#include <priv/alt_file.h>
#include <stddef.h>
#include <sys/alt_dev.h>

#include "sys/alt_irq.h"
#include "sys/alt_stdio.h"
#include "globals.h"
#include "types.h"
#include "util.h"
#include "draw.h"


#define SHIP_SIZE 10
/* 4 for rectangle, 2 for cannon direction */
#define SHIP_COLUMN_POINTS 6

alt_u8 lookup_power_link(ship_t *ship, short idx1, short idx2);
void set_power_link(ship_t *ship, short idx1, short idx2, int val);
void initialize_power_crystals(ship_t *ship);

/*---------------------------------------------------------------------------------------------
 * (function: init_ship)
 *	SHIP is a rectangle held in a matrix...the 0th row holds x coord and the 1st row holds y coord
 *-------------------------------------------------------------------------------------------*/
void init_ship(ship_t *ship, int start_angle, int start_x, int start_y, int player_number)
{
	int i;

	ship->player_number = player_number;
	ship->angle = start_angle;
	ship->x = start_x;
	ship->y = start_y;
	ship->sensor_angle = 0;

	ship->reset = FALSE;
	ship->stalled = FALSE;
	ship->velocity = (vector_t*)malloc(sizeof(vector_t)*2);
	ship->velocity->x = 0;
	ship->velocity->y = 0;
	ship->axis = (vector_t*)malloc(sizeof(vector_t)*2);

	/* allocate string containers */
	ship->power_budget_string = (string_t *)malloc(sizeof(string_t));
	ship->power_budget_string->string = (char*)malloc(sizeof(char)*(10+1));
	number_to_character_string(ship->power_budget_string, 0);

	/* initialize colors for player ships */
	if (player_number == 0)
	{
		ship->color[0] = 0xFC3F;
		ship->color[1] = 0xFF00; // gun color
	}
	else
	{
		ship->color[0] = 0x00FF;
		ship->color[1] = 0xFF00; // gun color
	}

	ship->row = 3;
	ship->column = SHIP_COLUMN_POINTS;
	ship->matrix_start = (float**)malloc(sizeof(float*)*SHIP_COLUMN_POINTS);
	ship->matrix_location = (float**)malloc(sizeof(float*)*SHIP_COLUMN_POINTS);
	ship->temp_matrix = (float**)malloc(sizeof(float*)*SHIP_COLUMN_POINTS);

	for (i = 0; i < SHIP_COLUMN_POINTS; i++)
	{
		ship->matrix_start[i] = (float*)calloc(sizeof(float),3);
		/* init to 1 for the transformations */
		ship->matrix_start[i][2] = 1.0;

		ship->temp_matrix[i] = (float*)calloc(sizeof(float),3);
		ship->matrix_location[i] = (float*)calloc(sizeof(float),3);
	}

	/* draw the box centered arround the origin */
	ship->matrix_start[0][0] = -(SHIP_SIZE/2);
	ship->matrix_start[0][1] = -(SHIP_SIZE/2);
	ship->matrix_start[1][0] = -(SHIP_SIZE/2);
	ship->matrix_start[1][1] = (SHIP_SIZE/2);
	ship->matrix_start[2][0] = (SHIP_SIZE/2);
	ship->matrix_start[2][1] = (SHIP_SIZE/2);
	ship->matrix_start[3][0] = (SHIP_SIZE/2);
	ship->matrix_start[3][1] = -(SHIP_SIZE/2);
	/* draw the line representing the laser */
	ship->matrix_start[4][0] = 0;
	ship->matrix_start[4][1] = 0;
	ship->matrix_start[5][0] = 0;
	ship->matrix_start[5][1] = (SHIP_SIZE/2);

	/* make a copy */
	copy_matrix(ship->matrix_start, ship->row, ship->column, ship->temp_matrix);
	/* the location, now and then */
	/* rotate the ship to the start angle */
	rotate_a_matrix(ship->temp_matrix, ship->row, ship->column, start_angle);

	/* copy this into the moved version */
	copy_matrix(ship->temp_matrix, ship->row, ship->column, ship->matrix_location);
	/* do translation on the location */
	translate_a_matrix(ship->matrix_location, ship->row, ship->column, start_x, start_y);

	ship->shot_fired_x_seconds_ago = 0;
}

/*---------------------------------------------------------------------------------------------
 * (function: reset_ship)
 *-------------------------------------------------------------------------------------------*/
void reset_ship(ship_t *ship, int start_angle, int start_x, int start_y)
{
	ship->angle = start_angle;
	ship->x = start_x;
	ship->y = start_y;

	ship->reset = FALSE;
	ship->velocity->x = 0;
	ship->velocity->y = 0;
	ship->sensor_angle = 0;

	/* make a copy */
	copy_matrix(ship->matrix_start, ship->row, ship->column, ship->temp_matrix);
	/* the location, now and then */
	/* rotate the ship to the start angle */
	rotate_a_matrix(ship->temp_matrix, ship->row, ship->column, start_angle);

	/* copy this into the moved version */
	copy_matrix(ship->temp_matrix, ship->row, ship->column, ship->matrix_location);
	/* do translation on the location */
	translate_a_matrix(ship->matrix_location, ship->row, ship->column, start_x, start_y);
}

/*---------------------------------------------------------------------------------------------
 * (function: init_ship)
 *-------------------------------------------------------------------------------------------*/
void re_init_ship(ship_t *ship, int start_angle, int start_x, int start_y, int player_number)
{
	ship->player_number = player_number;
	ship->angle = start_angle;
	ship->x = start_x;
	ship->y = start_y;
	ship->sensor_angle = 0;

	ship->reset = FALSE;
	ship->stalled = TRUE;
	ship->stalled_for_minutes = 0; 
	ship->velocity->x = 0;
	ship->velocity->y = 0;
	ship->power_budget_this_minute = 0;
	ship->power_budget_this_minute_old = -1;
	number_to_character_string(ship->power_budget_string, 0);

	/* reset sensors */
	ship->shot_start.x = start_x;
	ship->shot_start.y = start_y;
	ship->shot_end.x = start_x;
	ship->shot_end.y = start_y;
	ship->sensor_start.x = start_x;
	ship->sensor_start.y = start_y;
	ship->sensor_end.x = start_x;
	ship->sensor_end.y = start_y;

	/* make a copy */
	copy_matrix(ship->matrix_start, ship->row, ship->column, ship->temp_matrix);
	/* the location, now and then */
	/* rotate the ship to the start angle */
	rotate_a_matrix(ship->temp_matrix, ship->row, ship->column, start_angle);

	/* copy this into the moved version */
	copy_matrix(ship->temp_matrix, ship->row, ship->column, ship->matrix_location);
	/* do translation on the location */
	translate_a_matrix(ship->matrix_location, ship->row, ship->column, start_x, start_y);

	/* initialize the power crystal amplification */
	initialize_power_crystals(ship);

	/* redo the shot */
	ship->shot_fired_x_seconds_ago = 0;
}

#define A 0
#define B 1
#define C 2
#define D 3
#define E 4
#define F 5
#define G 6
#define H 7

/*---------------------------------------------------------------------------------------------
 * (function: degrade_crystals_based_on_shot)
 *	can make some of the links negative
 *-------------------------------------------------------------------------------------------*/
void degrade_crystals_based_on_shot(ship_t *ship, int amount)
{
	int i;
	int idx1;
	int idx2;
	int val;

	for (i = 0; i < amount; i++)
	{
		idx1 = rand() % 8;
		idx2 = rand() % 8;
		if (idx1 == idx2)
		{
			idx2 = idx2 + 1 % 8;
		}

		val = lookup_power_link(ship, idx1, idx2) - 1;
		set_power_link(ship, idx1, idx2, val);
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: initialize_power_crystals)
 *-------------------------------------------------------------------------------------------*/
void initialize_power_crystals(ship_t *ship)
{
	if (game_mode == BASIC)
	{
		ship->A_B_val = rand() % 8 + 3;
		ship->A_C_val = rand() % 8 + 3;
		ship->A_D_val = rand() % 8 + 3;
		ship->A_E_val = rand() % 8 + 3;
		ship->A_F_val = rand() % 8 + 3;
		ship->A_G_val = rand() % 8 + 3;
		ship->A_H_val = rand() % 8 + 3;
		ship->B_C_val = rand() % 8 + 3;
		ship->B_D_val = rand() % 8 + 3;
		ship->B_E_val = rand() % 8 + 3;
		ship->B_F_val = rand() % 8 + 3;
		ship->B_G_val = rand() % 8 + 3;
		ship->B_H_val = rand() % 8 + 3;
		ship->C_D_val = rand() % 8 + 3;
		ship->C_E_val = rand() % 8 + 3;
		ship->C_F_val = rand() % 8 + 3;
		ship->C_G_val = rand() % 8 + 3;
		ship->C_H_val = rand() % 8 + 3;
		ship->D_E_val = rand() % 8 + 3;
		ship->D_F_val = rand() % 8 + 3;
		ship->D_G_val = rand() % 8 + 3;
		ship->D_H_val = rand() % 8 + 3;
		ship->E_F_val = rand() % 8 + 3;
		ship->E_G_val = rand() % 8 + 3;
		ship->E_H_val = rand() % 8 + 3;
		ship->F_G_val = rand() % 8 + 3;
		ship->F_H_val = rand() % 8 + 3;
		ship->G_H_val = rand() % 8 + 3;
	}
	else
	{
		ship->A_B_val = 8;
		ship->A_C_val = 8;
		ship->A_D_val = 8;
		ship->A_E_val = 8;
		ship->A_F_val = 8;
		ship->A_G_val = 8;
		ship->A_H_val = 8;
		ship->B_C_val = 8;
		ship->B_D_val = 8;
		ship->B_E_val = 8;
		ship->B_F_val = 8;
		ship->B_G_val = 8;
		ship->B_H_val = 8;
		ship->C_D_val = 8;
		ship->C_E_val = 8;
		ship->C_F_val = 8;
		ship->C_G_val = 8;
		ship->C_H_val = 8;
		ship->D_E_val = 8;
		ship->D_F_val = 8;
		ship->D_G_val = 8;
		ship->D_H_val = 8;
		ship->E_F_val = 8;
		ship->E_G_val = 8;
		ship->E_H_val = 8;
		ship->F_G_val = 8;
		ship->F_H_val = 8;
		ship->G_H_val = 8;

	}
}

/*---------------------------------------------------------------------------------------------
 * (function: power_calculation)
 *-------------------------------------------------------------------------------------------*/
int power_calculation(ship_t *ship)
{
	int power_budget = BASIC_POWER_COST;
	int current_power;
	/* bitmask to check if the crystal is already hooked up */
	alt_u8 used = 0x00;
	
	if (game_mode == POWER_SIMPLE)
	{
		/* assumes A to B to C ... H to A */
		current_power = lookup_power_link(ship, A, 1);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 1, 2);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 3, 4);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 4, 5);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 5, 6);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 6, 7);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, 7, 0);
		if (current_power == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		return power_budget;
	}
	else
	{
		/* hookup of crystals sent by user */
		current_power = lookup_power_link(ship, A, ship->c2_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c2_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c2_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c2_hookedup_to, ship->c3_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c3_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c3_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c3_hookedup_to, ship->c4_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c4_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c4_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c4_hookedup_to, ship->c5_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c5_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c5_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c5_hookedup_to, ship->c6_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c6_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c6_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c6_hookedup_to, ship->c7_hookedup_to);
		if (current_power == 0 || (used & (1 << ship->c7_hookedup_to)) >= 1)
		{
			return 0;
		}
		used = used | (1 << ship->c7_hookedup_to);
		power_budget += current_power;
	
		current_power = lookup_power_link(ship, ship->c7_hookedup_to, ship->c8_hookedup_to);
		/* the last spot needs to go to A */
		if (current_power == 0 && ship->c8_hookedup_to == 0)
		{
			return 0;
		}
		power_budget += current_power;
	
		return power_budget;
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: lookup_power_link)
 *-------------------------------------------------------------------------------------------*/
alt_u8 lookup_power_link(ship_t *ship, short idx1, short idx2)
{
	switch (idx1) 
	{
		case A:
			switch (idx2)
			{
				case B:
					return ship->A_B_val;
				case C:
					return ship->A_C_val;
				case D:
					return ship->A_D_val;
				case E:
					return ship->A_E_val;
				case F:
					return ship->A_F_val;
				case G:
					return ship->A_G_val;
				case H:
					return ship->A_H_val;
				default:
					return -1;
			}
		case B:
			switch (idx2)
			{
				case A:
					return ship->A_B_val;
				case C:
					return ship->B_C_val;
				case D:
					return ship->B_D_val;
				case E:
					return ship->B_E_val;
				case F:
					return ship->B_F_val;
				case G:
					return ship->B_G_val;
				case H:
					return ship->B_H_val;
				default:
					return -1;
			}
		case C:
			switch (idx2)
			{
				case A:
					return ship->A_C_val;
				case B:
					return ship->B_C_val;
				case D:
					return ship->C_D_val;
				case E:
					return ship->C_E_val;
				case F:
					return ship->C_F_val;
				case G:
					return ship->C_G_val;
				case H:
					return ship->C_H_val;
				default:
					return -1;
			}
		case D:
			switch (idx2)
			{
				case A:
					return ship->A_D_val;
				case B:
					return ship->B_D_val;
				case C:
					return ship->C_D_val;
				case E:
					return ship->D_E_val;
				case F:
					return ship->D_F_val;
				case G:
					return ship->D_G_val;
				case H:
					return ship->D_H_val;
				default:
					return -1;
			}
		case E:
			switch (idx2)
			{
				case A:
					return ship->A_E_val;
				case B:
					return ship->B_E_val;
				case C:
					return ship->C_E_val;
				case D:
					return ship->D_E_val;
				case F:
					return ship->E_F_val;
				case G:
					return ship->E_G_val;
				case H:
					return ship->E_H_val;
				default:
					return -1;
			}
		case F:
			switch (idx2)
			{
				case A:
					return ship->A_F_val;
				case B:
					return ship->B_F_val;
				case C:
					return ship->C_F_val;
				case D:
					return ship->D_F_val;
				case E:
					return ship->E_F_val;
				case G:
					return ship->F_G_val;
				case H:
					return ship->F_H_val;
				default:
					return -1;
			}
		case G:
			switch (idx2)
			{
				case A:
					return ship->A_G_val;
				case B:
					return ship->B_G_val;
				case C:
					return ship->C_G_val;
				case D:
					return ship->D_G_val;
				case E:
					return ship->E_G_val;
				case F:
					return ship->F_G_val;
				case H:
					return ship->G_H_val;
				default:
					return -1;
			}
		case H:
			switch (idx2)
			{
				case A:
					return ship->A_H_val;
				case B:
					return ship->B_H_val;
				case C:
					return ship->C_H_val;
				case D:
					return ship->D_H_val;
				case E:
					return ship->E_H_val;
				case F:
					return ship->F_H_val;
				case G:
					return ship->G_H_val;
				default:
					return -1;
			}
		default:
			return -1;
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: set_power_link)
 *-------------------------------------------------------------------------------------------*/
void set_power_link(ship_t *ship, short idx1, short idx2, int val)
{
	if (val < 0)
	{
		val = 0;
	}

	switch (idx1) 
	{
		case A:
			switch (idx2)
			{
				case B:
					ship->A_B_val = val;
					return;
				case C:
					ship->A_C_val = val;
					return;
				case D:
					ship->A_D_val = val;
					return;
				case E:
					ship->A_E_val = val;
					return;
				case F:
					ship->A_F_val = val;
					return;
				case G:
					ship->A_G_val = val;
					return;
				case H:
					ship->A_H_val = val;
					return;
				default:
			 		return;
			}
		case B:
			switch (idx2)
			{
				case A:
					ship->A_B_val = val;
					return;
				case C:
					ship->B_C_val = val;
					return;
				case D:
					ship->B_D_val = val;
					return;
				case E:
					ship->B_E_val = val;
					return;
				case F:
					ship->B_F_val = val;
					return;
				case G:
					ship->B_G_val = val;
					return;
				case H:
					ship->B_H_val = val;
					return;
				default:
			 		return;
			}
		case C:
			switch (idx2)
			{
				case A:
					ship->A_C_val = val;
					return;
				case B:
					ship->B_C_val = val;
					return;
				case D:
					ship->C_D_val = val;
					return;
				case E:
					ship->C_E_val = val;
					return;
				case F:
					ship->C_F_val = val;
					return;
				case G:
					ship->C_G_val = val;
					return;
				case H:
					ship->C_H_val = val;
					return;
				default:
			 		return;
			}
		case D:
			switch (idx2)
			{
				case A:
					ship->A_D_val = val;
					return;
				case B:
					ship->B_D_val = val;
					return;
				case C:
					ship->C_D_val = val;
					return;
				case E:
					ship->D_E_val = val;
					return;
				case F:
					ship->D_F_val = val;
					return;
				case G:
					ship->D_G_val = val;
					return;
				case H:
					ship->D_H_val = val;
					return;
				default:
			 		return;
			}
		case E:
			switch (idx2)
			{
				case A:
					ship->A_E_val = val;
					return;
				case B:
					ship->B_E_val = val;
					return;
				case C:
					ship->C_E_val = val;
					return;
				case D:
					ship->D_E_val = val;
					return;
				case F:
					ship->E_F_val = val;
					return;
				case G:
					ship->E_G_val = val;
					return;
				case H:
					ship->E_H_val = val;
					return;
				default:
					return;
			}
		case F:
			switch (idx2)
			{
				case A:
					ship->A_F_val = val;
					return;
				case B:
					ship->B_F_val = val;
					return;
				case C:
					ship->C_F_val = val;
					return;
				case D:
					ship->D_F_val = val;
					return;
				case E:
					ship->E_F_val = val;
					return;
				case G:
					ship->F_G_val = val;
					return;
				case H:
					ship->F_H_val = val;
					return;
				default:
			 		return;
			}
		case G:
			switch (idx2)
			{
				case A:
					ship->A_G_val = val;
					return;
				case B:
					ship->B_G_val = val;
					return;
				case C:
					ship->C_G_val = val;
					return;
				case D:
					ship->D_G_val = val;
					return;
				case E:
					ship->E_G_val = val;
					return;
				case F:
					ship->F_G_val = val;
					return;
				case H:
					ship->G_H_val = val;
					return;
				default:
			 		return;
			}
		case H:
			switch (idx2)
			{
				case A:
					ship->A_H_val = val;
					return;
				case B:
					ship->B_H_val = val;
					return;
				case C:
					ship->C_H_val = val;
					return;
				case D:
					ship->D_H_val = val;
					return;
				case E:
					ship->E_H_val = val;
					return;
				case F:
					ship->F_H_val = val;
					return;
				case G:
					ship->G_H_val = val;
					return;
				default:
					return;
			}
		default:
			return ;
	}
}
