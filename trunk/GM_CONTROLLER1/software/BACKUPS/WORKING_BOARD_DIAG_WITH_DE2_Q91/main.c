#include "types.h"
#include "system.h"
#include "high_level_menu.h"

/*---------------------------------------------------------------------------------------------
 * (function: main)
 *-------------------------------------------------------------------------------------------*/
int main()
{
	/* Declare variable for received character. */
	int ch;

	while (1)
	{
		ch = TopMenu();
		if (ch == 'q')
	 	{
		 	printf( "\nExiting from Board Diagnostics.\n");
		 	/* Send EOT to nios2-terminal on the other side of the link. */
			printf( "%c", EOT );
		 	break;
	 	}
 	}
 	return( 0 );
}
