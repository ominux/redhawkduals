A few notes:
- To get the buttons working on interrupts, had to make sure that they were edge sensitive buttons with a register capability, and that the C code set them to high.  The DE2 push buttons start high, and therefore edge transition to low.
- Used the Universyt core external clock for the SDRAM
- Used the system_clock coming out of the External clock and fed into nios II core.  This is key to getting SDram working
