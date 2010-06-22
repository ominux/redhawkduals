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
#include <alt_types.h>
#include <sys/alt_dev.h>

#include "sys/alt_irq.h"
#include "sys/alt_stdio.h"
#include "globals.h"
#include "draw.h"

#include "types.h"

float **translate_matrix;
float **rotate_matrix;

float **matrix_mult(float **matrix1, int row1, int column1, float **matrix2, int row2, int column2);

void draw_font(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, alt_u8 r0, alt_u8 r1, alt_u8 r2, alt_u8 r3, alt_u8 r4, int x0, int y0);

/*---------------------------------------------------------------------------------------------
 * (function: draw_ship)
 *	SHIP is a rectangle held in a matrix...the 0th row holds x coord and the 1st row holds y coord
 *-------------------------------------------------------------------------------------------*/
void draw_ship(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[0][0], ship->matrix_location[0][1], 
			ship->matrix_location[1][0], ship->matrix_location[1][1], 
			ship->color[0], buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[1][0], ship->matrix_location[1][1], 
			ship->matrix_location[2][0], ship->matrix_location[2][1], 
			ship->color[0], buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[2][0], ship->matrix_location[2][1], 
			ship->matrix_location[3][0], ship->matrix_location[3][1], 
			ship->color[0], buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[3][0], ship->matrix_location[3][1], 
			ship->matrix_location[0][0], ship->matrix_location[0][1], 
			ship->color[0], buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[4][0], ship->matrix_location[4][1], 
			ship->matrix_location[5][0], ship->matrix_location[5][1], 
			ship->color[1], buf);
}

/*---------------------------------------------------------------------------------------------
 * (function: clean_ship)
 *-------------------------------------------------------------------------------------------*/
void clean_ship(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[0][0], ship->matrix_location[0][1], 
			ship->matrix_location[1][0], ship->matrix_location[1][1], 
			0x0000, buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[1][0], ship->matrix_location[1][1], 
			ship->matrix_location[2][0], ship->matrix_location[2][1], 
			0x0000, buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[2][0], ship->matrix_location[2][1], 
			ship->matrix_location[3][0], ship->matrix_location[3][1], 
			0x0000, buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[3][0], ship->matrix_location[3][1], 
			ship->matrix_location[0][0], ship->matrix_location[0][1], 
			0x0000, buf);
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			ship->matrix_location[4][0], ship->matrix_location[4][1], 
			ship->matrix_location[5][0], ship->matrix_location[5][1], 
			0x0000, buf);
}

/*---------------------------------------------------------------------------------------------
 * (function: init_draw)
 *-------------------------------------------------------------------------------------------*/
void init_draw()
{
	translate_matrix = allocate_matrix(3, 3);
	translate_matrix[0][0] = 1.0;
	translate_matrix[1][1] = 1.0;
	translate_matrix[2][2] = 1.0;

	rotate_matrix = allocate_matrix(3, 3);
	rotate_matrix[2][2] = 1.0;
}

/*---------------------------------------------------------------------------------------------
 * (function: translate_matrix)
 *-------------------------------------------------------------------------------------------*/
void translate_a_matrix(float **matrix, int row, int column, int x, int y)
{
	float **temp_matrix;

	/* update the translate matrix with x and y */
	translate_matrix[2][0] = (float)x;
	translate_matrix[2][1] = (float)y;

	/* translate */
	temp_matrix = matrix_mult(translate_matrix, 3, 3, matrix, row, column);
	/* copy the return values into the data structure */
	copy_matrix_and_round(temp_matrix, row, column, matrix);
	/* delete the temp_matrix */
	free_matrix(temp_matrix, row, column);
}

/*---------------------------------------------------------------------------------------------
 * (function: rotate_a_matrix)
 *-------------------------------------------------------------------------------------------*/
