#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <io.h>
#include <math.h>

#include "draw.h"
#include "types.h"

#define SHIP_SIZE 10
/* 4 for rectangle, 2 for cannon direction */
#define SHIP_ROW_POINTS 6

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

	ship->reset = FALSE;
	ship->velocity = (vector_t*)malloc(sizeof(vector_t)*2);
	ship->velocity->x = 0;
	ship->velocity->y = 0;
	ship->axis = (vector_t*)malloc(sizeof(vector_t)*2);

	/* initialize colors for player ships */
	if (player_number == 0)
	{
		ship->color[0] = 0xFFFF;
		ship->color[1] = 0xFF00; // gun direction
	}
	else
	{
		ship->color[0] = 0x00FF;
		ship->color[1] = 0xFF00; // gun direction
	}

	ship->row = 3;
	ship->column = SHIP_ROW_POINTS;
	ship->matrix_rotated_at_origin = (float**)malloc(sizeof(float*)*SHIP_ROW_POINTS);
	ship->matrix_location = (float**)malloc(sizeof(float*)*SHIP_ROW_POINTS);
	ship->temp_matrix = (float**)malloc(sizeof(float*)*SHIP_ROW_POINTS);

	for (i = 0; i < SHIP_ROW_POINTS; i++)
	{
		ship->matrix_rotated_at_origin[i] = (float*)calloc(sizeof(float),3);
		ship->temp_matrix[i] = (float*)calloc(sizeof(float),3);
		ship->matrix_location[i] = (float*)calloc(sizeof(float),3);

		ship->matrix_rotated_at_origin[i][2] = 1.0
	}

	/* draw the box centered arround the origin */
	ship->matrix_rotated_at_origin[0][0] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[0][1] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[1][0] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[1][1] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[2][0] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[2][1] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[3][0] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[3][1] = -(SHIP_SIZE/2);
	/* draw the line representing the laser */
	ship->matrix_rotated_at_origin[4][0] = 0;
	ship->matrix_rotated_at_origin[4][1] = 0;
	ship->matrix_rotated_at_origin[5][0] = 0;
	ship->matrix_rotated_at_origin[5][1] = (SHIP_SIZE/2);

	/* the location, now and then */
	/* rotate the ship to the start angle */
	rotate_a_matrix(ship->matrix_rotated_at_origin, ship->row, ship->column, start_angle);

	/* copy this into the moved version */
	copy_matrix(ship->matrix_rotated_at_origin, ship->row, ship->column, ship->matrix_location);
	/* do translation on the location */
	translate_a_matrix(ship->matrix_location, ship->row, ship->column, start_x, start_y);
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

	/* draw the box centered arround the origin */
	ship->matrix_rotated_at_origin[0][0] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[0][1] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[1][0] = -(SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[1][1] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[2][0] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[2][1] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[3][0] = (SHIP_SIZE/2);
	ship->matrix_rotated_at_origin[3][1] = -(SHIP_SIZE/2);
	/* draw the line representing the laser */
	ship->matrix_rotated_at_origin[4][0] = 0;
	ship->matrix_rotated_at_origin[4][1] = 0;
	ship->matrix_rotated_at_origin[5][0] = 0;
	ship->matrix_rotated_at_origin[5][1] = (SHIP_SIZE/2);

	/* rotate the ship to the start angle */
	rotate_a_matrix(ship->matrix_rotated_at_origin, ship->row, ship->column, start_angle);

	/* copy this into the moved version */
	copy_matrix(ship->matrix_rotated_at_origin, ship->row, ship->column, ship->matrix_location);
	/* do translation on the location */
	translate_a_matrix(ship->matrix_location, ship->row, ship->column, start_x, start_y);
}
