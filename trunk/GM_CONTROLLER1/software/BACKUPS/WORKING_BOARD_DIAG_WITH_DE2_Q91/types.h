/* Includes */

#include "alt_types.h"
#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "altera_avalon_pio_regs.h"

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