void rotate_a_matrix(float **matrix, int row, int column, int angle)
{
	float **temp_matrix;

	/* calculate cos of the angle */
	rotate_matrix[0][0] = cos(angle*PI/180);
	rotate_matrix[1][1] = rotate_matrix[0][0];
	/* calculate sin of the angle */
	rotate_matrix[0][1] = sin(angle*PI/180);
	rotate_matrix[1][0] = -rotate_matrix[0][1];

	/* rotate */
	temp_matrix = matrix_mult(rotate_matrix, 3, 3, matrix, row, column);
	/* copy the return values into the data structure */
	copy_matrix_and_round(temp_matrix, row, column, matrix);
	/* delete the temp_matrix */
	free_matrix(temp_matrix, row, column);
}

/*---------------------------------------------------------------------------------------------
 * (function: copy_matrix_and_round)
 *-------------------------------------------------------------------------------------------*/
void copy_matrix_and_round(float **from, int row1, int column1, float **to)
{
	int i, j;

	for (i = 0; i < column1; i++)
	{
		for (j = 0; j < row1; j++)
		{
			to[i][j] = (float)roundf(from[i][j]);
		}
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: copy_matrix_and_round)
 *-------------------------------------------------------------------------------------------*/
void copy_matrix(float **from, int row1, int column1, float **to)
{
	int i, j;

	for (i = 0; i < column1; i++)
	{
		for (j = 0; j < row1; j++)
		{
			to[i][j] = from[i][j];
		}
	}
}
/*---------------------------------------------------------------------------------------------
 * (function: allocate_matrix)
 *-------------------------------------------------------------------------------------------*/
float **allocate_matrix(int row1, int column1)
{
	int i;
	float **matrix;

	matrix = (float**)malloc(sizeof(float*)*column1);
	for (i = 0; i < column1; i++)
	{
		matrix[i] = (float*)calloc(sizeof(float),row1);
	}

	return matrix;
}

/*---------------------------------------------------------------------------------------------
 * (function: free_matrix)
 *-------------------------------------------------------------------------------------------*/
void free_matrix(float **matrix, int row1, int column1)
{
	int i;

	for (i = 0; i < row1; i++)
	{
		free(matrix[i]);
	}
	free(matrix);
}

/*---------------------------------------------------------------------------------------------
 * (function: matrix_mult)
 * [c][r] is the matrix ordering in 2d array
 * matrix 1       * matrix 2		=> matrix 3
 * 
 * c = 3, r = 4   * c = 4, r = 3   	=> c = c2(4), r = r1(4) 
 *
 * [a b c]	[1 2 3 4]		[a1+b5+c9 a2+b6+cm a3+b7+cn a4+b8+co]
 * [d e f]	[5 6 7 8]		[d1+e5+f9 d2+e6+fm d3+e7+fn d4+e8+fo]
 * [g h i]	[9 m n o]		[g1+h5+i9 g2+h6+im g3+h7+in g4+h8+io]
 * [j k l]				[j1+k5+l9 j2+k6+lm j3+k7+ln j4+k8+lo]
 *-------------------------------------------------------------------------------------------*/
float **matrix_mult(float **matrix1, int row1, int column1, float **matrix2, int row2, int column2)
{
	int c, r, i;
	int column3 = column2;
	int row3 = row1;
	float **matrix3 = (float**)malloc(sizeof(float*)*column3);

	for (c = 0; c < column3; c++)
	{
		matrix3[c] = (float*)calloc(sizeof(float), row3);
	}

	for (c = 0; c < column3; c++)
	{	
		for (r = 0; r < row3; r++)
		{
			for (i = 0; i < column1; i++)
			{
				matrix3[c][r] += matrix1[i][r] * matrix2[c][i];
			}
		}
	}

	return matrix3;
}


/*---------------------------------------------------------------------------------------------
 * (function: clean_sensor)
 *-------------------------------------------------------------------------------------------*/
void clean_sensor(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			roundf(ship->sensor_start.x), roundf(ship->sensor_start.y),
			roundf(ship->sensor_end.x), roundf(ship->sensor_end.y),
			0x0000, buf);
}
/*---------------------------------------------------------------------------------------------
 * (function: draw_sensor)
 *-------------------------------------------------------------------------------------------*/
