#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <io.h>
#include <math.h>

#include "types.h"
#include "globals.h"
#include "collision_detection.h"
#include "ethernet_isr.h"
#include "draw.h"
#include "ship.h"

ship_t *get_opponent_ship(ship_t *ship);

/*---------------------------------------------------------------------------------------------
 * (function: game_loop)
 *-------------------------------------------------------------------------------------------*/
void game_loop(int data_update, int second, int partial_second)
{
	int i;
	ship_t *ship;
	vector_t new_velocity;
	short hit;
	int x; 
	int y; 
	int angle;

	/* check for energy stall and power levels */
	if (second == 0)
	{
		/* new minute */
		p1_ship.power_budget_this_minute = power_calculation(&p1_ship) - BASIC_POWER_COST; 
		if (p1_ship.power_budget_this_minute > 0)
		{
			p1_ship.stalled = FALSE;
		}
		else
		{
			p1_ship.stalled = TRUE;
		}

		p2_ship.power_budget_this_minute = power_calculation(&p2_ship) - BASIC_POWER_COST;
		if (p2_ship.power_budget_this_minute > 0)
		{
			p2_ship.stalled = FALSE;
		}
		else
		{
			p2_ship.stalled = TRUE;
		}
	}
	
	if (partial_second == 0)
	{
		/* new second */
		for (i = 0; i < 2; i++)
		{
			if (i == 0)
				ship = &p1_ship;
			else
				ship = &p2_ship;

			/* only allow shots approximately every 5 seconds */
			if (ship->shot_fired_x_seconds_ago == 6)
			{
				ship->shot_fired_x_seconds_ago = 0;
				/* make the last shot disappear */
				clean_shot(ship, pixel_buf_dev, 0);
			}
			else if (ship->shot_fired_x_seconds_ago != 0)
			{
				ship->shot_fired_x_seconds_ago ++;
			}
		}
	}

	for (i = 0; i < 2; i++)
	{
		if (i == 0)
			ship = &p1_ship;
		else
			ship = &p2_ship;

		new_velocity.x = 0;
		new_velocity.y = 0;

		/* copy the temp matrix so we can figure out where you're going to be */
		copy_matrix(ship->matrix_start, ship->row, ship->column, ship->temp_matrix);

		if (data_update == 1 && ship->stalled == FALSE)
		{
			/* calculate player ones potential movement */
			/* check versus walls */
			if (ship->engine_left_right == 1)
			{
				/* turning left */
				ship->angle = (ship->angle - TURN_RATE) % 360;
			}
			else if (ship->engine_left_right == 2)
			{
				/* turning right */
				ship->angle = (ship->angle + TURN_RATE) % 360;
			}
		
			if (ship->engine > 0)
			{
				/* trying to accelerate */
				float scalar;
				
				/* calculate the acceleration costs */
				ship->power_budget_this_minute -= ENGINE_POWER_COST;
		
				/* ship direction relative to our coordinate system */
				new_velocity.x = ship->velocity->x + cos((ship->angle-270)*PI/180);
				new_velocity.y = ship->velocity->y + sin((ship->angle-270)*PI/180);
		
				/* scalar to find speed */
				scalar = sqrt(new_velocity.x*new_velocity.x + ship->velocity->y*ship->velocity->y);
		
				/* if too fast then scale back to max velocity */
				if (scalar > MAX_SPEED)
				{
					new_velocity.x = new_velocity.x/scalar * MAX_SPEED;
					new_velocity.y = new_velocity.y/scalar * MAX_SPEED;
				}

				ship->velocity->x = new_velocity.x;
				ship->velocity->y = new_velocity.y;
			}
		}
	
		/* now check if this speed would result in a wall hit */
		ship->x = ship->x + ship->velocity->x/UPDATES_PER_SECOND;
		ship->y = ship->y + ship->velocity->y/UPDATES_PER_SECOND;
		/* update ship */
		rotate_a_matrix(ship->temp_matrix, ship->row, ship->column, ship->angle);
		translate_a_matrix(ship->temp_matrix, ship->row, ship->column, roundf(ship->x), roundf(ship->y));

		hit = check_wall_collide_ns(ship->temp_matrix, 4);
		if (hit == WALL_N || hit == WALL_S)
		{
			ship->reset = TRUE;
		}
	
		hit = check_wall_collide_ew(ship->temp_matrix, 4);
		if (hit == WALL_E || hit == WALL_W)
		{
			ship->reset = TRUE;
		}
	}

	/* check collision of players - done on temp_matrix */
	if (check_ships_collide(&p1_ship, &p2_ship) == SHIP)
	{
		p1_ship.reset = TRUE;
		p2_ship.reset = TRUE;
	}

	/* check what we see */
	/* check shot fired */
	for (i = 0; i < 2; i++)
	{
		if (i == 0)
			ship = &p1_ship;
		else
			ship = &p2_ship;

		if (ship->reset == TRUE)
			continue;

		/* animante sensor beam */
		clean_sensor(ship, pixel_buf_dev, 0);

		if (data_update == 1 && ship->stalled == FALSE)
		{
			if (ship->sensor_state == 1)
			{
				/* turning left */
				ship->sensor_angle = (ship->sensor_angle - (((float)ship->sensor_move)/2));
				if (ship->sensor_angle > 360)
				{
					ship->sensor_angle = ship->sensor_angle - 360;
				}
			}
			else if (ship->sensor_state == 2)
			{
				/* turning right */
				ship->sensor_angle = (ship->sensor_angle + (((float)ship->sensor_move)/2));
				if (ship->sensor_angle < 0)
				{
					ship->sensor_angle = ship->sensor_angle + 360;
				}
			}

			/* project in that direction what's there */
			ship->sensor_detected_something = straight_line_vector_projection(ship, ship->angle+roundf(ship->sensor_angle), ship->x, ship->y, FALSE);

			/* Firing */
			if (ship->cannon_fire > 0 && ship->shot_fired_x_seconds_ago == 0)
			{
				/* shot fired */	
				ship->shot_fired_x_seconds_ago = 1;
				/* calculate the power cost */
				ship->power_budget_this_minute -= ship->cannon_power;

				if (ship->power_budget_this_minute < 0)
				{
					/* overused power budget for the minute...stall */
					ship->stalled = TRUE;
				}
				else
				{
					if (straight_line_vector_projection(ship, ship->angle, ship->x, ship->y, TRUE) == SHIP)
					{
						/* causes damage to the opponent */
						degrade_crystals_based_on_shot(get_opponent_ship(ship), ship->cannon_power);
					}
				}
			}
		}

		/* draw shot */
		if (ship->shot_fired_x_seconds_ago != 0)
		{
			draw_shot(ship, pixel_buf_dev, 0, ship->shot_fired_x_seconds_ago);
		}
		/* draw the sensor lines */
		draw_sensor(ship, pixel_buf_dev, 0);
	}

	for (i = 0; i < 2; i++)
	{
		if (i == 0)
		{
			ship = &p1_ship;
			x = 22;
			y = 22;
			angle = 315;
		}
		else
		{
			x = 298;
			y = 218;
			angle = 135;
			ship = &p2_ship;
		}

		/* update values to be sent to ship at address gaps of 64 addresses */
		update_packets_to_send_back(ship, i * 64);

		/* animate the ship */
		clean_ship(ship, pixel_buf_dev, 0);

		/* copy the temp matrix over */
		if (ship->reset == FALSE)
		{
			copy_matrix(ship->temp_matrix, ship->row, ship->column, ship->matrix_location);
		}
		else
		{
			reset_ship(ship, angle, x, y);
		}
	}

	/* update drawings */
	draw_ship(&p2_ship, pixel_buf_dev, 0);
	draw_ship(&p1_ship, pixel_buf_dev, 0);
}

/*---------------------------------------------------------------------------------------------
 * (function: get_opponent_ship)
 *---------------------------------------------------------------------------------------------*/
ship_t *get_opponent_ship(ship_t *ship)
{
	if (ship == &p1_ship)
		return &p2_ship;
	else
		return &p1_ship;
}

