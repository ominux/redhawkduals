#include "types.h"
#include "system.h"
#include "high_level_menu.h"

#ifdef LEDS_NAME
/*---------------------------------------------------------------------------------------------
 * (function: TestLEDs)
 * This function tests LED functionality.
 * It exits when the user types a 'q'.
 *-------------------------------------------------------------------------------------------*/
void TestLEDs(void)
{
	volatile alt_u8 led;
	static char ch;
	static char entry[4];

	/* Turn the LEDs on. */
	led = 0xff;
	IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, led);
	printf( "\nAll LEDs should now be on.\n" );
	printf( "\tPlease press 'q' [Followed by <enter>] to exit this test.\n" );

	/* Get the input string for exiting this test. */
	do 
	{
		GetInputString( entry, sizeof(entry), stdin);
		sscanf( entry, "%c\n", &ch );
	} while ( ch != 'q' );

	/* Turn the LEDs off and exit. */
	led = 0x0;
	IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, led);
	printf(".....Exiting LED Test.\n");
}
#endif

#ifdef SEVEN_SEG_PIO_NAME
/*---------------------------------------------------------------------------------------------
 * static void sevenseg_set_hex(alt_u8 hex)
 * Function which encodes the value passed in by
 * the variable 'hex' into what is displayed on
 * the Seven Segment Display.
 *-------------------------------------------------------------------------------------------*/
void sevenseg_set_hex(alt_u8 hex)
{
	static alt_u8 segments[16] = {
		0x81, 0xCF, 0x92, 0x86, 0xCC, 0xA4, 0xA0, 0x8F, 0x80, 0x84, /* 0-9 */
		0x88, 0xE0, 0xF2, 0xC2, 0xB0, 0xB8 };                       /* a-f */

	alt_u32 data = segments[hex & 15] | (segments[(hex >> 4) & 15] << 8);

	IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_PIO_BASE, data);
}

/*---------------------------------------------------------------------------------------------
 * static void SevenSegCount( void )
 * Displays from 0 to FF on the Seven Segment Display with
 * a 0.25s count delay implemented in a for loop.
 *-------------------------------------------------------------------------------------------*/
void SevenSegCount( void )
{
	alt_u32 count;
	for (count = 0; count <= 0xff; count++)
	{
		sevenseg_set_hex( count );
		usleep(50000);
	}
}

/*---------------------------------------------------------------------------------------------
 * static void SevenSegControl(void)
 *
 * Displays selected Seven Segment segments.
 *-------------------------------------------------------------------------------------------*/
void SevenSegControl(void)
{
	char entry[4];
	alt_32 bits;
	alt_32 keyBit;
	static char ch;

	/* Turn all segments off at start of test. */
	bits = 0xffff;
	IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_PIO_BASE, bits);

	printf("\n");
	printf("\n");
	printf("         +-A--+     +-a--+\n");
	printf("         |    |     |    |\n");
	printf("         F    B     f    b\n");
	printf("         |    |     |    |\n");
	printf("         +-G--+     +-g--+\n");
	printf("         |    |     |    |\n");
	printf("         E    C     e    c\n");
	printf("         |    |     |    |\n");
	printf("         +-D--+ (H) +-d--+ (h)\n");
	printf("\n");
	printf("Press 'q' [Followed by <enter>] to exit this test.\n");

	do
	{
		/* Get terminal input. */
		GetInputString( entry, sizeof(entry), stdin);
		sscanf( entry, "%c\n", &ch );
		/* SSD pattern algorithm. */
		keyBit = 0;
		if(ch >= 'a' && ch <= 'g')
			keyBit = 1 << ('g' - ch);
		else if(ch == 'h')
			keyBit = 1 << 7;
		else if(ch >= 'A' && ch <= 'G')
			keyBit = 1 << ('G' - ch + 8);
		else if(ch == 'H')
			keyBit = 1 << 15;
		bits ^= keyBit;
		IOWR_ALTERA_AVALON_PIO_DATA(SEVEN_SEG_PIO_BASE, bits);
	}
	while( ch != 'q' );
}
#endif

