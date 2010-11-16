
void MenuBegin( char *title );
void MenuItem( char letter, char *name );
void GetInputString( char* entry, int size, FILE * stream );
int MenuEnd( char lowLetter, char highLetter );

void DoJTAGUARTMenu( void );
void DoSevenSegMenu( void );

char TopMenu( void );
