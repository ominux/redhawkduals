#include "types.h"
#include "system.h"
#include "high_level_menu.h"

#ifdef LCD_0_NAME
/*---------------------------------------------------------------------------------------------
 * static void TestLCD( void )
 * Tests the LCD by printing some simple output to each line.
 *-------------------------------------------------------------------------------------------*/
void TestLCD( void )
{
	FILE *lcd;
	static char ch;
	static char entry[4];

	lcd = fopen(LCD_0_NAME, "w");

	/* Write some simple text to the LCD. */
	if (lcd != NULL )
	{
		fprintf(lcd, "\nThis is the LCD Display.\n");
		fprintf(lcd, "If you can see this, your LCD is functional.\n");
	}
	printf("\nIf you can see messages scrolling on the LCD Display, then it is functional!\n");
	printf( "\tPlease press 'q' [Followed by <enter>] to exit this test.\n" );

	/* Get the input string for exiting this test. */
	do 
	{
		GetInputString( entry, sizeof(entry), stdin);
		sscanf( entry, "%c\n", &ch );
	} while ( ch != 'q' );

	/* Send the command sequence to clear the LCD. */
	if (lcd != NULL )
	{
		fprintf(lcd, "%c%s", ESC, CLEAR_LCD_STRING);
	}
	fclose( lcd );

	return;
}
#endif
