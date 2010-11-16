/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu_0' in SOPC Builder design 'processor1'
 * SOPC Builder design path: ../../processor1.sopcinfo
 *
 * Generated: Tue Jun 22 18:19:21 EDT 2010
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x1100820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x0
#define NIOS2_CPU_IMPLEMENTATION "fast"
#define NIOS2_DATA_ADDR_WIDTH 25
#define NIOS2_DCACHE_LINE_SIZE 32
#define NIOS2_DCACHE_LINE_SIZE_LOG2 5
#define NIOS2_DCACHE_SIZE 2048
#define NIOS2_EXCEPTION_ADDR 0x800020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 1
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 32
#define NIOS2_ICACHE_LINE_SIZE_LOG2 5
#define NIOS2_ICACHE_SIZE 4096
#define NIOS2_INITDA_SUPPORTED
#define NIOS2_INST_ADDR_WIDTH 25
#define NIOS2_NUM_OF_SHADOW_REG_SETS 0
#define NIOS2_RESET_ADDR 0x800000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_NEW_SDRAM_CONTROLLER
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2
#define __ALTERA_UP_AVALON_AUDIO
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG
#define __ALTERA_UP_AVALON_DE_BOARDS
#define __ALTERA_UP_AVALON_PIXEL_BUFFER
#define __ALTERA_UP_AVALON_SRAM


/*
 * System configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_NAME "cpu_0"
#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x11010d0
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x11010d0
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x11010d0
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "processor1"


/*
 * altera_extended_hal_bsp configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none


/*
 * audio_0 configuration
 *
 */

#define ALT_MODULE_CLASS_audio_0 altera_up_avalon_audio
#define AUDIO_0_BASE 0x11010b0
#define AUDIO_0_IRQ 3
#define AUDIO_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define AUDIO_0_NAME "/dev/audio_0"
#define AUDIO_0_SPAN 16
#define AUDIO_0_TYPE "altera_up_avalon_audio"


/*
 * audio_and_video_config_0 configuration
 *
 */

#define ALT_MODULE_CLASS_audio_and_video_config_0 altera_up_avalon_audio_and_video_config
#define AUDIO_AND_VIDEO_CONFIG_0_BASE 0x1101040
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ -1
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AUDIO_AND_VIDEO_CONFIG_0_NAME "/dev/audio_and_video_config_0"
#define AUDIO_AND_VIDEO_CONFIG_0_SPAN 32
#define AUDIO_AND_VIDEO_CONFIG_0_TYPE "altera_up_avalon_audio_and_video_config"


/*
 * de_boards_0 configuration
 *
 */

#define ALT_MODULE_CLASS_de_boards_0 altera_up_avalon_de_boards
#define DE_BOARDS_0_BASE 0x11010e0
#define DE_BOARDS_0_IRQ -1
#define DE_BOARDS_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DE_BOARDS_0_NAME "/dev/de_boards_0"
#define DE_BOARDS_0_SPAN 4
#define DE_BOARDS_0_TYPE "altera_up_avalon_de_boards"


/*
 * input_packet configuration
 *
 */

#define ALT_MODULE_CLASS_input_packet altera_avalon_pio
#define INPUT_PACKET_BASE 0x11010a0
#define INPUT_PACKET_BIT_CLEARING_EDGE_REGISTER 1
#define INPUT_PACKET_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INPUT_PACKET_CAPTURE 0
#define INPUT_PACKET_DATA_WIDTH 32
#define INPUT_PACKET_DO_TEST_BENCH_WIRING 0
#define INPUT_PACKET_DRIVEN_SIM_VALUE 0x0
#define INPUT_PACKET_EDGE_TYPE "NONE"
#define INPUT_PACKET_FREQ 50000000u
#define INPUT_PACKET_HAS_IN 1
#define INPUT_PACKET_HAS_OUT 0
#define INPUT_PACKET_HAS_TRI 0
#define INPUT_PACKET_IRQ -1
#define INPUT_PACKET_IRQ_INTERRUPT_CONTROLLER_ID -1
#define INPUT_PACKET_IRQ_TYPE "NONE"
#define INPUT_PACKET_NAME "/dev/input_packet"
#define INPUT_PACKET_RESET_VALUE 0x0
#define INPUT_PACKET_SPAN 16
#define INPUT_PACKET_TYPE "altera_avalon_pio"


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x11010d0
#define JTAG_UART_0_IRQ 0
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * lcd_0 configuration
 *
 */

