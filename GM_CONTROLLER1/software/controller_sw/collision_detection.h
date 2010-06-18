#include "types.h"

short check_ships_collide(ship_t *ship1, ship_t *ship2);
short check_wall_collide_ns(float **matrix, int points_to_check);
short check_wall_collide_ew(float **matrix, int points_to_check);
short straight_line_vector_projection(ship_t *ship, int angle, float x, float y, int is_shot);
