#include "types.h"

void init_draw();

void rotate_a_matrix(float **matrix, int row, int column, int angle);
void translate_a_matrix(float **matrix, int row, int column, int x, int y);
void copy_matrix_and_round(float **from, int row1, int column1, float **to);
void copy_matrix(float **from, int row1, int column1, float **to);
float **allocate_matrix(int row1, int column1);
void free_matrix(float **matrix, int row1, int column1);