#define ALT_MODULE_CLASS_lcd_0 altera_avalon_lcd_16207
#define LCD_0_BASE 0x1101090
#define LCD_0_IRQ -1
#define LCD_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_0_NAME "/dev/lcd_0"
#define LCD_0_SPAN 16
#define LCD_0_TYPE "altera_avalon_lcd_16207"


/*
 * leds configuration
 *
 */

#define ALT_MODULE_CLASS_leds altera_avalon_pio
#define LEDS_BASE 0x1101060
#define LEDS_BIT_CLEARING_EDGE_REGISTER 0
#define LEDS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define LEDS_CAPTURE 0
#define LEDS_DATA_WIDTH 27
#define LEDS_DO_TEST_BENCH_WIRING 0
#define LEDS_DRIVEN_SIM_VALUE 0x0
#define LEDS_EDGE_TYPE "NONE"
#define LEDS_FREQ 50000000u
#define LEDS_HAS_IN 0
#define LEDS_HAS_OUT 1
#define LEDS_HAS_TRI 0
#define LEDS_IRQ -1
#define LEDS_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LEDS_IRQ_TYPE "NONE"
#define LEDS_NAME "/dev/leds"
#define LEDS_RESET_VALUE 0x0
#define LEDS_SPAN 16
#define LEDS_TYPE "altera_avalon_pio"


/*
 * output_packet configuration
 *
 */

#define ALT_MODULE_CLASS_output_packet altera_avalon_pio
#define OUTPUT_PACKET_BASE 0x1101020
#define OUTPUT_PACKET_BIT_CLEARING_EDGE_REGISTER 0
#define OUTPUT_PACKET_BIT_MODIFYING_OUTPUT_REGISTER 1
#define OUTPUT_PACKET_CAPTURE 0
#define OUTPUT_PACKET_DATA_WIDTH 32
#define OUTPUT_PACKET_DO_TEST_BENCH_WIRING 0
#define OUTPUT_PACKET_DRIVEN_SIM_VALUE 0x0
#define OUTPUT_PACKET_EDGE_TYPE "NONE"
#define OUTPUT_PACKET_FREQ 50000000u
#define OUTPUT_PACKET_HAS_IN 0
#define OUTPUT_PACKET_HAS_OUT 1
#define OUTPUT_PACKET_HAS_TRI 0
#define OUTPUT_PACKET_IRQ -1
#define OUTPUT_PACKET_IRQ_INTERRUPT_CONTROLLER_ID -1
#define OUTPUT_PACKET_IRQ_TYPE "NONE"
#define OUTPUT_PACKET_NAME "/dev/output_packet"
#define OUTPUT_PACKET_RESET_VALUE 0x0
#define OUTPUT_PACKET_SPAN 32
#define OUTPUT_PACKET_TYPE "altera_avalon_pio"


/*
 * pixel_buffer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_pixel_buffer_0 altera_up_avalon_pixel_buffer
#define PIXEL_BUFFER_0_BASE 0x11010c0
#define PIXEL_BUFFER_0_IRQ -1
#define PIXEL_BUFFER_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIXEL_BUFFER_0_NAME "/dev/pixel_buffer_0"
#define PIXEL_BUFFER_0_SPAN 16
#define PIXEL_BUFFER_0_TYPE "altera_up_avalon_pixel_buffer"


/*
 * push_buttons configuration
 *
 */

#define ALT_MODULE_CLASS_push_buttons altera_avalon_pio
#define PUSH_BUTTONS_BASE 0x1101070
#define PUSH_BUTTONS_BIT_CLEARING_EDGE_REGISTER 1
#define PUSH_BUTTONS_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PUSH_BUTTONS_CAPTURE 1
#define PUSH_BUTTONS_DATA_WIDTH 4
#define PUSH_BUTTONS_DO_TEST_BENCH_WIRING 0
#define PUSH_BUTTONS_DRIVEN_SIM_VALUE 0x0
#define PUSH_BUTTONS_EDGE_TYPE "RISING"
#define PUSH_BUTTONS_FREQ 50000000u
#define PUSH_BUTTONS_HAS_IN 1
#define PUSH_BUTTONS_HAS_OUT 0
#define PUSH_BUTTONS_HAS_TRI 0
#define PUSH_BUTTONS_IRQ 1
#define PUSH_BUTTONS_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PUSH_BUTTONS_IRQ_TYPE "EDGE"
#define PUSH_BUTTONS_NAME "/dev/push_buttons"
#define PUSH_BUTTONS_RESET_VALUE 0x0
#define PUSH_BUTTONS_SPAN 16
#define PUSH_BUTTONS_TYPE "altera_avalon_pio"


