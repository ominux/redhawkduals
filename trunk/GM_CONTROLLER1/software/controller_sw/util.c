#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <io.h>
#include <math.h>

#include "system.h"
#include <alt_types.h>

#include "types.h"
#include "globals.h"
#include "util.h"

/*---------------------------------------------------------------------------------------------
 * (function: number_to_character_string)
 *-------------------------------------------------------------------------------------------*/
void number_to_character_string(string_t *ret_string, int number)
{
	sprintf(ret_string->string, "%d", number);
	ret_string->size = strlen(ret_string->string);
}
