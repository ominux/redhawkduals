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
#define ONE_SEC 1000000
#define UPDATES_PER_SECOND 15
/* degree turn rate / second ? */
#define TURN_RATE 10
#define MAX_SPEED 5
/* cost to accelerate in a second */
#define ENGINE_POWER_COST 1
/* cost to run your ship */
#define BASIC_POWER_COST 10
#define GAME_OVER_STALL_TIME 2

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
#define string_t struct string_t_t

#ifndef TYPES_H
#define TYPES_H
typedef enum 
{
	NO_COLLISION,
	SHIP, // 1
	WALL_N, // 2
	WALL_S, // 3
	WALL_E, // 4
	WALL_W,  // 5
	ERROR
} collisions;

typedef enum 
{
	TIE,
	P1,
	P2, 
	LIVE
} game_status;

string_t
{
	char *string;
	int size;
};

vector_t
{
	float x;
	float y;
};

ship_t
{
	int player_number;
	int row; // size of all the matrices that make up the lines...note always 3 rows and x collumns
	int column;
	/* pts 0, 1, 2, 3 make up square */
	/* pts 4, 5 make up direction of gun/ship */
	float **matrix_start;
	float **matrix_location; // where the ship is rounded to int coordinates
	float **temp_matrix; // used to test next spot to check if collision ... saves allocation time

	vector_t *axis; // for collision detection

	int color[2]; // color of various lines that make up ship

	alt_u16 angle; // current angle
	float x; // centroids
	float y;
	vector_t *velocity;

	short reset;

	vector_t shot_start;
	vector_t shot_end;

	vector_t sensor_start;
	vector_t sensor_end;

	alt_u8 cA_hookedup_to ;
	alt_u8 c2_hookedup_to ;
	alt_u8 c3_hookedup_to ;
	alt_u8 c4_hookedup_to ;
	alt_u8 c5_hookedup_to ;
	alt_u8 c6_hookedup_to ;
	alt_u8 c7_hookedup_to ;
	alt_u8 c8_hookedup_to ;
	alt_u8 engine;
	alt_u8 engine_left_right;
	alt_u8 sensor_state ;
	alt_u8 sensor_move ;
	alt_u8 cannon_fire ;
	alt_u16 cannon_power ;
	alt_u16 checksum ;
	short shot_fired_x_seconds_ago; // takes 5 seconds to recharge
	int power_budget_this_minute;
	int power_budget_this_minute_old;
	string_t *power_budget_string;
	short stalled; // stall until start of next minute
	short stalled_for_minutes; 
	float sensor_angle; // current angle

	alt_u8 A_B_val;
	alt_u8 A_C_val;
	alt_u8 A_D_val;
	alt_u8 A_E_val;
	alt_u8 A_F_val;
	alt_u8 A_G_val;
	alt_u8 A_H_val;
	alt_u8 B_C_val;
	alt_u8 B_D_val;
	alt_u8 B_E_val;
	alt_u8 B_F_val;
	alt_u8 B_G_val;
	alt_u8 B_H_val;
	alt_u8 C_D_val;
	alt_u8 C_E_val;
	alt_u8 C_F_val;
	alt_u8 C_G_val;
	alt_u8 C_H_val;
	alt_u8 D_E_val;
	alt_u8 D_F_val;
	alt_u8 D_G_val;
	alt_u8 D_H_val;
	alt_u8 E_F_val;
	alt_u8 E_G_val;
	alt_u8 E_H_val;
	alt_u8 F_G_val;
	alt_u8 F_H_val;
	alt_u8 G_H_val;
	alt_u8 sensor_detected_something;
	alt_u16 rx_checksum;
};


#endif
