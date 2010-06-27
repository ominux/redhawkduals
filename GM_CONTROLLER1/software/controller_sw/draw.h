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
