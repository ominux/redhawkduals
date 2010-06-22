#include "altera_up_avalon_pixel_buffer.h"
#include "types.h"

void init_draw();
void draw_ship(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf);
void clean_ship(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf);

void draw_shot(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf, int sec);
void clean_shot(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf);

void clean_sensor(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf);
void draw_sensor(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf);

void draw_letter(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, char letter, int x0, int y0);
void draw_string(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, int x0, int y0, char *string, int size);

void rotate_a_matrix(float **matrix, int row, int column, int angle);
void translate_a_matrix(float **matrix, int row, int column, int x, int y);
void copy_matrix_and_round(float **from, int row1, int column1, float **to);
void copy_matrix(float **from, int row1, int column1, float **to);
float **allocate_matrix(int row1, int column1);
void free_matrix(float **matrix, int row1, int column1);
