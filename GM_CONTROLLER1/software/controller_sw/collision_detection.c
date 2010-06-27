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
#include <io.h>
#include <math.h>

#include "types.h"
#include "globals.h"
#include "collision_detection.h"
#include "draw.h"

#define NORTH_WALL 8
#define SOUTH_WALL 232
#define WEST_WALL 8
#define EAST_WALL 312

short ships_seperating_axis_theorem_collision_detect(ship_t *ship1, ship_t *ship2);
void calculate_axis_of_ship(ship_t *ship, int axis_idx);
short is_ccw_abc(float a_x, float a_y, float b_x, float b_y, float c_x, float c_y);

/*---------------------------------------------------------------------------------------------
 * (function: check_wall_collide)
 *-------------------------------------------------------------------------------------------*/
short check_wall_collide_ns(float **matrix, int points_to_check)
{
	int i;

	/* check if any of the points are hitting the boundary */
	for (i = 0; i < points_to_check; i++)
	{
		if (matrix[i][Y] <= NORTH_WALL) 
			return WALL_N;
		if (matrix[i][Y] >= SOUTH_WALL) 
			return WALL_S;
	}
	return NO_COLLISION;
}

/*---------------------------------------------------------------------------------------------
 * (function: check_wall_collide_ew)
 *-------------------------------------------------------------------------------------------*/
short check_wall_collide_ew(float **matrix, int points_to_check)
{
	int i;

	/* check if any of the points are hitting the boundary */
	for (i = 0; i < points_to_check; i++)
	{
		if (matrix[i][X] <= WEST_WALL) 
			return WALL_W;
		if (matrix[i][X] >= EAST_WALL) 
			return WALL_E;
	}
	return NO_COLLISION;
}

/*---------------------------------------------------------------------------------------------
 * (function: check_ships_collide)
 *   Currently calculated based on temp_matrix, so make sure updated before call
 *-------------------------------------------------------------------------------------------*/
short check_ships_collide(ship_t *ship1, ship_t *ship2)
{
	if (ships_seperating_axis_theorem_collision_detect(ship1, ship2) == TRUE)	
	{
		/* If 2 ships are colliding, deal with it */
		return SHIP;
	}
	
	return NO_COLLISION;
}

/*---------------------------------------------------------------------------------------------
 * (function: ships_seperating_axis_theorem_collision_detect)
 *-------------------------------------------------------------------------------------------*/
