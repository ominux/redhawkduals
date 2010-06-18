/* Includes */

/*  Macros to clear the LCD screen. */
#define ESC 27
#define CLEAR_LCD_STRING "[2J"

/* One nice define for going to menu entry functions. */

#define MenuCase(letter,proc) case letter:proc(); break;

/* Board Diagnositics Peripheral Function prototypes */

/* Define the EOT character to terminate nios2-terminal
 * upon exiting the Main Menu.
 */

#define EOT 0x4

#define PI 3.14159265

#ifndef TRUE
#define TRUE 1
#endif
#ifndef FALSE
#define FALSE 0
#endif

#define X 0
#define Y 1

#define ship_t struct ship_t_t
#define vector_t struct vector_t_t

#ifndef TYPES_H
#define TYPES_H
typedef enum 
{
	NO_COLLISION,
	SHIP,
	WALL_N,
	WALL_S,
	WALL_E,
	WALL_W
		
} collisions;



ship_t
{
	int player_number;
	int row; // size of all the matrices that make up the lines...note always 3 rows and x collumns
	int column;
	/* pts 0, 1, 2, 3 make up square */
	/* pts 4, 5 make up direction of gun/ship */
	float **matrix_rotated_at_origin;
	float **matrix_location; // where the ship is rounded to int coordinates
	float **temp_matrix; // used to test next spot to check if collision ... saves allocation time

	vector_t *axis; // for collision detection

	int color[2]; // color of various lines that make up ship

	int angle; // current angle
	int x; // centroids
	int y;
	vector_t *velocity;

	short reset;

	int energy;
	int energy_crystals[28];

};


vector_t
{
	float x;
	float y;
};

#endif