void draw_sensor(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			roundf(ship->sensor_start.x), roundf(ship->sensor_start.y),
			roundf(ship->sensor_end.x), roundf(ship->sensor_end.y),
			0x00C0, buf);
}

/*---------------------------------------------------------------------------------------------
 * (function: clean_shot)
 *-------------------------------------------------------------------------------------------*/
void clean_shot(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			roundf(ship->shot_start.x), roundf(ship->shot_start.y),
			roundf(ship->shot_end.x), roundf(ship->shot_end.y),
			0x0000, buf);
}

/*---------------------------------------------------------------------------------------------
 * (function: draw_shot)
 *-------------------------------------------------------------------------------------------*/
void draw_shot(ship_t *ship, alt_up_pixel_buffer_dev *pixel_buffer, int buf, int sec)
{
	alt_up_pixel_buffer_draw_line(pixel_buffer, 
			roundf(ship->shot_start.x), roundf(ship->shot_start.y),
			roundf(ship->shot_end.x), roundf(ship->shot_end.y),
			0x0FF0 - (0x0F0*sec), buf);
}

/*---------------------------------------------------------------------------------------------
 * (function: draw_string)
 *-------------------------------------------------------------------------------------------*/
void draw_string(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, int x0, int y0, char *string, int size)
{
	int i;

	for (i = 0; i < size; i++)
	{
		draw_letter(pixel_buffer, color, buf, string[i], x0+(i*6), y0);
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: draw_letter)
 *-------------------------------------------------------------------------------------------*/
void draw_letter(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, char letter, int x0, int y0)
{
	switch(letter)
	{
		case 'a':
			draw_font(pixel_buffer, color, buf, 0x1E, 0x05, 0x05, 0x05, 0x1E, x0, y0);
			break;
		case 'b':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x15, 0x15, 0x15, 0x0C, x0, y0);
			break;
		case 'c':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x11, 0x11, 0x11, 0x11, x0, y0);
			break;
		case 'd':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x11, 0x11, 0x11, 0x0E, x0, y0);
			break;
		case 'e':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x15, 0x15, 0x15, 0x15, x0, y0);
			break;
		case 'f':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x05, 0x05, 0x01, 0x01, x0, y0);
			break;
		case 'g':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x11, 0x15, 0x15, 0x1D, x0, y0);
			break;
		case 'h':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x04, 0x04, 0x04, 0x1F, x0, y0);
			break;
		case 'i':
			draw_font(pixel_buffer, color, buf, 0x11, 0x11, 0x1F, 0x11, 0x11, x0, y0);
			break;
		case 'j':
			draw_font(pixel_buffer, color, buf, 0x08, 0x10, 0x11, 0x11, 0x0F, x0, y0);
			break;
		case 'k':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x04, 0x06, 0x05, 0x18, x0, y0);
			break;
		case 'l':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x10, 0x10, 0x10, 0x10, x0, y0);
			break;
		case 'm':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x02, 0x04, 0x02, 0x1F, x0, y0);
			break;
		case 'n':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x01, 0x0E, 0x10, 0x1F, x0, y0);
			break;
		case 'o':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x11, 0x11, 0x11, 0x0E, x0, y0);
			break;
		case 'p':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x05, 0x05, 0x05, 0x02, x0, y0);
			break;
		case 'q':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x11, 0x11, 0x1E, 0x10, x0, y0);
			break;
		case 'r':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x05, 0x05, 0x0D, 0x12, x0, y0);
			break;
		case 's':
			draw_font(pixel_buffer, color, buf, 0x12, 0x15, 0x15, 0x15, 0x09, x0, y0);
			break;
		case 't':
			draw_font(pixel_buffer, color, buf, 0x01, 0x01, 0x1F, 0x01, 0x01, x0, y0);
			break;
		case 'u':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x10, 0x10, 0x10, 0x0E, x0, y0);
			break;
		case 'v':
			draw_font(pixel_buffer, color, buf, 0x03, 0x0C, 0x10, 0x0C, 0x03, x0, y0);
			break;
		case 'w':
			draw_font(pixel_buffer, color, buf, 0x1F, 0x08, 0x04, 0x08, 0x1F, x0, y0);
			break;
		case 'x':
			draw_font(pixel_buffer, color, buf, 0x11, 0x0A, 0x04, 0x0A, 0x11, x0, y0);
			break;
		case 'y':
			draw_font(pixel_buffer, color, buf, 0x03, 0x04, 0x1C, 0x04, 0x03, x0, y0);
			break;
		case 'z':
			draw_font(pixel_buffer, color, buf, 0x19, 0x15, 0x15, 0x15, 0x13, x0, y0);
			break;
		case '-':
			draw_font(pixel_buffer, color, buf, 0x04, 0x04, 0x04, 0x04, 0x04, x0, y0);
			break;
		case '0':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x13, 0x15, 0x19, 0x0E, x0, y0);
			break;
		case '1':
			draw_font(pixel_buffer, color, buf, 0x10, 0x12, 0x1F, 0x10, 0x10, x0, y0);
			break;
		case '2':
			draw_font(pixel_buffer, color, buf, 0x12, 0x19, 0x15, 0x12, 0x00, x0, y0);
			break;
		case '3':
			draw_font(pixel_buffer, color, buf, 0x0A, 0x11, 0x15, 0x15, 0x0A, x0, y0);
			break;
		case '4':
			draw_font(pixel_buffer, color, buf, 0x07, 0x04, 0x04, 0x1F, 0x04, x0, y0);
			break;
		case '5':
			draw_font(pixel_buffer, color, buf, 0x17, 0x15, 0x15, 0x09, 0x00, x0, y0);
			break;
		case '6':
			draw_font(pixel_buffer, color, buf, 0x0E, 0x15, 0x15, 0x15, 0x08, x0, y0);
			break;
		case '7':
			draw_font(pixel_buffer, color, buf, 0x01, 0x01, 0x1D, 0x03, 0x01, x0, y0);
			break;
		case '8':
			draw_font(pixel_buffer, color, buf, 0x0A, 0x15, 0x15, 0x15, 0x0A, x0, y0);
			break;
		case '9':
			draw_font(pixel_buffer, color, buf, 0x02, 0x15, 0x15, 0x15, 0x0E, x0, y0);
			break;
		case ' ':
			draw_font(pixel_buffer, color, buf, 0x00, 0x00, 0x00, 0x00, 0x00, x0, y0);
			break;
		default:
			draw_font(pixel_buffer, color, buf, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, x0, y0);
			break;
	}
}

/*---------------------------------------------------------------------------------------------
 * (function: draw_font)
 * Goes through the 32 bit code from top point in the y direction
 *-------------------------------------------------------------------------------------------*/
void draw_font(alt_up_pixel_buffer_dev *pixel_buffer, int color, int buf, alt_u8 r0, alt_u8 r1, alt_u8 r2, alt_u8 r3, alt_u8 r4, int x0, int y0)
{
	int i, j;
	alt_u8 mask = 1;
	alt_u8 row;

	for (i = 0; i < 5; i++)
	{
		if (i == 0)
			row = r0;
		else if (i == 1)
			row = r1;
		else if (i == 2)
			row = r2;
		else if (i == 3)
			row = r3;
		else if (i == 4)
			row = r4;
		mask = 1;

		for (j = 0; j < 5; j++)
		{
			if ((mask & row) > 0)
			{
				/* there's a bit here */
				alt_up_pixel_buffer_draw_line(pixel_buffer, 
					x0+i, y0+j,
					x0+i, y0+j,
					color, buf);
			}
			mask = mask << 1;
		}
	}
}
