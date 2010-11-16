#include "types.h"
#include "system.h"
#include "high_level_menu.h"
#include "uart_test.h"
#include "buttons_interrupt.h"
#include "lcd_test.h"
#include "leds_seven_seg.h"
#include "uart_test.h"

/*---------------------------------------------------------------------------------------------
 * Function to set the Menu "header".
 *-------------------------------------------------------------------------------------------*/
void MenuBegin( char *title )
{
	printf("\n\n");
	printf("----------------------------------\n");
	printf("Nios II Board Diagnostics\n");
	printf("----------------------------------\n");
	printf(" %s\n",title);
}

/*---------------------------------------------------------------------------------------------
 * Function to define a menu entry.
 *	- Maps a character (defined by 'letter') to a description string
 *		(defined by 'string').
 *-------------------------------------------------------------------------------------------*/
void MenuItem( char letter, char *name )
{
	printf("     %c:  %s\n" ,letter, name);
}

/*---------------------------------------------------------------------------------------------
 * (function: GetInputString
*	Purpose: Parses an input string for the character '\n'.  Then
*					 returns the string, minus any '\r' characters it
*					 encounters.
 *-------------------------------------------------------------------------------------------*/
void GetInputString( char* entry, int size, FILE * stream )
{
	int i;
	int ch = 0;

	for(i = 0; (ch != '\n') && (i < size); )
	{
		if( (ch = getc(stream)) != '\r')
		{
			entry[i] = ch;
			i++;
		}
	}
}

/*---------------------------------------------------------------------------------------------
 * void MenuEnd(char lowLetter, char highLetter)
 * Function which defines the menu exit/end conditions.
 *	In this context, the character 'q' always means 'exit'.
 *		The code grabs input from STDIN (via the GetInputString function)
 *		and continues until either a 'q' or a character outside of the
 *		range, enclosed by 'lowLetter' and 'highLetter', is reached.
 *-------------------------------------------------------------------------------------------*/
int MenuEnd( char lowLetter, char highLetter )
{
	static char entry[4];
	static char ch;

	printf("     q:  Exit\n");
	printf("----------------------------------\n");
	printf("\nSelect Choice (%c-%c): [Followed by <enter>]",lowLetter,highLetter);

	GetInputString( entry, sizeof(entry), stdin );
	if(sscanf(entry, "%c\n", &ch))
	{
		if( ch >= 'A' && ch <= 'Z' )
			ch += 'a' - 'A';
		if( ch == 27 )
			ch = 'q';
	}
	return ch;
}

#ifdef JTAG_UART_0_NAME
/*---------------------------------------------------------------------------------------------
 * static void DoJTAGUARTMenu( void )
 * Generates the JTAG UART testing menu.
 *-------------------------------------------------------------------------------------------*/
void DoJTAGUARTMenu( void )
{
	static char ch;

	while (1)
	{
		MenuBegin( "JTAG UART Menu" );
		MenuItem( 'a', "Send Lots" );
		MenuItem( 'b', "Receive Chars" );
		ch = MenuEnd('a', 'b');

		switch (ch)
		{
			MenuCase('a', UARTSendLots);
			MenuCase('b', UARTReceiveChars);
		}

		if (ch == 'q')
		{
			break;
		}
	}
}
#endif

#ifdef SEVEN_SEG_PIO_NAME
/*---------------------------------------------------------------------------------------------
 * static void DoSevenSegMenu( void )
 * Generates the Seven Segment Display menu.
 *-------------------------------------------------------------------------------------------*/
void DoSevenSegMenu( void )
{
	static char ch;

	while(1)
	{
		MenuBegin("Seven Segment Menu");
		MenuItem('a', "Count From 0 to FF.");
		MenuItem('b', "Control Individual Segments.");
		ch = MenuEnd('a', 'b');

		switch(ch)
		{
			MenuCase('a', SevenSegCount);
			MenuCase('b', SevenSegControl);
		}

		if ( ch == 'q' )
		{
			break;
		}
	}
}
#endif


/*---------------------------------------------------------------------------------------------
 * Generates the top level menu for this diagnostics program.
 *-------------------------------------------------------------------------------------------*/
char TopMenu( void )
{
	static char ch;

	/* Output the top-level menu to STDOUT */

	while (1)
	{
		MenuBegin("Main Menu");
#ifdef LEDS_NAME
		MenuItem( 'a', "Test LEDs" );
#endif
#ifdef LCD_0_NAME
		MenuItem( 'b', "LCD Display Test");
#endif
#ifdef PUSH_BUTTONS_NAME
		MenuItem( 'c', "Button/Switch Test");
#endif
#ifdef SEVEN_SEG_PIO_NAME
		MenuItem( 'd', "Seven Segment Menu" );
#endif
#ifdef JTAG_UART_0_NAME
		MenuItem( 'e', "JTAG UART Menu" );
#endif
		ch = MenuEnd('a', 'e');

		switch(ch)
		{
#ifdef LEDS_NAME
			MenuCase('a',TestLEDs);
#endif
#ifdef LCD_0_NAME
			MenuCase('b',TestLCD);
#endif
#ifdef PUSH_BUTTONS_NAME
			MenuCase('c',TestButtons);
#endif
#ifdef SEVEN_SEG_PIO_NAME
			MenuCase('d',DoSevenSegMenu);
#endif
#ifdef JTAG_UART_0_NAME
			MenuCase('e',DoJTAGUARTMenu);
#endif
			case 'q':
				break;
			default:
				printf("\n -ERROR: %c is an invalid entry.	Please try again\n", ch);
				break;
		}

		if (ch == 'q' )
			break;
	}
	return( ch );
}