short ships_seperating_axis_theorem_collision_detect(ship_t *ship1, ship_t *ship2)
{
	int i, j;
	vector_t normal;
	vector_t ship1_projections[4];
	vector_t ship1_max_projections;
	vector_t ship1_min_projections;
	vector_t ship2_projections[4];
	vector_t ship2_max_projections;
	vector_t ship2_min_projections;

	/* go through two axis for ship 1 */
	for (i = 0; i < 2; i++)
	{
		/* calculate the axis */
		calculate_axis_of_ship(ship1, i);
		/* find normal of the first axis */
		normal.x = -(ship1->axis[i].y);
		normal.y = ship1->axis[i].x;

		/* project all the points in both ships to the normal */
		for (j = 0; j < 4; j++)
		{
			/* calculate the dot product */
			float dp;
			float project_part;
			dp = ship1->temp_matrix[j][X]*normal.x + ship1->temp_matrix[j][Y]*normal.y;
			project_part = dp/(normal.x*normal.x + normal.y*normal.y);

			ship1_projections[j].x = project_part * normal.x;
			ship1_projections[j].y = project_part * normal.y;

			/* calculate the min and max */
			if (j == 0)
			{
				ship1_max_projections.x = ship1_projections[j].x;
				ship1_max_projections.y = ship1_projections[j].y;
			}
			else if (ship1_projections[j].x > ship1_max_projections.x)
			{
				ship1_max_projections.x = ship1_projections[j].x;
				ship1_max_projections.y = ship1_projections[j].y;
			}
			if (j == 0)
			{
				ship1_min_projections.x = ship1_projections[j].x;
				ship1_min_projections.y = ship1_projections[j].y;
			}
			else if (ship1_projections[j].x < ship1_min_projections.x)
			{
				ship1_min_projections.x = ship1_projections[j].x;
				ship1_min_projections.y = ship1_projections[j].y;
			}
		}
		for (j = 0; j < 4; j++)
		{
			/* calculate the dot product */
			float dp;
			float project_part;
			dp = ship2->temp_matrix[j][X]*normal.x + ship2->temp_matrix[j][Y]*normal.y;
			project_part = dp/(normal.x*normal.x + normal.y*normal.y);

			ship2_projections[j].x = project_part * normal.x;
			ship2_projections[j].y = project_part * normal.y;

			/* calculate the min and max */
			if (j == 0)
			{
				ship2_max_projections.x = ship2_projections[j].x;
				ship2_max_projections.y = ship2_projections[j].y;
			}
			else if (ship2_projections[j].x > ship2_max_projections.x)
			{
				ship2_max_projections.x = ship2_projections[j].x;
				ship2_max_projections.y = ship2_projections[j].y;
			}
			if (j == 0)
			{
				ship2_min_projections.x = ship2_projections[j].x;
				ship2_min_projections.y = ship2_projections[j].y;
			}
			else if (ship2_projections[j].x < ship2_min_projections.x)
			{
				ship2_min_projections.x = ship2_projections[j].x;
				ship2_min_projections.y = ship2_projections[j].y;
			}
		}

		if (!((ship1_min_projections.x <= ship2_min_projections.x && ship2_min_projections.x <= ship1_max_projections.x) ||
			(ship2_min_projections.x <= ship1_min_projections.x && ship1_min_projections.x <= ship2_max_projections.x)))
		{
			/* IF the condition above is ! true then Collision not detected since we've found a separating axis */
			return FALSE;
		}
	}
	/* go through two axis for ship 2 */
	for (i = 0; i < 2; i++)
	{
		/* calculate the axis */
		calculate_axis_of_ship(ship2, i);
		/* find normal of the first axis */
		normal.x = -(ship2->axis[i].y);
		normal.y = ship2->axis[i].x;

		/* project all the points in both ships to the normal */
		for (j = 0; j < 4; j++)
		{
			/* calculate the dot product */
			float dp;
			float project_part;
			dp = ship1->temp_matrix[j][X]*normal.x + ship1->temp_matrix[j][Y]*normal.y;
			project_part = dp/(normal.x*normal.x + normal.y*normal.y);

			ship1_projections[j].x = project_part * normal.x;
			ship1_projections[j].y = project_part * normal.y;

			/* calculate the min and max */
			if (j == 0)
			{
				ship1_max_projections.x = ship1_projections[j].x;
				ship1_max_projections.y = ship1_projections[j].y;
			}
			else if (ship1_projections[j].x > ship1_max_projections.x)
			{
				ship1_max_projections.x = ship1_projections[j].x;
				ship1_max_projections.y = ship1_projections[j].y;
			}
			if (j == 0)
			{
				ship1_min_projections.x = ship1_projections[j].x;
				ship1_min_projections.y = ship1_projections[j].y;
			}
			else if (ship1_projections[j].x < ship1_min_projections.x)
			{
				ship1_min_projections.x = ship1_projections[j].x;
				ship1_min_projections.y = ship1_projections[j].y;
			}
		}
		for (j = 0; j < 4; j++)
		{
			/* calculate the dot product */
			float dp;
			float project_part;
			dp = ship2->temp_matrix[j][X]*normal.x + ship2->temp_matrix[j][Y]*normal.y;
			project_part = dp/(normal.x*normal.x + normal.y*normal.y);

			ship2_projections[j].x = project_part * normal.x;
			ship2_projections[j].y = project_part * normal.y;

			/* calculate the min and max */
			if (j == 0)
			{
				ship2_max_projections.x = ship2_projections[j].x;
				ship2_max_projections.y = ship2_projections[j].y;
			}
			else if (ship2_projections[j].x > ship2_max_projections.x)
			{
				ship2_max_projections.x = ship2_projections[j].x;
				ship2_max_projections.y = ship2_projections[j].y;
			}
			if (j == 0)
			{
				ship2_min_projections.x = ship2_projections[j].x;
				ship2_min_projections.y = ship2_projections[j].y;
			}
			else if (ship2_projections[j].x < ship2_min_projections.x)
			{
				ship2_min_projections.x = ship2_projections[j].x;
				ship2_min_projections.y = ship2_projections[j].y;
			}
		}

		if (!((ship1_min_projections.x <= ship2_min_projections.x && ship2_min_projections.x <= ship1_max_projections.x) ||
			(ship2_min_projections.x <= ship1_min_projections.x && ship1_min_projections.x <= ship2_max_projections.x)))
		{
			/* IF the condition above is ! true then Collision not detected since we've found a separating axis */
			return FALSE;
		}
	}

	/* IF all sepration axis are overlapping then yes, we have a collision */
	return TRUE;
}

/*---------------------------------------------------------------------------------------------
 * (function: calculate_axis_of_ship)
 *	Point 1 - Point 2 ... since the rectangle for the ship is in the order P1, P2, P3, P4 then P4 to P1
 *-------------------------------------------------------------------------------------------*/
void calculate_axis_of_ship(ship_t *ship, int axis_idx)
{
	ship->axis[axis_idx].x = ship->temp_matrix[axis_idx][X] - ship->temp_matrix[axis_idx + 1][X];
	ship->axis[axis_idx].y = ship->temp_matrix[axis_idx][Y] - ship->temp_matrix[axis_idx + 1][Y];
}

/*---------------------------------------------------------------------------------------------
 * (function: straight_line_vector)
 *-------------------------------------------------------------------------------------------*/
