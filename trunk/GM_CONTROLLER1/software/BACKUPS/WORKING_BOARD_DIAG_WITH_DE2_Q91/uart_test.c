#include "types.h"
#include "system.h"
#include "high_level_menu.h"

#ifdef JTAG_UART_0_NAME
/*---------------------------------------------------------------------------------------------
 * static void UARTSendLots( void )
 * Function which sends blocks/lots of text over the UART
 * For now, it is hardcoded to send 100 lines with 80
 * characters per line.
 *-------------------------------------------------------------------------------------------*/
void UARTSendLots( void )
{
	char entry[4];
	static char ch;
	int i,j;
	int mix = 0;

	printf("\n\nPress character (and <enter>), or <space> (and <enter>) for mix: ");
	GetInputString( entry, sizeof(entry), stdin);
	sscanf( entry, "%c\n", &ch );
	printf("%c\n\n",ch);

	/* Don't print unprintables! */
	if(ch < 32)
		ch = '.';

	/* Check to see if the character is a space (for "mix" of chars). */
	if (ch == ' ')
	{
		mix = 1;
	}

	/* The loop that sends the block of text. */
	for(i = 0; i < 100; i++)
	{
		for(j = 0; j < 80; j++)
		{
			if(mix)
			{
				ch++;
				if(ch >= 127)
					ch = 33;
			}
			printf("%c", ch);
		}
		printf("\n");
	}
	printf("\n");
}

/*---------------------------------------------------------------------------------------------
 * static void UARTReceiveChars(void)
 * Typed characters will be repeated on the terminal connection.
 * Entering 'q' will end the session.
 *-------------------------------------------------------------------------------------------*/
void UARTReceiveChars(void)
{
	static char entry[4];
	static char ch;
	static char chP;

	printf("\n\nEnter a character (followed by <enter>); \n\tPress 'q' (followed by <enter>) to exit this test.\n\n");

	do
	{
		GetInputString( entry, sizeof(entry), stdin );
		sscanf( entry, "%c\n", &ch );
		chP = ch >= 32 ? ch : '.';
		printf("\'%c\' 0x%02x %d\n",chP,ch,ch);
	}
	while( ch != 'q' );
}
#endif

