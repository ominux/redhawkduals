#include "types.h"

#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void handle_button_interrupts(void* context);
#else
void handle_button_interrupts(void* context, alt_u32 id);
#endif
void init_button_pio();
void disable_button_pio();
void TestButtons( void );
