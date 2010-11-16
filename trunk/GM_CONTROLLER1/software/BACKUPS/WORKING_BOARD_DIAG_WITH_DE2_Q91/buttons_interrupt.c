#include "types.h"
#include "system.h"
#include "buttons_interrupt.h"

/* Declare one global variable to capture the output of the buttons (SW0-SW3),
 * when they are pressed.
 */
volatile int edge_capture;

#ifdef PUSH_BUTTONS_NAME
/*---------------------------------------------------------------------------------------------
 * static void handle_button_interrupts( void* context, alt_u32 id)
 *
 * Handle interrupts from the buttons.
 * This interrupt event is triggered by a button/switch press.
 * This handler sets *context to the value read from the button
 * edge capture register.	The button edge capture register
 * is then cleared and normal program execution resumes.
 * The value stored in *context is used to control program flow
 * in the rest of this program's routines.
 *
 * Provision is made here for systems that might have either th
 * legacy or enhanced interrupt API active, or for the Nios II IDE
 * which does not support enhanced interrupts. For systems created
 * using the Nios II softawre build tools, the enhanced API is
 * recommended for new designs.
 *-------------------------------------------------------------------------------------------*/
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void handle_button_interrupts(void* context)
#else
void handle_button_interrupts(void* context, alt_u32 id)
#endif
{
	/* Cast context to edge_capture's type.
	 * It is important to keep this volatile,
	 * to avoid compiler optimization issues.
	 */
	volatile int* edge_capture_ptr = (volatile int*) context;
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0xf );
	/* Store the value in the Button's edge capture register in *context. */
	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE);
	/* Reset the Button's edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE, 0xf);

	/* Read the PIO to delay ISR exit. This is done to prevent a spurious
	 * interrupt in systems with high processor -> pio latency and fast
	 * interrupts.  */
	IORD_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE);

}

/*---------------------------------------------------------------------------------------------
 * Initialize the button_pio.
 *-------------------------------------------------------------------------------------------*/
void init_button_pio()
{
	/* Recast the edge_capture pointer to match the alt_irq_register() function
	* prototype. */
	void* edge_capture_ptr = (void*) &edge_capture;
	/* Enable all 4 button interrupts. */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0xf);
	/* Reset the edge capture register. */
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PUSH_BUTTONS_BASE, 0xf); // needs to be high for all four buttons since the push button is high

	/*
	 * Register the interrupt handler.
	 * Provision is made here for systems that might have either the
	 * legacy or enhanced interrupt API active, or for the Nios II IDE
	 * which does not support enhanced interrupts. For systems created using
	 * the Nios II softawre build tools, the enhanced API is recommended
	 * for new designs.
	 */
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
	alt_ic_isr_register(PUSH_BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID, PUSH_BUTTONs_IRQ, handle_button_interrupts, edge_capture_ptr, 0x0);
#else
	alt_irq_register( PUSH_BUTTONS_IRQ, edge_capture_ptr, handle_button_interrupts);
#endif
}

/*---------------------------------------------------------------------------------------------
 * Tear down the button_pio.
 *-------------------------------------------------------------------------------------------*/
void disable_button_pio()
{
	/* Disable interrupts from the button_pio PIO component. */
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PUSH_BUTTONS_BASE, 0x0);
	/* Un-register the IRQ handler by passing a null handler. */
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
	alt_ic_isr_register(PUSH_BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID, BUTTON_PIO_IRQ, NULL, NULL, NULL);
#else
	alt_irq_register( PUSH_BUTTONS_IRQ, NULL, NULL );
#endif
}

/*---------------------------------------------------------------------------------------------
 * static void TestButtons( void )
 * Generates a loop that exits when all buttons/switches have been pressed,
 * at least, once.
 * NOTE:	Buttons/Switches are not debounced.  A single press of a
 * button may result in multiple messages.
 *-------------------------------------------------------------------------------------------*/
void TestButtons( void )
{
	alt_u8 buttons_tested;
	alt_u8 all_tested;
	/* Variable which holds the last value of edge_capture to avoid
	 * "double counting" button/switch presses
	 */
	int last_tested;
	/* Initialize the Buttons/Switches (SW0-SW3) */
	init_button_pio();
	/* Initialize the variables which keep track of which buttons have been tested. */
	buttons_tested = 0x0;
	all_tested = 0xe; // last button is reset

	/* Initialize edge_capture to avoid any "false" triggers from
	 * a previous run.
	 */

	edge_capture = 0;

	/* Set last_tested to a value that edge_capture can never equal
	 * to avoid accidental equalities in the while() loop below.
	 */

	last_tested = 0xffff;

	/* Print a quick message stating what is happening */

	printf("\nA loop will be run until all buttons/switches have been pressed.\n\n");
	printf("\n\tNOTE:  Once a button press has been detected, for a particular button,\n\tany further presses will be ignored!\n\n");

	/* Loop until all buttons have been pressed.
	 * This happens when buttons_tested == all_tested.
	 */

	while (  buttons_tested != all_tested )
	{
		if (last_tested == edge_capture)
		{
			continue;
		}
		else
		{
			last_tested = edge_capture;
			switch (edge_capture)
			{
				case 0x1:
					if (buttons_tested & 0x1)
					{
						continue;
					}
					else
					{
						printf("\nButton 1 (SW0) Pressed.\n");
						buttons_tested = buttons_tested | 0x1;
					}
					break;
				case 0x2:
					if (buttons_tested & 0x2)
					{
						continue;
					}
					else
					{
						printf("\nButton 2 (SW1) Pressed.\n");
						buttons_tested = buttons_tested | 0x2;
					}
					break;
				case 0x4:
					if (buttons_tested & 0x4)
					{
						continue;
					}
					else
					{
						printf("\nButton 3 (SW2) Pressed.\n");
						buttons_tested = buttons_tested | 0x4;
					}
					break;
				case 0x8:
					if (buttons_tested & 0x8)
					{
						continue;
					}
					else
					{
						printf("\nButton 4 (SW3) Pressed.\n");
						buttons_tested = buttons_tested | 0x8;
					}
					break;
			}
		}
	}
	/* Disable the button pio. */
	disable_button_pio();

	printf ("\nAll Buttons (SW0-SW3) were pressed, at least, once.\n");
	usleep(2000000);
	return;
}
#endif