/*
 * sdram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sdram_0 altera_avalon_new_sdram_controller
#define SDRAM_0_BASE 0x800000
#define SDRAM_0_CAS_LATENCY 3
#define SDRAM_0_CONTENTS_INFO ""
#define SDRAM_0_INIT_NOP_DELAY 0.0
#define SDRAM_0_INIT_REFRESH_COMMANDS 2
#define SDRAM_0_IRQ -1
#define SDRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SDRAM_0_IS_INITIALIZED 1
#define SDRAM_0_NAME "/dev/sdram_0"
#define SDRAM_0_POWERUP_DELAY 100.0
#define SDRAM_0_REFRESH_PERIOD 15.625
#define SDRAM_0_REGISTER_DATA_IN 1
#define SDRAM_0_SDRAM_ADDR_WIDTH 22
#define SDRAM_0_SDRAM_BANK_WIDTH 2
#define SDRAM_0_SDRAM_COL_WIDTH 8
#define SDRAM_0_SDRAM_DATA_WIDTH 16
#define SDRAM_0_SDRAM_NUM_BANKS 4
#define SDRAM_0_SDRAM_NUM_CHIPSELECTS 1
#define SDRAM_0_SDRAM_ROW_WIDTH 12
#define SDRAM_0_SHARED_DATA 0
#define SDRAM_0_SIM_MODEL_BASE 0
#define SDRAM_0_SPAN 8388608
#define SDRAM_0_STARVATION_INDICATOR 0
#define SDRAM_0_TRISTATE_BRIDGE_SLAVE ""
#define SDRAM_0_TYPE "altera_avalon_new_sdram_controller"
#define SDRAM_0_T_AC 5.5
#define SDRAM_0_T_MRD 3
#define SDRAM_0_T_RCD 20.0
#define SDRAM_0_T_RFC 70.0
#define SDRAM_0_T_RP 20.0
#define SDRAM_0_T_WR 14.0


/*
 * sram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sram_0 altera_up_avalon_sram
#define SRAM_0_BASE 0x1080000
#define SRAM_0_IRQ -1
#define SRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SRAM_0_NAME "/dev/sram_0"
#define SRAM_0_SPAN 524288
#define SRAM_0_TYPE "altera_up_avalon_sram"


/*
 * switches configuration
 *
 */

#define ALT_MODULE_CLASS_switches altera_avalon_pio
#define SWITCHES_BASE 0x1101080
#define SWITCHES_BIT_CLEARING_EDGE_REGISTER 0
#define SWITCHES_BIT_MODIFYING_OUTPUT_REGISTER 0
#define SWITCHES_CAPTURE 0
#define SWITCHES_DATA_WIDTH 18
#define SWITCHES_DO_TEST_BENCH_WIRING 0
#define SWITCHES_DRIVEN_SIM_VALUE 0x0
#define SWITCHES_EDGE_TYPE "NONE"
#define SWITCHES_FREQ 50000000u
#define SWITCHES_HAS_IN 1
#define SWITCHES_HAS_OUT 0
#define SWITCHES_HAS_TRI 0
#define SWITCHES_IRQ -1
#define SWITCHES_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SWITCHES_IRQ_TYPE "NONE"
#define SWITCHES_NAME "/dev/switches"
#define SWITCHES_RESET_VALUE 0x0
#define SWITCHES_SPAN 16
#define SWITCHES_TYPE "altera_avalon_pio"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid
#define SYSID_BASE 0x11010d8
#define SYSID_ID 1109322375u
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1277243858u
#define SYSID_TYPE "altera_avalon_sysid"


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x1101000
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000u
#define TIMER_0_IRQ 2
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 49999ULL
#define TIMER_0_MULT 0.0010
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 1000u
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
