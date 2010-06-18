#include "types.h"

void init_ship(ship_t *ship, int start_angle, int start_x, int start_y, int player);
void reset_ship(ship_t *ship, int start_angle, int start_x, int start_y);
int power_calculation(ship_t *ship);

void degrade_crystals_based_on_shot(ship_t *ship, int amount);