short straight_line_vector_projection(ship_t *ship, int angle, float x, float y, int is_shot)
{
	ship_t* current_ship;
	int i;
	int j;
	vector_t point1;
	vector_t point2;
	vector_t slope_point;
	float line_slope;
	float c;
	
	point1.x = x;
	point1.y = y;

	for (i = 0; i < 2; i++)
	{
		
		if (i == 0)
		{
			current_ship = &p1_ship;
		}
		else
		{
			current_ship = &p2_ship;
		}

		if ((ship == current_ship) || (ship == current_ship))
		{
			continue;
		}

		slope_point.x = cos((angle-270)*PI/180) + x;
		slope_point.y = sin((angle-270)*PI/180) + y;
		if ((x - slope_point.x) != 0)
		{
			line_slope = (slope_point.y - y)/(slope_point.x - x);  

			if ((slope_point.x - x) < 0)
			{
				/* heading towards x = 0 get the c of the line equation "y = mx + b" */
				c = y - line_slope*x;
				point2.x = 0;
				point2.y = c; 

				/* don't go outside screen boundary */
				if (point2.y < 0)
				{
					point2.y = 0;
					point2.x = (0 - c)/line_slope;
				}
				else if (point2.y > 240)
				{
					point2.y = 240;
					point2.x = (240 - c)/line_slope;
				}
			}
			else 
			{
				/* heading towards 320*240 */
				c = y - line_slope*x;
				point2.x = 320;
				point2.y = line_slope*point2.x + c;

				/* don't go outside screen boundary */
				if (point2.y < 0)
				{
					point2.y = 0;
					point2.x = (0 - c)/line_slope;
				}
				else if (point2.y > 240)
				{
					point2.y = 240;
					point2.x = (240 - c)/line_slope;
				}
			}
		}
		else
		{
			/* x component of slope is 0, therefore line is perpendicular to x-axis */
			if (angle == 360 || angle == 0)
			{
				/* pointing to y = 240 */
				point2.x = point1.x;
				point2.y = 240;
			}
			else if (angle == 180)
			{
				point2.x = point1.x;
				point2.y = 0;
			}
		}

		if (is_shot)
		{
			ship->shot_start.x = x;
			ship->shot_start.y = y;
			ship->shot_end.x = point2.x;
			ship->shot_end.y = point2.y;
		}
		else // is sensor beam
		{
			ship->sensor_start.x = x;
			ship->sensor_start.y = y;
			ship->sensor_end.x = point2.x;
			ship->sensor_end.y = point2.y;
		}

		/* now that we have the line projection, return what it hits - first check for ship */
		for (j = 0; j < 4; j++)
		{
			vector_t ship_vertices1;
			vector_t ship_vertices2;
			short test1;
			short test2;

			ship_vertices1.x = current_ship->matrix_location[j][X];
			ship_vertices1.y = current_ship->matrix_location[j][Y];
			ship_vertices2.x = current_ship->matrix_location[(j+1)%4][X];
			ship_vertices2.y = current_ship->matrix_location[(j+1)%4][Y];

			test1 = is_ccw_abc(point1.x, point1.y, ship_vertices1.x, ship_vertices1.y, point2.x, point2.y);
			test2 = is_ccw_abc(point1.x, point1.y, ship_vertices2.x, ship_vertices2.y, point2.x, point2.y);

			/* theres is a collision if the clockwise tests are XOR TRUE */
			if ((test1 == TRUE && test2 == FALSE) || (test1 == FALSE && test2 == TRUE))
			{
				/* ship collision */
				return SHIP;
			}
		}

		/* if it's not a ship, return wall it hits */
		if (point2.x >= 0 && point2.x <= 320)
		{
			if (point2.y == 0)
				return WALL_N;
			else if (point2.y == 240)
				return WALL_S;
		}
		else if (point2.y >= 0 && point2.y <=240)
		{
			if (point2.x == 0)
				return WALL_W;
			else if (point2.x == 320)
				return WALL_E;
		}
	}

	return NO_COLLISION;
}

/*---------------------------------------------------------------------------------------------
 * (function: is_ccw_abc)
 * 	checks if the points a, b, c are in the clockwise detection
 *-------------------------------------------------------------------------------------------*/
short is_ccw_abc(float a_x, float a_y, float b_x, float b_y, float c_x, float c_y)
{
	float slope_ab = (b_y - a_y) / (b_x - a_x);
	float slope_bc = (c_y - b_y) / (c_x - b_x);

	if (slope_ab < slope_bc)
		return TRUE;
	else
		return FALSE;
}

#if 0
void main()
{
	ship_t ship1;
	ship_t ship2;
	ship1.axis = (vector_t*)malloc(sizeof(vector_t) * 2);
	ship2.axis = (vector_t*)malloc(sizeof(vector_t) * 2);

	init_draw();
	init_draw_ship(&ship1, 315, 20, 20);
	init_draw_ship(&ship2, 135, 25, 20);
	check_ships_collide(&ship1, &ship2);
}
#endif

