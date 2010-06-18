#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <io.h>
#include <math.h>

#include "collision_detection.h"
#include "draw.h"
#include "types.h"

#define NORTH_WALL 8
#define SOUTH_WALL 232
#define WEST_WALL 8
#define EAST_WALL 312

short ships_seperating_axis_theorem_collision_detect(ship_t *ship1, ship_t *ship2);
void calculate_axis_of_ship(ship_t *ship, int axis_idx);

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
