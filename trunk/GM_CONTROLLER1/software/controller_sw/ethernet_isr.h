void init_packet_interrupt_isr();
void disable_packet_interrupt();
#ifdef ALT_ENHANCED_INTERRUPT_API_PRESENT
void timer_packet_interrupt_isr(void* context);
#else
void timer_packet_interrupt_isr(void* context, alt_u32 id);
#endif

void get_player_info();

void update_packets_to_send_back(ship_t *ship, int address_start);

