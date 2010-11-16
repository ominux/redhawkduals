//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2010 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_0_avalon_audio_slave_arbitrator (
                                               // inputs:
                                                audio_0_avalon_audio_slave_irq,
                                                audio_0_avalon_audio_slave_readdata,
                                                clk,
                                                cpu_0_data_master_address_to_slave,
                                                cpu_0_data_master_latency_counter,
                                                cpu_0_data_master_read,
                                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                cpu_0_data_master_write,
                                                cpu_0_data_master_writedata,
                                                reset_n,

                                               // outputs:
                                                audio_0_avalon_audio_slave_address,
                                                audio_0_avalon_audio_slave_chipselect,
                                                audio_0_avalon_audio_slave_irq_from_sa,
                                                audio_0_avalon_audio_slave_read,
                                                audio_0_avalon_audio_slave_readdata_from_sa,
                                                audio_0_avalon_audio_slave_reset,
                                                audio_0_avalon_audio_slave_write,
                                                audio_0_avalon_audio_slave_writedata,
                                                cpu_0_data_master_granted_audio_0_avalon_audio_slave,
                                                cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave,
                                                cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave,
                                                cpu_0_data_master_requests_audio_0_avalon_audio_slave,
                                                d1_audio_0_avalon_audio_slave_end_xfer
                                             )
;

  output  [  1: 0] audio_0_avalon_audio_slave_address;
  output           audio_0_avalon_audio_slave_chipselect;
  output           audio_0_avalon_audio_slave_irq_from_sa;
  output           audio_0_avalon_audio_slave_read;
  output  [ 31: 0] audio_0_avalon_audio_slave_readdata_from_sa;
  output           audio_0_avalon_audio_slave_reset;
  output           audio_0_avalon_audio_slave_write;
  output  [ 31: 0] audio_0_avalon_audio_slave_writedata;
  output           cpu_0_data_master_granted_audio_0_avalon_audio_slave;
  output           cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave;
  output           cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave;
  output           cpu_0_data_master_requests_audio_0_avalon_audio_slave;
  output           d1_audio_0_avalon_audio_slave_end_xfer;
  input            audio_0_avalon_audio_slave_irq;
  input   [ 31: 0] audio_0_avalon_audio_slave_readdata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  1: 0] audio_0_avalon_audio_slave_address;
  wire             audio_0_avalon_audio_slave_allgrants;
  wire             audio_0_avalon_audio_slave_allow_new_arb_cycle;
  wire             audio_0_avalon_audio_slave_any_bursting_master_saved_grant;
  wire             audio_0_avalon_audio_slave_any_continuerequest;
  wire             audio_0_avalon_audio_slave_arb_counter_enable;
  reg     [  1: 0] audio_0_avalon_audio_slave_arb_share_counter;
  wire    [  1: 0] audio_0_avalon_audio_slave_arb_share_counter_next_value;
  wire    [  1: 0] audio_0_avalon_audio_slave_arb_share_set_values;
  wire             audio_0_avalon_audio_slave_beginbursttransfer_internal;
  wire             audio_0_avalon_audio_slave_begins_xfer;
  wire             audio_0_avalon_audio_slave_chipselect;
  wire             audio_0_avalon_audio_slave_end_xfer;
  wire             audio_0_avalon_audio_slave_firsttransfer;
  wire             audio_0_avalon_audio_slave_grant_vector;
  wire             audio_0_avalon_audio_slave_in_a_read_cycle;
  wire             audio_0_avalon_audio_slave_in_a_write_cycle;
  wire             audio_0_avalon_audio_slave_irq_from_sa;
  wire             audio_0_avalon_audio_slave_master_qreq_vector;
  wire             audio_0_avalon_audio_slave_non_bursting_master_requests;
  wire             audio_0_avalon_audio_slave_read;
  wire    [ 31: 0] audio_0_avalon_audio_slave_readdata_from_sa;
  reg              audio_0_avalon_audio_slave_reg_firsttransfer;
  wire             audio_0_avalon_audio_slave_reset;
  reg              audio_0_avalon_audio_slave_slavearbiterlockenable;
  wire             audio_0_avalon_audio_slave_slavearbiterlockenable2;
  wire             audio_0_avalon_audio_slave_unreg_firsttransfer;
  wire             audio_0_avalon_audio_slave_waits_for_read;
  wire             audio_0_avalon_audio_slave_waits_for_write;
  wire             audio_0_avalon_audio_slave_write;
  wire    [ 31: 0] audio_0_avalon_audio_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave;
  reg              cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register_in;
  wire             cpu_0_data_master_requests_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_saved_grant_audio_0_avalon_audio_slave;
  reg              d1_audio_0_avalon_audio_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register;
  wire    [ 24: 0] shifted_address_to_audio_0_avalon_audio_slave_from_cpu_0_data_master;
  wire             wait_for_audio_0_avalon_audio_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_0_avalon_audio_slave_end_xfer;
    end


  assign audio_0_avalon_audio_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave));
  //assign audio_0_avalon_audio_slave_readdata_from_sa = audio_0_avalon_audio_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_0_avalon_audio_slave_readdata_from_sa = audio_0_avalon_audio_slave_readdata;

  assign cpu_0_data_master_requests_audio_0_avalon_audio_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h11010b0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //audio_0_avalon_audio_slave_arb_share_counter set values, which is an e_mux
  assign audio_0_avalon_audio_slave_arb_share_set_values = 1;

  //audio_0_avalon_audio_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_0_avalon_audio_slave_non_bursting_master_requests = cpu_0_data_master_requests_audio_0_avalon_audio_slave;

  //audio_0_avalon_audio_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign audio_0_avalon_audio_slave_any_bursting_master_saved_grant = 0;

  //audio_0_avalon_audio_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign audio_0_avalon_audio_slave_arb_share_counter_next_value = audio_0_avalon_audio_slave_firsttransfer ? (audio_0_avalon_audio_slave_arb_share_set_values - 1) : |audio_0_avalon_audio_slave_arb_share_counter ? (audio_0_avalon_audio_slave_arb_share_counter - 1) : 0;

  //audio_0_avalon_audio_slave_allgrants all slave grants, which is an e_mux
  assign audio_0_avalon_audio_slave_allgrants = |audio_0_avalon_audio_slave_grant_vector;

  //audio_0_avalon_audio_slave_end_xfer assignment, which is an e_assign
  assign audio_0_avalon_audio_slave_end_xfer = ~(audio_0_avalon_audio_slave_waits_for_read | audio_0_avalon_audio_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave = audio_0_avalon_audio_slave_end_xfer & (~audio_0_avalon_audio_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //audio_0_avalon_audio_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign audio_0_avalon_audio_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave & audio_0_avalon_audio_slave_allgrants) | (end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave & ~audio_0_avalon_audio_slave_non_bursting_master_requests);

  //audio_0_avalon_audio_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_0_avalon_audio_slave_arb_share_counter <= 0;
      else if (audio_0_avalon_audio_slave_arb_counter_enable)
          audio_0_avalon_audio_slave_arb_share_counter <= audio_0_avalon_audio_slave_arb_share_counter_next_value;
    end


  //audio_0_avalon_audio_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_0_avalon_audio_slave_slavearbiterlockenable <= 0;
      else if ((|audio_0_avalon_audio_slave_master_qreq_vector & end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave) | (end_xfer_arb_share_counter_term_audio_0_avalon_audio_slave & ~audio_0_avalon_audio_slave_non_bursting_master_requests))
          audio_0_avalon_audio_slave_slavearbiterlockenable <= |audio_0_avalon_audio_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master audio_0/avalon_audio_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = audio_0_avalon_audio_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //audio_0_avalon_audio_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_0_avalon_audio_slave_slavearbiterlockenable2 = |audio_0_avalon_audio_slave_arb_share_counter_next_value;

  //cpu_0/data_master audio_0/avalon_audio_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = audio_0_avalon_audio_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //audio_0_avalon_audio_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_0_avalon_audio_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave = cpu_0_data_master_requests_audio_0_avalon_audio_slave & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register_in = cpu_0_data_master_granted_audio_0_avalon_audio_slave & cpu_0_data_master_read & ~audio_0_avalon_audio_slave_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register = {cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register, cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave = cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave_shift_register;

  //audio_0_avalon_audio_slave_writedata mux, which is an e_mux
  assign audio_0_avalon_audio_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_audio_0_avalon_audio_slave = cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave;

  //cpu_0/data_master saved-grant audio_0/avalon_audio_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_audio_0_avalon_audio_slave = cpu_0_data_master_requests_audio_0_avalon_audio_slave;

  //allow new arb cycle for audio_0/avalon_audio_slave, which is an e_assign
  assign audio_0_avalon_audio_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign audio_0_avalon_audio_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign audio_0_avalon_audio_slave_master_qreq_vector = 1;

  //~audio_0_avalon_audio_slave_reset assignment, which is an e_assign
  assign audio_0_avalon_audio_slave_reset = ~reset_n;

  assign audio_0_avalon_audio_slave_chipselect = cpu_0_data_master_granted_audio_0_avalon_audio_slave;
  //audio_0_avalon_audio_slave_firsttransfer first transaction, which is an e_assign
  assign audio_0_avalon_audio_slave_firsttransfer = audio_0_avalon_audio_slave_begins_xfer ? audio_0_avalon_audio_slave_unreg_firsttransfer : audio_0_avalon_audio_slave_reg_firsttransfer;

  //audio_0_avalon_audio_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign audio_0_avalon_audio_slave_unreg_firsttransfer = ~(audio_0_avalon_audio_slave_slavearbiterlockenable & audio_0_avalon_audio_slave_any_continuerequest);

  //audio_0_avalon_audio_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_0_avalon_audio_slave_reg_firsttransfer <= 1'b1;
      else if (audio_0_avalon_audio_slave_begins_xfer)
          audio_0_avalon_audio_slave_reg_firsttransfer <= audio_0_avalon_audio_slave_unreg_firsttransfer;
    end


  //audio_0_avalon_audio_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign audio_0_avalon_audio_slave_beginbursttransfer_internal = audio_0_avalon_audio_slave_begins_xfer;

  //audio_0_avalon_audio_slave_read assignment, which is an e_mux
  assign audio_0_avalon_audio_slave_read = cpu_0_data_master_granted_audio_0_avalon_audio_slave & cpu_0_data_master_read;

  //audio_0_avalon_audio_slave_write assignment, which is an e_mux
  assign audio_0_avalon_audio_slave_write = cpu_0_data_master_granted_audio_0_avalon_audio_slave & cpu_0_data_master_write;

  assign shifted_address_to_audio_0_avalon_audio_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //audio_0_avalon_audio_slave_address mux, which is an e_mux
  assign audio_0_avalon_audio_slave_address = shifted_address_to_audio_0_avalon_audio_slave_from_cpu_0_data_master >> 2;

  //d1_audio_0_avalon_audio_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_audio_0_avalon_audio_slave_end_xfer <= 1;
      else 
        d1_audio_0_avalon_audio_slave_end_xfer <= audio_0_avalon_audio_slave_end_xfer;
    end


  //audio_0_avalon_audio_slave_waits_for_read in a cycle, which is an e_mux
  assign audio_0_avalon_audio_slave_waits_for_read = audio_0_avalon_audio_slave_in_a_read_cycle & 0;

  //audio_0_avalon_audio_slave_in_a_read_cycle assignment, which is an e_assign
  assign audio_0_avalon_audio_slave_in_a_read_cycle = cpu_0_data_master_granted_audio_0_avalon_audio_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_0_avalon_audio_slave_in_a_read_cycle;

  //audio_0_avalon_audio_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_0_avalon_audio_slave_waits_for_write = audio_0_avalon_audio_slave_in_a_write_cycle & 0;

  //audio_0_avalon_audio_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_0_avalon_audio_slave_in_a_write_cycle = cpu_0_data_master_granted_audio_0_avalon_audio_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_0_avalon_audio_slave_in_a_write_cycle;

  assign wait_for_audio_0_avalon_audio_slave_counter = 0;
  //assign audio_0_avalon_audio_slave_irq_from_sa = audio_0_avalon_audio_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_0_avalon_audio_slave_irq_from_sa = audio_0_avalon_audio_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //audio_0/avalon_audio_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module audio_and_video_config_0_avalon_on_board_config_slave_arbitrator (
                                                                          // inputs:
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_readdata,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_waitrequest,
                                                                           clk,
                                                                           cpu_0_data_master_address_to_slave,
                                                                           cpu_0_data_master_byteenable,
                                                                           cpu_0_data_master_latency_counter,
                                                                           cpu_0_data_master_read,
                                                                           cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                                           cpu_0_data_master_write,
                                                                           cpu_0_data_master_writedata,
                                                                           reset_n,

                                                                          // outputs:
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_address,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_byteenable,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_chipselect,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_read,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_reset,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_write,
                                                                           audio_and_video_config_0_avalon_on_board_config_slave_writedata,
                                                                           cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave,
                                                                           cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave,
                                                                           cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave,
                                                                           cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave,
                                                                           d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer
                                                                        )
;

  output  [  2: 0] audio_and_video_config_0_avalon_on_board_config_slave_address;
  output  [  3: 0] audio_and_video_config_0_avalon_on_board_config_slave_byteenable;
  output           audio_and_video_config_0_avalon_on_board_config_slave_chipselect;
  output           audio_and_video_config_0_avalon_on_board_config_slave_read;
  output  [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa;
  output           audio_and_video_config_0_avalon_on_board_config_slave_reset;
  output           audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;
  output           audio_and_video_config_0_avalon_on_board_config_slave_write;
  output  [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_writedata;
  output           cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave;
  output           cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave;
  output           cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave;
  output           cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;
  output           d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
  input   [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata;
  input            audio_and_video_config_0_avalon_on_board_config_slave_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;

  wire    [  2: 0] audio_and_video_config_0_avalon_on_board_config_slave_address;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_allgrants;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_allow_new_arb_cycle;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_any_bursting_master_saved_grant;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_any_continuerequest;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_arb_counter_enable;
  reg     [  1: 0] audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter;
  wire    [  1: 0] audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value;
  wire    [  1: 0] audio_and_video_config_0_avalon_on_board_config_slave_arb_share_set_values;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_beginbursttransfer_internal;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_begins_xfer;
  wire    [  3: 0] audio_and_video_config_0_avalon_on_board_config_slave_byteenable;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_chipselect;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_firsttransfer;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_grant_vector;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_in_a_read_cycle;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_in_a_write_cycle;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_master_qreq_vector;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_non_bursting_master_requests;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_read;
  wire    [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa;
  reg              audio_and_video_config_0_avalon_on_board_config_slave_reg_firsttransfer;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_reset;
  reg              audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable2;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_unreg_firsttransfer;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_waits_for_read;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_waits_for_write;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_write;
  wire    [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_writedata;
  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave;
  reg              cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register_in;
  wire             cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_saved_grant_audio_and_video_config_0_avalon_on_board_config_slave;
  reg              d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register;
  wire    [ 24: 0] shifted_address_to_audio_and_video_config_0_avalon_on_board_config_slave_from_cpu_0_data_master;
  wire             wait_for_audio_and_video_config_0_avalon_on_board_config_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
    end


  assign audio_and_video_config_0_avalon_on_board_config_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave));
  //assign audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_on_board_config_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa = audio_and_video_config_0_avalon_on_board_config_slave_readdata;

  assign cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1101040) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_on_board_config_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa = audio_and_video_config_0_avalon_on_board_config_slave_waitrequest;

  //audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter set values, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_arb_share_set_values = 1;

  //audio_and_video_config_0_avalon_on_board_config_slave_non_bursting_master_requests mux, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_non_bursting_master_requests = cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;

  //audio_and_video_config_0_avalon_on_board_config_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_any_bursting_master_saved_grant = 0;

  //audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value = audio_and_video_config_0_avalon_on_board_config_slave_firsttransfer ? (audio_and_video_config_0_avalon_on_board_config_slave_arb_share_set_values - 1) : |audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter ? (audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter - 1) : 0;

  //audio_and_video_config_0_avalon_on_board_config_slave_allgrants all slave grants, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_allgrants = |audio_and_video_config_0_avalon_on_board_config_slave_grant_vector;

  //audio_and_video_config_0_avalon_on_board_config_slave_end_xfer assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_end_xfer = ~(audio_and_video_config_0_avalon_on_board_config_slave_waits_for_read | audio_and_video_config_0_avalon_on_board_config_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave = audio_and_video_config_0_avalon_on_board_config_slave_end_xfer & (~audio_and_video_config_0_avalon_on_board_config_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave & audio_and_video_config_0_avalon_on_board_config_slave_allgrants) | (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave & ~audio_and_video_config_0_avalon_on_board_config_slave_non_bursting_master_requests);

  //audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter <= 0;
      else if (audio_and_video_config_0_avalon_on_board_config_slave_arb_counter_enable)
          audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter <= audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value;
    end


  //audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable <= 0;
      else if ((|audio_and_video_config_0_avalon_on_board_config_slave_master_qreq_vector & end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave) | (end_xfer_arb_share_counter_term_audio_and_video_config_0_avalon_on_board_config_slave & ~audio_and_video_config_0_avalon_on_board_config_slave_non_bursting_master_requests))
          audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable <= |audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master audio_and_video_config_0/avalon_on_board_config_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable2 = |audio_and_video_config_0_avalon_on_board_config_slave_arb_share_counter_next_value;

  //cpu_0/data_master audio_and_video_config_0/avalon_on_board_config_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //audio_and_video_config_0_avalon_on_board_config_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave = cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register_in = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave & cpu_0_data_master_read & ~audio_and_video_config_0_avalon_on_board_config_slave_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register = {cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register, cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave = cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave_shift_register;

  //audio_and_video_config_0_avalon_on_board_config_slave_writedata mux, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave = cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave;

  //cpu_0/data_master saved-grant audio_and_video_config_0/avalon_on_board_config_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_audio_and_video_config_0_avalon_on_board_config_slave = cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;

  //allow new arb cycle for audio_and_video_config_0/avalon_on_board_config_slave, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign audio_and_video_config_0_avalon_on_board_config_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign audio_and_video_config_0_avalon_on_board_config_slave_master_qreq_vector = 1;

  //~audio_and_video_config_0_avalon_on_board_config_slave_reset assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_reset = ~reset_n;

  assign audio_and_video_config_0_avalon_on_board_config_slave_chipselect = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave;
  //audio_and_video_config_0_avalon_on_board_config_slave_firsttransfer first transaction, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_firsttransfer = audio_and_video_config_0_avalon_on_board_config_slave_begins_xfer ? audio_and_video_config_0_avalon_on_board_config_slave_unreg_firsttransfer : audio_and_video_config_0_avalon_on_board_config_slave_reg_firsttransfer;

  //audio_and_video_config_0_avalon_on_board_config_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_unreg_firsttransfer = ~(audio_and_video_config_0_avalon_on_board_config_slave_slavearbiterlockenable & audio_and_video_config_0_avalon_on_board_config_slave_any_continuerequest);

  //audio_and_video_config_0_avalon_on_board_config_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          audio_and_video_config_0_avalon_on_board_config_slave_reg_firsttransfer <= 1'b1;
      else if (audio_and_video_config_0_avalon_on_board_config_slave_begins_xfer)
          audio_and_video_config_0_avalon_on_board_config_slave_reg_firsttransfer <= audio_and_video_config_0_avalon_on_board_config_slave_unreg_firsttransfer;
    end


  //audio_and_video_config_0_avalon_on_board_config_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_beginbursttransfer_internal = audio_and_video_config_0_avalon_on_board_config_slave_begins_xfer;

  //audio_and_video_config_0_avalon_on_board_config_slave_read assignment, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_read = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave & cpu_0_data_master_read;

  //audio_and_video_config_0_avalon_on_board_config_slave_write assignment, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_write = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave & cpu_0_data_master_write;

  assign shifted_address_to_audio_and_video_config_0_avalon_on_board_config_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //audio_and_video_config_0_avalon_on_board_config_slave_address mux, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_address = shifted_address_to_audio_and_video_config_0_avalon_on_board_config_slave_from_cpu_0_data_master >> 2;

  //d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer <= 1;
      else 
        d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer <= audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
    end


  //audio_and_video_config_0_avalon_on_board_config_slave_waits_for_read in a cycle, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_waits_for_read = audio_and_video_config_0_avalon_on_board_config_slave_in_a_read_cycle & audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;

  //audio_and_video_config_0_avalon_on_board_config_slave_in_a_read_cycle assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_in_a_read_cycle = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = audio_and_video_config_0_avalon_on_board_config_slave_in_a_read_cycle;

  //audio_and_video_config_0_avalon_on_board_config_slave_waits_for_write in a cycle, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_waits_for_write = audio_and_video_config_0_avalon_on_board_config_slave_in_a_write_cycle & audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;

  //audio_and_video_config_0_avalon_on_board_config_slave_in_a_write_cycle assignment, which is an e_assign
  assign audio_and_video_config_0_avalon_on_board_config_slave_in_a_write_cycle = cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = audio_and_video_config_0_avalon_on_board_config_slave_in_a_write_cycle;

  assign wait_for_audio_and_video_config_0_avalon_on_board_config_slave_counter = 0;
  //audio_and_video_config_0_avalon_on_board_config_slave_byteenable byte enable port mux, which is an e_mux
  assign audio_and_video_config_0_avalon_on_board_config_slave_byteenable = (cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //audio_and_video_config_0/avalon_on_board_config_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_jtag_debug_module_arbitrator (
                                            // inputs:
                                             clk,
                                             cpu_0_data_master_address_to_slave,
                                             cpu_0_data_master_byteenable,
                                             cpu_0_data_master_debugaccess,
                                             cpu_0_data_master_latency_counter,
                                             cpu_0_data_master_read,
                                             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                             cpu_0_data_master_write,
                                             cpu_0_data_master_writedata,
                                             cpu_0_instruction_master_address_to_slave,
                                             cpu_0_instruction_master_latency_counter,
                                             cpu_0_instruction_master_read,
                                             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                             cpu_0_jtag_debug_module_readdata,
                                             cpu_0_jtag_debug_module_resetrequest,
                                             reset_n,

                                            // outputs:
                                             cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                             cpu_0_jtag_debug_module_address,
                                             cpu_0_jtag_debug_module_begintransfer,
                                             cpu_0_jtag_debug_module_byteenable,
                                             cpu_0_jtag_debug_module_chipselect,
                                             cpu_0_jtag_debug_module_debugaccess,
                                             cpu_0_jtag_debug_module_readdata_from_sa,
                                             cpu_0_jtag_debug_module_reset_n,
                                             cpu_0_jtag_debug_module_resetrequest_from_sa,
                                             cpu_0_jtag_debug_module_write,
                                             cpu_0_jtag_debug_module_writedata,
                                             d1_cpu_0_jtag_debug_module_end_xfer
                                          )
;

  output           cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  output           cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  output  [  8: 0] cpu_0_jtag_debug_module_address;
  output           cpu_0_jtag_debug_module_begintransfer;
  output  [  3: 0] cpu_0_jtag_debug_module_byteenable;
  output           cpu_0_jtag_debug_module_chipselect;
  output           cpu_0_jtag_debug_module_debugaccess;
  output  [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  output           cpu_0_jtag_debug_module_reset_n;
  output           cpu_0_jtag_debug_module_resetrequest_from_sa;
  output           cpu_0_jtag_debug_module_write;
  output  [ 31: 0] cpu_0_jtag_debug_module_writedata;
  output           d1_cpu_0_jtag_debug_module_end_xfer;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_debugaccess;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata;
  input            cpu_0_jtag_debug_module_resetrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_allgrants;
  wire             cpu_0_jtag_debug_module_allow_new_arb_cycle;
  wire             cpu_0_jtag_debug_module_any_bursting_master_saved_grant;
  wire             cpu_0_jtag_debug_module_any_continuerequest;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_addend;
  wire             cpu_0_jtag_debug_module_arb_counter_enable;
  reg     [  1: 0] cpu_0_jtag_debug_module_arb_share_counter;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_counter_next_value;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_share_set_values;
  wire    [  1: 0] cpu_0_jtag_debug_module_arb_winner;
  wire             cpu_0_jtag_debug_module_arbitration_holdoff_internal;
  wire             cpu_0_jtag_debug_module_beginbursttransfer_internal;
  wire             cpu_0_jtag_debug_module_begins_xfer;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire    [  3: 0] cpu_0_jtag_debug_module_chosen_master_double_vector;
  wire    [  1: 0] cpu_0_jtag_debug_module_chosen_master_rot_left;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire             cpu_0_jtag_debug_module_end_xfer;
  wire             cpu_0_jtag_debug_module_firsttransfer;
  wire    [  1: 0] cpu_0_jtag_debug_module_grant_vector;
  wire             cpu_0_jtag_debug_module_in_a_read_cycle;
  wire             cpu_0_jtag_debug_module_in_a_write_cycle;
  wire    [  1: 0] cpu_0_jtag_debug_module_master_qreq_vector;
  wire             cpu_0_jtag_debug_module_non_bursting_master_requests;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  reg              cpu_0_jtag_debug_module_reg_firsttransfer;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  reg     [  1: 0] cpu_0_jtag_debug_module_saved_chosen_master_vector;
  reg              cpu_0_jtag_debug_module_slavearbiterlockenable;
  wire             cpu_0_jtag_debug_module_slavearbiterlockenable2;
  wire             cpu_0_jtag_debug_module_unreg_firsttransfer;
  wire             cpu_0_jtag_debug_module_waits_for_read;
  wire             cpu_0_jtag_debug_module_waits_for_write;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  reg              d1_cpu_0_jtag_debug_module_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master;
  wire             wait_for_cpu_0_jtag_debug_module_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~cpu_0_jtag_debug_module_end_xfer;
    end


  assign cpu_0_jtag_debug_module_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  //assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata;

  assign cpu_0_data_master_requests_cpu_0_jtag_debug_module = ({cpu_0_data_master_address_to_slave[24 : 11] , 11'b0} == 25'h1100800) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  assign cpu_0_jtag_debug_module_arb_share_set_values = 1;

  //cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  assign cpu_0_jtag_debug_module_non_bursting_master_requests = cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module |
    cpu_0_data_master_requests_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  assign cpu_0_jtag_debug_module_any_bursting_master_saved_grant = 0;

  //cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_share_counter_next_value = cpu_0_jtag_debug_module_firsttransfer ? (cpu_0_jtag_debug_module_arb_share_set_values - 1) : |cpu_0_jtag_debug_module_arb_share_counter ? (cpu_0_jtag_debug_module_arb_share_counter - 1) : 0;

  //cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  assign cpu_0_jtag_debug_module_allgrants = (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector) |
    (|cpu_0_jtag_debug_module_grant_vector);

  //cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_end_xfer = ~(cpu_0_jtag_debug_module_waits_for_read | cpu_0_jtag_debug_module_waits_for_write);

  //end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_end_xfer & (~cpu_0_jtag_debug_module_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  assign cpu_0_jtag_debug_module_arb_counter_enable = (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & cpu_0_jtag_debug_module_allgrants) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests);

  //cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_share_counter <= 0;
      else if (cpu_0_jtag_debug_module_arb_counter_enable)
          cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_slavearbiterlockenable <= 0;
      else if ((|cpu_0_jtag_debug_module_master_qreq_vector & end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module) | (end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module & ~cpu_0_jtag_debug_module_non_bursting_master_requests))
          cpu_0_jtag_debug_module_slavearbiterlockenable <= |cpu_0_jtag_debug_module_arb_share_counter_next_value;
    end


  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign cpu_0_jtag_debug_module_slavearbiterlockenable2 = |cpu_0_jtag_debug_module_arb_share_counter_next_value;

  //cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = cpu_0_jtag_debug_module_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  assign cpu_0_jtag_debug_module_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_data_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_instruction_master_arbiterlock);
  //local readdatavalid cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  assign cpu_0_jtag_debug_module_writedata = cpu_0_data_master_writedata;

  assign cpu_0_instruction_master_requests_cpu_0_jtag_debug_module = (({cpu_0_instruction_master_address_to_slave[24 : 11] , 11'b0} == 25'h1100800) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module ? 1 : (cpu_0_jtag_debug_module_arbitration_holdoff_internal | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) ? 0 : last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module & cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  assign cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module = cpu_0_instruction_master_requests_cpu_0_jtag_debug_module & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //local readdatavalid cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read & ~cpu_0_jtag_debug_module_waits_for_read;

  //allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[0];

  //cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[0] && cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_jtag_debug_module_master_qreq_vector[1] = cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;

  //cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_granted_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_grant_vector[1];

  //cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  assign cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module = cpu_0_jtag_debug_module_arb_winner[1] && cpu_0_data_master_requests_cpu_0_jtag_debug_module;

  //cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_double_vector = {cpu_0_jtag_debug_module_master_qreq_vector, cpu_0_jtag_debug_module_master_qreq_vector} & ({~cpu_0_jtag_debug_module_master_qreq_vector, ~cpu_0_jtag_debug_module_master_qreq_vector} + cpu_0_jtag_debug_module_arb_addend);

  //stable onehot encoding of arb winner
  assign cpu_0_jtag_debug_module_arb_winner = (cpu_0_jtag_debug_module_allow_new_arb_cycle & | cpu_0_jtag_debug_module_grant_vector) ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;

  //saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= 0;
      else if (cpu_0_jtag_debug_module_allow_new_arb_cycle)
          cpu_0_jtag_debug_module_saved_chosen_master_vector <= |cpu_0_jtag_debug_module_grant_vector ? cpu_0_jtag_debug_module_grant_vector : cpu_0_jtag_debug_module_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign cpu_0_jtag_debug_module_grant_vector = {(cpu_0_jtag_debug_module_chosen_master_double_vector[1] | cpu_0_jtag_debug_module_chosen_master_double_vector[3]),
    (cpu_0_jtag_debug_module_chosen_master_double_vector[0] | cpu_0_jtag_debug_module_chosen_master_double_vector[2])};

  //cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  assign cpu_0_jtag_debug_module_chosen_master_rot_left = (cpu_0_jtag_debug_module_arb_winner << 1) ? (cpu_0_jtag_debug_module_arb_winner << 1) : 1;

  //cpu_0/jtag_debug_module's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_arb_addend <= 1;
      else if (|cpu_0_jtag_debug_module_grant_vector)
          cpu_0_jtag_debug_module_arb_addend <= cpu_0_jtag_debug_module_end_xfer? cpu_0_jtag_debug_module_chosen_master_rot_left : cpu_0_jtag_debug_module_grant_vector;
    end


  assign cpu_0_jtag_debug_module_begintransfer = cpu_0_jtag_debug_module_begins_xfer;
  //cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_reset_n = reset_n;

  //assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest;

  assign cpu_0_jtag_debug_module_chipselect = cpu_0_data_master_granted_cpu_0_jtag_debug_module | cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  //cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_firsttransfer = cpu_0_jtag_debug_module_begins_xfer ? cpu_0_jtag_debug_module_unreg_firsttransfer : cpu_0_jtag_debug_module_reg_firsttransfer;

  //cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  assign cpu_0_jtag_debug_module_unreg_firsttransfer = ~(cpu_0_jtag_debug_module_slavearbiterlockenable & cpu_0_jtag_debug_module_any_continuerequest);

  //cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_jtag_debug_module_reg_firsttransfer <= 1'b1;
      else if (cpu_0_jtag_debug_module_begins_xfer)
          cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
    end


  //cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign cpu_0_jtag_debug_module_beginbursttransfer_internal = cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign cpu_0_jtag_debug_module_arbitration_holdoff_internal = cpu_0_jtag_debug_module_begins_xfer & cpu_0_jtag_debug_module_firsttransfer;

  //cpu_0_jtag_debug_module_write assignment, which is an e_mux
  assign cpu_0_jtag_debug_module_write = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //cpu_0_jtag_debug_module_address mux, which is an e_mux
  assign cpu_0_jtag_debug_module_address = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master >> 2) :
    (shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_cpu_0_jtag_debug_module_end_xfer <= 1;
      else 
        d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end


  //cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_read = cpu_0_jtag_debug_module_in_a_read_cycle & cpu_0_jtag_debug_module_begins_xfer;

  //cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_read_cycle = (cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = cpu_0_jtag_debug_module_in_a_read_cycle;

  //cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  assign cpu_0_jtag_debug_module_waits_for_write = cpu_0_jtag_debug_module_in_a_write_cycle & 0;

  //cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  assign cpu_0_jtag_debug_module_in_a_write_cycle = cpu_0_data_master_granted_cpu_0_jtag_debug_module & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = cpu_0_jtag_debug_module_in_a_write_cycle;

  assign wait_for_cpu_0_jtag_debug_module_counter = 0;
  //cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  assign cpu_0_jtag_debug_module_byteenable = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_byteenable :
    -1;

  //debugaccess mux, which is an e_mux
  assign cpu_0_jtag_debug_module_debugaccess = (cpu_0_data_master_granted_cpu_0_jtag_debug_module)? cpu_0_data_master_debugaccess :
    0;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_cpu_0_jtag_debug_module + cpu_0_instruction_master_granted_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module + cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       audio_0_avalon_audio_slave_irq_from_sa,
                                       audio_0_avalon_audio_slave_readdata_from_sa,
                                       audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa,
                                       audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa,
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_byteenable,
                                       cpu_0_data_master_byteenable_sdram_0_s1,
                                       cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_granted_audio_0_avalon_audio_slave,
                                       cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave,
                                       cpu_0_data_master_granted_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave,
                                       cpu_0_data_master_granted_input_packet_s1,
                                       cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_granted_lcd_0_control_slave,
                                       cpu_0_data_master_granted_leds_s1,
                                       cpu_0_data_master_granted_output_packet_s1,
                                       cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave,
                                       cpu_0_data_master_granted_push_buttons_s1,
                                       cpu_0_data_master_granted_sdram_0_s1,
                                       cpu_0_data_master_granted_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_granted_switches_s1,
                                       cpu_0_data_master_granted_sysid_control_slave,
                                       cpu_0_data_master_granted_timer_0_s1,
                                       cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave,
                                       cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave,
                                       cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave,
                                       cpu_0_data_master_qualified_request_input_packet_s1,
                                       cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_qualified_request_lcd_0_control_slave,
                                       cpu_0_data_master_qualified_request_leds_s1,
                                       cpu_0_data_master_qualified_request_output_packet_s1,
                                       cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave,
                                       cpu_0_data_master_qualified_request_push_buttons_s1,
                                       cpu_0_data_master_qualified_request_sdram_0_s1,
                                       cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_qualified_request_switches_s1,
                                       cpu_0_data_master_qualified_request_sysid_control_slave,
                                       cpu_0_data_master_qualified_request_timer_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave,
                                       cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave,
                                       cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave,
                                       cpu_0_data_master_read_data_valid_input_packet_s1,
                                       cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_read_data_valid_lcd_0_control_slave,
                                       cpu_0_data_master_read_data_valid_leds_s1,
                                       cpu_0_data_master_read_data_valid_output_packet_s1,
                                       cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave,
                                       cpu_0_data_master_read_data_valid_push_buttons_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1,
                                       cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                       cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_read_data_valid_switches_s1,
                                       cpu_0_data_master_read_data_valid_sysid_control_slave,
                                       cpu_0_data_master_read_data_valid_timer_0_s1,
                                       cpu_0_data_master_requests_audio_0_avalon_audio_slave,
                                       cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave,
                                       cpu_0_data_master_requests_cpu_0_jtag_debug_module,
                                       cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave,
                                       cpu_0_data_master_requests_input_packet_s1,
                                       cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                       cpu_0_data_master_requests_lcd_0_control_slave,
                                       cpu_0_data_master_requests_leds_s1,
                                       cpu_0_data_master_requests_output_packet_s1,
                                       cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave,
                                       cpu_0_data_master_requests_push_buttons_s1,
                                       cpu_0_data_master_requests_sdram_0_s1,
                                       cpu_0_data_master_requests_sram_0_avalon_sram_slave,
                                       cpu_0_data_master_requests_switches_s1,
                                       cpu_0_data_master_requests_sysid_control_slave,
                                       cpu_0_data_master_requests_timer_0_s1,
                                       cpu_0_data_master_write,
                                       cpu_0_data_master_writedata,
                                       cpu_0_jtag_debug_module_readdata_from_sa,
                                       d1_audio_0_avalon_audio_slave_end_xfer,
                                       d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer,
                                       d1_cpu_0_jtag_debug_module_end_xfer,
                                       d1_de_boards_0_avalon_external_clocks_slave_end_xfer,
                                       d1_input_packet_s1_end_xfer,
                                       d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                       d1_lcd_0_control_slave_end_xfer,
                                       d1_leds_s1_end_xfer,
                                       d1_output_packet_s1_end_xfer,
                                       d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer,
                                       d1_push_buttons_s1_end_xfer,
                                       d1_sdram_0_s1_end_xfer,
                                       d1_sram_0_avalon_sram_slave_end_xfer,
                                       d1_switches_s1_end_xfer,
                                       d1_sysid_control_slave_end_xfer,
                                       d1_timer_0_s1_end_xfer,
                                       de_boards_0_avalon_external_clocks_slave_readdata_from_sa,
                                       input_packet_s1_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                       jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                       lcd_0_control_slave_readdata_from_sa,
                                       lcd_0_control_slave_wait_counter_eq_0,
                                       leds_s1_readdata_from_sa,
                                       output_packet_s1_readdata_from_sa,
                                       pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa,
                                       push_buttons_s1_irq_from_sa,
                                       push_buttons_s1_readdata_from_sa,
                                       reset_n,
                                       sdram_0_s1_readdata_from_sa,
                                       sdram_0_s1_waitrequest_from_sa,
                                       sram_0_avalon_sram_slave_readdata_from_sa,
                                       switches_s1_readdata_from_sa,
                                       sysid_control_slave_readdata_from_sa,
                                       timer_0_s1_irq_from_sa,
                                       timer_0_s1_readdata_from_sa,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_dbs_address,
                                       cpu_0_data_master_dbs_write_16,
                                       cpu_0_data_master_irq,
                                       cpu_0_data_master_latency_counter,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_readdatavalid,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 24: 0] cpu_0_data_master_address_to_slave;
  output  [  1: 0] cpu_0_data_master_dbs_address;
  output  [ 15: 0] cpu_0_data_master_dbs_write_16;
  output  [ 31: 0] cpu_0_data_master_irq;
  output  [  1: 0] cpu_0_data_master_latency_counter;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_readdatavalid;
  output           cpu_0_data_master_waitrequest;
  input            audio_0_avalon_audio_slave_irq_from_sa;
  input   [ 31: 0] audio_0_avalon_audio_slave_readdata_from_sa;
  input   [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa;
  input            audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  input   [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_granted_audio_0_avalon_audio_slave;
  input            cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave;
  input            cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave;
  input            cpu_0_data_master_granted_input_packet_s1;
  input            cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_granted_lcd_0_control_slave;
  input            cpu_0_data_master_granted_leds_s1;
  input            cpu_0_data_master_granted_output_packet_s1;
  input            cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave;
  input            cpu_0_data_master_granted_push_buttons_s1;
  input            cpu_0_data_master_granted_sdram_0_s1;
  input            cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_granted_switches_s1;
  input            cpu_0_data_master_granted_sysid_control_slave;
  input            cpu_0_data_master_granted_timer_0_s1;
  input            cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave;
  input            cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave;
  input            cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave;
  input            cpu_0_data_master_qualified_request_input_packet_s1;
  input            cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_qualified_request_lcd_0_control_slave;
  input            cpu_0_data_master_qualified_request_leds_s1;
  input            cpu_0_data_master_qualified_request_output_packet_s1;
  input            cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave;
  input            cpu_0_data_master_qualified_request_push_buttons_s1;
  input            cpu_0_data_master_qualified_request_sdram_0_s1;
  input            cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_qualified_request_switches_s1;
  input            cpu_0_data_master_qualified_request_sysid_control_slave;
  input            cpu_0_data_master_qualified_request_timer_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave;
  input            cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave;
  input            cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave;
  input            cpu_0_data_master_read_data_valid_input_packet_s1;
  input            cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_read_data_valid_lcd_0_control_slave;
  input            cpu_0_data_master_read_data_valid_leds_s1;
  input            cpu_0_data_master_read_data_valid_output_packet_s1;
  input            cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave;
  input            cpu_0_data_master_read_data_valid_push_buttons_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_read_data_valid_switches_s1;
  input            cpu_0_data_master_read_data_valid_sysid_control_slave;
  input            cpu_0_data_master_read_data_valid_timer_0_s1;
  input            cpu_0_data_master_requests_audio_0_avalon_audio_slave;
  input            cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;
  input            cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;
  input            cpu_0_data_master_requests_input_packet_s1;
  input            cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  input            cpu_0_data_master_requests_lcd_0_control_slave;
  input            cpu_0_data_master_requests_leds_s1;
  input            cpu_0_data_master_requests_output_packet_s1;
  input            cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;
  input            cpu_0_data_master_requests_push_buttons_s1;
  input            cpu_0_data_master_requests_sdram_0_s1;
  input            cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  input            cpu_0_data_master_requests_switches_s1;
  input            cpu_0_data_master_requests_sysid_control_slave;
  input            cpu_0_data_master_requests_timer_0_s1;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_audio_0_avalon_audio_slave_end_xfer;
  input            d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_de_boards_0_avalon_external_clocks_slave_end_xfer;
  input            d1_input_packet_s1_end_xfer;
  input            d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  input            d1_lcd_0_control_slave_end_xfer;
  input            d1_leds_s1_end_xfer;
  input            d1_output_packet_s1_end_xfer;
  input            d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
  input            d1_push_buttons_s1_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sram_0_avalon_sram_slave_end_xfer;
  input            d1_switches_s1_end_xfer;
  input            d1_sysid_control_slave_end_xfer;
  input            d1_timer_0_s1_end_xfer;
  input   [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata_from_sa;
  input   [ 31: 0] input_packet_s1_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  input   [  7: 0] lcd_0_control_slave_readdata_from_sa;
  input            lcd_0_control_slave_wait_counter_eq_0;
  input   [ 26: 0] leds_s1_readdata_from_sa;
  input   [ 31: 0] output_packet_s1_readdata_from_sa;
  input   [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa;
  input            push_buttons_s1_irq_from_sa;
  input   [  3: 0] push_buttons_s1_readdata_from_sa;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  input   [ 17: 0] switches_s1_readdata_from_sa;
  input   [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            timer_0_s1_irq_from_sa;
  input   [ 15: 0] timer_0_s1_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_data_master_address_last_time;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  reg     [  3: 0] cpu_0_data_master_byteenable_last_time;
  reg     [  1: 0] cpu_0_data_master_dbs_address;
  wire    [  1: 0] cpu_0_data_master_dbs_increment;
  reg     [  1: 0] cpu_0_data_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_data_master_dbs_rdv_counter_inc;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_is_granted_some_slave;
  reg     [  1: 0] cpu_0_data_master_latency_counter;
  wire    [  1: 0] cpu_0_data_master_next_dbs_rdv_counter;
  reg              cpu_0_data_master_read_but_no_slave_selected;
  reg              cpu_0_data_master_read_last_time;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_run;
  wire             cpu_0_data_master_waitrequest;
  reg              cpu_0_data_master_write_last_time;
  reg     [ 31: 0] cpu_0_data_master_writedata_last_time;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_0_data_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_data_master_readdatavalid;
  wire             r_0;
  wire             r_1;
  wire             r_2;
  wire             r_3;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave | ~cpu_0_data_master_requests_audio_0_avalon_audio_slave) & ((~cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave | ~cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave) & ((~cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_requests_cpu_0_jtag_debug_module) & (cpu_0_data_master_granted_cpu_0_jtag_debug_module | ~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave | ~cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave) & ((~cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_input_packet_s1 | ~cpu_0_data_master_requests_input_packet_s1) & ((~cpu_0_data_master_qualified_request_input_packet_s1 | ~cpu_0_data_master_read | (1 & ~d1_input_packet_s1_end_xfer & cpu_0_data_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0 & r_1 & r_2 & r_3;

  //r_1 master_run cascaded wait assignment, which is an e_assign
  assign r_1 = ((~cpu_0_data_master_qualified_request_input_packet_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & ((~cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & ~jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_lcd_0_control_slave | ~cpu_0_data_master_requests_lcd_0_control_slave) & ((~cpu_0_data_master_qualified_request_lcd_0_control_slave | ~cpu_0_data_master_read | (1 & ((lcd_0_control_slave_wait_counter_eq_0 & ~d1_lcd_0_control_slave_end_xfer)) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_lcd_0_control_slave | ~cpu_0_data_master_write | (1 & ((lcd_0_control_slave_wait_counter_eq_0 & ~d1_lcd_0_control_slave_end_xfer)) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_leds_s1 | ~cpu_0_data_master_requests_leds_s1) & ((~cpu_0_data_master_qualified_request_leds_s1 | ~cpu_0_data_master_read | (1 & ~d1_leds_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_leds_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_output_packet_s1 | ~cpu_0_data_master_requests_output_packet_s1) & ((~cpu_0_data_master_qualified_request_output_packet_s1 | ~cpu_0_data_master_read | (1 & ~d1_output_packet_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_output_packet_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave | ~cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave) & ((~cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write))));

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = ((~cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_push_buttons_s1 | ~cpu_0_data_master_requests_push_buttons_s1) & ((~cpu_0_data_master_qualified_request_push_buttons_s1 | ~cpu_0_data_master_read | (1 & ~d1_push_buttons_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_push_buttons_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sdram_0_s1 | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1 & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sdram_0_s1) & (cpu_0_data_master_granted_sdram_0_s1 | ~cpu_0_data_master_qualified_request_sdram_0_s1) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_read | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sdram_0_s1 | ~cpu_0_data_master_write | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | (cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave & cpu_0_data_master_dbs_address[1]) | ~cpu_0_data_master_requests_sram_0_avalon_sram_slave) & (cpu_0_data_master_granted_sram_0_avalon_sram_slave | ~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave) & ((~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_data_master_read | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_data_master_write | (1 & (cpu_0_data_master_dbs_address[1]) & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_switches_s1 | ~cpu_0_data_master_requests_switches_s1) & ((~cpu_0_data_master_qualified_request_switches_s1 | ~cpu_0_data_master_read | (1 & ~d1_switches_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_switches_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1;

  //r_3 master_run cascaded wait assignment, which is an e_assign
  assign r_3 = (cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_requests_sysid_control_slave) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_read | (1 & ~d1_sysid_control_slave_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_sysid_control_slave | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write))) & 1 & (cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_requests_timer_0_s1) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_read | (1 & ~d1_timer_0_s1_end_xfer & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_timer_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[24 : 0];

  //cpu_0_data_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_data_master_read_but_no_slave_selected <= cpu_0_data_master_read & cpu_0_data_master_run & ~cpu_0_data_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_data_master_is_granted_some_slave = cpu_0_data_master_granted_audio_0_avalon_audio_slave |
    cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave |
    cpu_0_data_master_granted_cpu_0_jtag_debug_module |
    cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave |
    cpu_0_data_master_granted_input_packet_s1 |
    cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_granted_lcd_0_control_slave |
    cpu_0_data_master_granted_leds_s1 |
    cpu_0_data_master_granted_output_packet_s1 |
    cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave |
    cpu_0_data_master_granted_push_buttons_s1 |
    cpu_0_data_master_granted_sdram_0_s1 |
    cpu_0_data_master_granted_sram_0_avalon_sram_slave |
    cpu_0_data_master_granted_switches_s1 |
    cpu_0_data_master_granted_sysid_control_slave |
    cpu_0_data_master_granted_timer_0_s1;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_data_master_readdatavalid = cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave |
    cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave |
    cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave |
    (cpu_0_data_master_read_data_valid_sdram_0_s1 & dbs_rdv_counter_overflow) |
    (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_data_master_readdatavalid = cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_input_packet_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_lcd_0_control_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_leds_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_output_packet_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_push_buttons_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_switches_s1 |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_sysid_control_slave |
    cpu_0_data_master_read_but_no_slave_selected |
    pre_flush_cpu_0_data_master_readdatavalid |
    cpu_0_data_master_read_data_valid_timer_0_s1;

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave}} | audio_0_avalon_audio_slave_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave}} | audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_data_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_read)}} | de_boards_0_avalon_external_clocks_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_input_packet_s1 & cpu_0_data_master_read)}} | input_packet_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read)}} | jtag_uart_0_avalon_jtag_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_lcd_0_control_slave & cpu_0_data_master_read)}} | lcd_0_control_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_leds_s1 & cpu_0_data_master_read)}} | leds_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_output_packet_s1 & cpu_0_data_master_read)}} | output_packet_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave}} | pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_push_buttons_s1 & cpu_0_data_master_read)}} | push_buttons_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_read_data_valid_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave}} | {sram_0_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~(cpu_0_data_master_qualified_request_switches_s1 & cpu_0_data_master_read)}} | switches_s1_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_sysid_control_slave & cpu_0_data_master_read)}} | sysid_control_slave_readdata_from_sa) &
    ({32 {~(cpu_0_data_master_qualified_request_timer_0_s1 & cpu_0_data_master_read)}} | timer_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_assign
  assign cpu_0_data_master_waitrequest = ~cpu_0_data_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_latency_counter <= 0;
      else 
        cpu_0_data_master_latency_counter <= p1_cpu_0_data_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_data_master_latency_counter = ((cpu_0_data_master_run & cpu_0_data_master_read))? latency_load_value :
    (cpu_0_data_master_latency_counter)? cpu_0_data_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = ({2 {cpu_0_data_master_requests_audio_0_avalon_audio_slave}} & 1) |
    ({2 {cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave}} & 1) |
    ({2 {cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave}} & 1) |
    ({2 {cpu_0_data_master_requests_sram_0_avalon_sram_slave}} & 2);

  //irq assign, which is an e_assign
  assign cpu_0_data_master_irq = {1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    1'b0,
    audio_0_avalon_audio_slave_irq_from_sa,
    timer_0_s1_irq_from_sa,
    push_buttons_s1_irq_from_sa,
    jtag_uart_0_avalon_jtag_slave_irq_from_sa};

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (((~0) & cpu_0_data_master_requests_sdram_0_s1 & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sdram_0_s1)) |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (((~0) & cpu_0_data_master_requests_sram_0_avalon_sram_slave & cpu_0_data_master_write & !cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)) |
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read & 1 & 1) |
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write & 1 & 1);

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = (cpu_0_data_master_read_data_valid_sdram_0_s1)? sdram_0_s1_readdata_from_sa :
    sram_0_avalon_sram_slave_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_data_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //mux write dbs 1, which is an e_mux
  assign cpu_0_data_master_dbs_write_16 = (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    (~(cpu_0_data_master_dbs_address[1]))? cpu_0_data_master_writedata[15 : 0] :
    (cpu_0_data_master_dbs_address[1])? cpu_0_data_master_writedata[31 : 16] :
    cpu_0_data_master_writedata[15 : 0];

  //dbs count increment, which is an e_mux
  assign cpu_0_data_master_dbs_increment = (cpu_0_data_master_requests_sdram_0_s1)? 2 :
    (cpu_0_data_master_requests_sram_0_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_data_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_data_master_dbs_address + cpu_0_data_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_data_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_data_master_next_dbs_rdv_counter = cpu_0_data_master_dbs_rdv_counter + cpu_0_data_master_dbs_rdv_counter_inc;

  //cpu_0_data_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_data_master_dbs_rdv_counter_inc = (cpu_0_data_master_read_data_valid_sdram_0_s1)? 2 :
    2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_data_master_read_data_valid_sdram_0_s1 |
    cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_data_master_dbs_rdv_counter <= cpu_0_data_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_data_master_dbs_rdv_counter[1] & ~cpu_0_data_master_next_dbs_rdv_counter[1];


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_data_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_address_last_time <= 0;
      else 
        cpu_0_data_master_address_last_time <= cpu_0_data_master_address;
    end


  //cpu_0/data_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_data_master_waitrequest & (cpu_0_data_master_read | cpu_0_data_master_write);
    end


  //cpu_0_data_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_address != cpu_0_data_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_byteenable check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_byteenable_last_time <= 0;
      else 
        cpu_0_data_master_byteenable_last_time <= cpu_0_data_master_byteenable;
    end


  //cpu_0_data_master_byteenable matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_byteenable != cpu_0_data_master_byteenable_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_byteenable did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_last_time <= 0;
      else 
        cpu_0_data_master_read_last_time <= cpu_0_data_master_read;
    end


  //cpu_0_data_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_read != cpu_0_data_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_read did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_write check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_write_last_time <= 0;
      else 
        cpu_0_data_master_write_last_time <= cpu_0_data_master_write;
    end


  //cpu_0_data_master_write matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_write != cpu_0_data_master_write_last_time))
        begin
          $write("%0d ns: cpu_0_data_master_write did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_data_master_writedata check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_writedata_last_time <= 0;
      else 
        cpu_0_data_master_writedata_last_time <= cpu_0_data_master_writedata;
    end


  //cpu_0_data_master_writedata matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_data_master_writedata != cpu_0_data_master_writedata_last_time) & cpu_0_data_master_write)
        begin
          $write("%0d ns: cpu_0_data_master_writedata did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_granted_sdram_0_s1,
                                              cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                              cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
                                              cpu_0_instruction_master_requests_sdram_0_s1,
                                              cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
                                              cpu_0_jtag_debug_module_readdata_from_sa,
                                              d1_cpu_0_jtag_debug_module_end_xfer,
                                              d1_sdram_0_s1_end_xfer,
                                              d1_sram_0_avalon_sram_slave_end_xfer,
                                              reset_n,
                                              sdram_0_s1_readdata_from_sa,
                                              sdram_0_s1_waitrequest_from_sa,
                                              sram_0_avalon_sram_slave_readdata_from_sa,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_readdatavalid,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 24: 0] cpu_0_instruction_master_address_to_slave;
  output  [  1: 0] cpu_0_instruction_master_dbs_address;
  output  [  1: 0] cpu_0_instruction_master_latency_counter;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_readdatavalid;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 24: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_granted_sdram_0_s1;
  input            cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_qualified_request_sdram_0_s1;
  input            cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  input            cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  input            cpu_0_instruction_master_requests_sdram_0_s1;
  input            cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  input   [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  input            d1_cpu_0_jtag_debug_module_end_xfer;
  input            d1_sdram_0_s1_end_xfer;
  input            d1_sram_0_avalon_sram_slave_end_xfer;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata_from_sa;
  input            sdram_0_s1_waitrequest_from_sa;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  reg     [ 24: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  reg     [  1: 0] cpu_0_instruction_master_dbs_address;
  wire    [  1: 0] cpu_0_instruction_master_dbs_increment;
  reg     [  1: 0] cpu_0_instruction_master_dbs_rdv_counter;
  wire    [  1: 0] cpu_0_instruction_master_dbs_rdv_counter_inc;
  wire             cpu_0_instruction_master_is_granted_some_slave;
  reg     [  1: 0] cpu_0_instruction_master_latency_counter;
  wire    [  1: 0] cpu_0_instruction_master_next_dbs_rdv_counter;
  reg              cpu_0_instruction_master_read_but_no_slave_selected;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             dbs_count_enable;
  wire             dbs_counter_overflow;
  reg     [ 15: 0] dbs_latent_16_reg_segment_0;
  wire             dbs_rdv_count_enable;
  wire             dbs_rdv_counter_overflow;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] next_dbs_address;
  wire    [  1: 0] p1_cpu_0_instruction_master_latency_counter;
  wire    [ 15: 0] p1_dbs_latent_16_reg_segment_0;
  wire             pre_dbs_count_enable;
  wire             pre_flush_cpu_0_instruction_master_readdatavalid;
  wire             r_0;
  wire             r_2;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) & (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module) & ((~cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module | ~cpu_0_instruction_master_read | (1 & ~d1_cpu_0_jtag_debug_module_end_xfer & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0 & r_2;

  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_requests_sdram_0_s1) & (cpu_0_instruction_master_granted_sdram_0_s1 | ~cpu_0_instruction_master_qualified_request_sdram_0_s1) & ((~cpu_0_instruction_master_qualified_request_sdram_0_s1 | ~cpu_0_instruction_master_read | (1 & ~sdram_0_s1_waitrequest_from_sa & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read))) & 1 & (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) & (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave | ~cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave) & ((~cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave | ~cpu_0_instruction_master_read | (1 & (cpu_0_instruction_master_dbs_address[1]) & cpu_0_instruction_master_read)));

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = cpu_0_instruction_master_address[24 : 0];

  //cpu_0_instruction_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_but_no_slave_selected <= 0;
      else 
        cpu_0_instruction_master_read_but_no_slave_selected <= cpu_0_instruction_master_read & cpu_0_instruction_master_run & ~cpu_0_instruction_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign cpu_0_instruction_master_is_granted_some_slave = cpu_0_instruction_master_granted_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_granted_sdram_0_s1 |
    cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_cpu_0_instruction_master_readdatavalid = (cpu_0_instruction_master_read_data_valid_sdram_0_s1 & dbs_rdv_counter_overflow) |
    (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave & dbs_rdv_counter_overflow);

  //latent slave read data valid which is not flushed, which is an e_mux
  assign cpu_0_instruction_master_readdatavalid = cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid |
    cpu_0_instruction_master_read_but_no_slave_selected |
    pre_flush_cpu_0_instruction_master_readdatavalid;

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = ({32 {~(cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module & cpu_0_instruction_master_read)}} | cpu_0_jtag_debug_module_readdata_from_sa) &
    ({32 {~cpu_0_instruction_master_read_data_valid_sdram_0_s1}} | {sdram_0_s1_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0}) &
    ({32 {~cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave}} | {sram_0_avalon_sram_slave_readdata_from_sa[15 : 0],
    dbs_latent_16_reg_segment_0});

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_latency_counter <= 0;
      else 
        cpu_0_instruction_master_latency_counter <= p1_cpu_0_instruction_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_cpu_0_instruction_master_latency_counter = ((cpu_0_instruction_master_run & cpu_0_instruction_master_read))? latency_load_value :
    (cpu_0_instruction_master_latency_counter)? cpu_0_instruction_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {cpu_0_instruction_master_requests_sram_0_avalon_sram_slave}} & 2;

  //input to latent dbs-16 stored 0, which is an e_mux
  assign p1_dbs_latent_16_reg_segment_0 = (cpu_0_instruction_master_read_data_valid_sdram_0_s1)? sdram_0_s1_readdata_from_sa :
    sram_0_avalon_sram_slave_readdata_from_sa;

  //dbs register for latent dbs-16 segment 0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          dbs_latent_16_reg_segment_0 <= 0;
      else if (dbs_rdv_count_enable & ((cpu_0_instruction_master_dbs_rdv_counter[1]) == 0))
          dbs_latent_16_reg_segment_0 <= p1_dbs_latent_16_reg_segment_0;
    end


  //dbs count increment, which is an e_mux
  assign cpu_0_instruction_master_dbs_increment = (cpu_0_instruction_master_requests_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave)? 2 :
    0;

  //dbs counter overflow, which is an e_assign
  assign dbs_counter_overflow = cpu_0_instruction_master_dbs_address[1] & !(next_dbs_address[1]);

  //next master address, which is an e_assign
  assign next_dbs_address = cpu_0_instruction_master_dbs_address + cpu_0_instruction_master_dbs_increment;

  //dbs count enable, which is an e_mux
  assign dbs_count_enable = pre_dbs_count_enable;

  //dbs counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_address <= 0;
      else if (dbs_count_enable)
          cpu_0_instruction_master_dbs_address <= next_dbs_address;
    end


  //p1 dbs rdv counter, which is an e_assign
  assign cpu_0_instruction_master_next_dbs_rdv_counter = cpu_0_instruction_master_dbs_rdv_counter + cpu_0_instruction_master_dbs_rdv_counter_inc;

  //cpu_0_instruction_master_rdv_inc_mux, which is an e_mux
  assign cpu_0_instruction_master_dbs_rdv_counter_inc = (cpu_0_instruction_master_read_data_valid_sdram_0_s1)? 2 :
    2;

  //master any slave rdv, which is an e_mux
  assign dbs_rdv_count_enable = cpu_0_instruction_master_read_data_valid_sdram_0_s1 |
    cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;

  //dbs rdv counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_dbs_rdv_counter <= 0;
      else if (dbs_rdv_count_enable)
          cpu_0_instruction_master_dbs_rdv_counter <= cpu_0_instruction_master_next_dbs_rdv_counter;
    end


  //dbs rdv counter overflow, which is an e_assign
  assign dbs_rdv_counter_overflow = cpu_0_instruction_master_dbs_rdv_counter[1] & ~cpu_0_instruction_master_next_dbs_rdv_counter[1];

  //pre dbs count enable, which is an e_mux
  assign pre_dbs_count_enable = (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read & 1 & 1 & ~sdram_0_s1_waitrequest_from_sa) |
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read & 1 & 1);


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module de_boards_0_avalon_external_clocks_slave_arbitrator (
                                                             // inputs:
                                                              clk,
                                                              cpu_0_data_master_address_to_slave,
                                                              cpu_0_data_master_byteenable,
                                                              cpu_0_data_master_latency_counter,
                                                              cpu_0_data_master_read,
                                                              cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                              cpu_0_data_master_write,
                                                              cpu_0_data_master_writedata,
                                                              de_boards_0_avalon_external_clocks_slave_readdata,
                                                              reset_n,

                                                             // outputs:
                                                              cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave,
                                                              cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave,
                                                              cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave,
                                                              cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave,
                                                              d1_de_boards_0_avalon_external_clocks_slave_end_xfer,
                                                              de_boards_0_avalon_external_clocks_slave_byteenable,
                                                              de_boards_0_avalon_external_clocks_slave_chipselect,
                                                              de_boards_0_avalon_external_clocks_slave_read,
                                                              de_boards_0_avalon_external_clocks_slave_readdata_from_sa,
                                                              de_boards_0_avalon_external_clocks_slave_reset,
                                                              de_boards_0_avalon_external_clocks_slave_write,
                                                              de_boards_0_avalon_external_clocks_slave_writedata
                                                           )
;

  output           cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave;
  output           cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave;
  output           cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave;
  output           cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;
  output           d1_de_boards_0_avalon_external_clocks_slave_end_xfer;
  output  [  3: 0] de_boards_0_avalon_external_clocks_slave_byteenable;
  output           de_boards_0_avalon_external_clocks_slave_chipselect;
  output           de_boards_0_avalon_external_clocks_slave_read;
  output  [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata_from_sa;
  output           de_boards_0_avalon_external_clocks_slave_reset;
  output           de_boards_0_avalon_external_clocks_slave_write;
  output  [ 31: 0] de_boards_0_avalon_external_clocks_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_saved_grant_de_boards_0_avalon_external_clocks_slave;
  reg              d1_de_boards_0_avalon_external_clocks_slave_end_xfer;
  reg              d1_reasons_to_wait;
  wire             de_boards_0_avalon_external_clocks_slave_allgrants;
  wire             de_boards_0_avalon_external_clocks_slave_allow_new_arb_cycle;
  wire             de_boards_0_avalon_external_clocks_slave_any_bursting_master_saved_grant;
  wire             de_boards_0_avalon_external_clocks_slave_any_continuerequest;
  wire             de_boards_0_avalon_external_clocks_slave_arb_counter_enable;
  reg     [  1: 0] de_boards_0_avalon_external_clocks_slave_arb_share_counter;
  wire    [  1: 0] de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value;
  wire    [  1: 0] de_boards_0_avalon_external_clocks_slave_arb_share_set_values;
  wire             de_boards_0_avalon_external_clocks_slave_beginbursttransfer_internal;
  wire             de_boards_0_avalon_external_clocks_slave_begins_xfer;
  wire    [  3: 0] de_boards_0_avalon_external_clocks_slave_byteenable;
  wire             de_boards_0_avalon_external_clocks_slave_chipselect;
  wire             de_boards_0_avalon_external_clocks_slave_end_xfer;
  wire             de_boards_0_avalon_external_clocks_slave_firsttransfer;
  wire             de_boards_0_avalon_external_clocks_slave_grant_vector;
  wire             de_boards_0_avalon_external_clocks_slave_in_a_read_cycle;
  wire             de_boards_0_avalon_external_clocks_slave_in_a_write_cycle;
  wire             de_boards_0_avalon_external_clocks_slave_master_qreq_vector;
  wire             de_boards_0_avalon_external_clocks_slave_non_bursting_master_requests;
  wire             de_boards_0_avalon_external_clocks_slave_read;
  wire    [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata_from_sa;
  reg              de_boards_0_avalon_external_clocks_slave_reg_firsttransfer;
  wire             de_boards_0_avalon_external_clocks_slave_reset;
  reg              de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable;
  wire             de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable2;
  wire             de_boards_0_avalon_external_clocks_slave_unreg_firsttransfer;
  wire             de_boards_0_avalon_external_clocks_slave_waits_for_read;
  wire             de_boards_0_avalon_external_clocks_slave_waits_for_write;
  wire             de_boards_0_avalon_external_clocks_slave_write;
  wire    [ 31: 0] de_boards_0_avalon_external_clocks_slave_writedata;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_de_boards_0_avalon_external_clocks_slave_from_cpu_0_data_master;
  wire             wait_for_de_boards_0_avalon_external_clocks_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~de_boards_0_avalon_external_clocks_slave_end_xfer;
    end


  assign de_boards_0_avalon_external_clocks_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave));
  //assign de_boards_0_avalon_external_clocks_slave_readdata_from_sa = de_boards_0_avalon_external_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_readdata_from_sa = de_boards_0_avalon_external_clocks_slave_readdata;

  assign cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave = ({cpu_0_data_master_address_to_slave[24 : 2] , 2'b0} == 25'h11010e0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //de_boards_0_avalon_external_clocks_slave_arb_share_counter set values, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_arb_share_set_values = 1;

  //de_boards_0_avalon_external_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_non_bursting_master_requests = cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;

  //de_boards_0_avalon_external_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_any_bursting_master_saved_grant = 0;

  //de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value = de_boards_0_avalon_external_clocks_slave_firsttransfer ? (de_boards_0_avalon_external_clocks_slave_arb_share_set_values - 1) : |de_boards_0_avalon_external_clocks_slave_arb_share_counter ? (de_boards_0_avalon_external_clocks_slave_arb_share_counter - 1) : 0;

  //de_boards_0_avalon_external_clocks_slave_allgrants all slave grants, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_allgrants = |de_boards_0_avalon_external_clocks_slave_grant_vector;

  //de_boards_0_avalon_external_clocks_slave_end_xfer assignment, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_end_xfer = ~(de_boards_0_avalon_external_clocks_slave_waits_for_read | de_boards_0_avalon_external_clocks_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave = de_boards_0_avalon_external_clocks_slave_end_xfer & (~de_boards_0_avalon_external_clocks_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //de_boards_0_avalon_external_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave & de_boards_0_avalon_external_clocks_slave_allgrants) | (end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave & ~de_boards_0_avalon_external_clocks_slave_non_bursting_master_requests);

  //de_boards_0_avalon_external_clocks_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          de_boards_0_avalon_external_clocks_slave_arb_share_counter <= 0;
      else if (de_boards_0_avalon_external_clocks_slave_arb_counter_enable)
          de_boards_0_avalon_external_clocks_slave_arb_share_counter <= de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value;
    end


  //de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable <= 0;
      else if ((|de_boards_0_avalon_external_clocks_slave_master_qreq_vector & end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave) | (end_xfer_arb_share_counter_term_de_boards_0_avalon_external_clocks_slave & ~de_boards_0_avalon_external_clocks_slave_non_bursting_master_requests))
          de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable <= |de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master de_boards_0/avalon_external_clocks_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable2 = |de_boards_0_avalon_external_clocks_slave_arb_share_counter_next_value;

  //cpu_0/data_master de_boards_0/avalon_external_clocks_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //de_boards_0_avalon_external_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave = cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_read & ~de_boards_0_avalon_external_clocks_slave_waits_for_read;

  //de_boards_0_avalon_external_clocks_slave_writedata mux, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave = cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave;

  //cpu_0/data_master saved-grant de_boards_0/avalon_external_clocks_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_de_boards_0_avalon_external_clocks_slave = cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;

  //allow new arb cycle for de_boards_0/avalon_external_clocks_slave, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign de_boards_0_avalon_external_clocks_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign de_boards_0_avalon_external_clocks_slave_master_qreq_vector = 1;

  //~de_boards_0_avalon_external_clocks_slave_reset assignment, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_reset = ~reset_n;

  assign de_boards_0_avalon_external_clocks_slave_chipselect = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave;
  //de_boards_0_avalon_external_clocks_slave_firsttransfer first transaction, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_firsttransfer = de_boards_0_avalon_external_clocks_slave_begins_xfer ? de_boards_0_avalon_external_clocks_slave_unreg_firsttransfer : de_boards_0_avalon_external_clocks_slave_reg_firsttransfer;

  //de_boards_0_avalon_external_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_unreg_firsttransfer = ~(de_boards_0_avalon_external_clocks_slave_slavearbiterlockenable & de_boards_0_avalon_external_clocks_slave_any_continuerequest);

  //de_boards_0_avalon_external_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          de_boards_0_avalon_external_clocks_slave_reg_firsttransfer <= 1'b1;
      else if (de_boards_0_avalon_external_clocks_slave_begins_xfer)
          de_boards_0_avalon_external_clocks_slave_reg_firsttransfer <= de_boards_0_avalon_external_clocks_slave_unreg_firsttransfer;
    end


  //de_boards_0_avalon_external_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_beginbursttransfer_internal = de_boards_0_avalon_external_clocks_slave_begins_xfer;

  //de_boards_0_avalon_external_clocks_slave_read assignment, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_read = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_read;

  //de_boards_0_avalon_external_clocks_slave_write assignment, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_write = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_write;

  assign shifted_address_to_de_boards_0_avalon_external_clocks_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //d1_de_boards_0_avalon_external_clocks_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_de_boards_0_avalon_external_clocks_slave_end_xfer <= 1;
      else 
        d1_de_boards_0_avalon_external_clocks_slave_end_xfer <= de_boards_0_avalon_external_clocks_slave_end_xfer;
    end


  //de_boards_0_avalon_external_clocks_slave_waits_for_read in a cycle, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_waits_for_read = de_boards_0_avalon_external_clocks_slave_in_a_read_cycle & 0;

  //de_boards_0_avalon_external_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_in_a_read_cycle = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = de_boards_0_avalon_external_clocks_slave_in_a_read_cycle;

  //de_boards_0_avalon_external_clocks_slave_waits_for_write in a cycle, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_waits_for_write = de_boards_0_avalon_external_clocks_slave_in_a_write_cycle & 0;

  //de_boards_0_avalon_external_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  assign de_boards_0_avalon_external_clocks_slave_in_a_write_cycle = cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = de_boards_0_avalon_external_clocks_slave_in_a_write_cycle;

  assign wait_for_de_boards_0_avalon_external_clocks_slave_counter = 0;
  //de_boards_0_avalon_external_clocks_slave_byteenable byte enable port mux, which is an e_mux
  assign de_boards_0_avalon_external_clocks_slave_byteenable = (cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //de_boards_0/avalon_external_clocks_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module input_packet_s1_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_latency_counter,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                     cpu_0_data_master_write,
                                     input_packet_s1_readdata,
                                     reset_n,

                                    // outputs:
                                     cpu_0_data_master_granted_input_packet_s1,
                                     cpu_0_data_master_qualified_request_input_packet_s1,
                                     cpu_0_data_master_read_data_valid_input_packet_s1,
                                     cpu_0_data_master_requests_input_packet_s1,
                                     d1_input_packet_s1_end_xfer,
                                     input_packet_s1_address,
                                     input_packet_s1_readdata_from_sa,
                                     input_packet_s1_reset_n
                                  )
;

  output           cpu_0_data_master_granted_input_packet_s1;
  output           cpu_0_data_master_qualified_request_input_packet_s1;
  output           cpu_0_data_master_read_data_valid_input_packet_s1;
  output           cpu_0_data_master_requests_input_packet_s1;
  output           d1_input_packet_s1_end_xfer;
  output  [  1: 0] input_packet_s1_address;
  output  [ 31: 0] input_packet_s1_readdata_from_sa;
  output           input_packet_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] input_packet_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_input_packet_s1;
  wire             cpu_0_data_master_qualified_request_input_packet_s1;
  wire             cpu_0_data_master_read_data_valid_input_packet_s1;
  wire             cpu_0_data_master_requests_input_packet_s1;
  wire             cpu_0_data_master_saved_grant_input_packet_s1;
  reg              d1_input_packet_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_input_packet_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] input_packet_s1_address;
  wire             input_packet_s1_allgrants;
  wire             input_packet_s1_allow_new_arb_cycle;
  wire             input_packet_s1_any_bursting_master_saved_grant;
  wire             input_packet_s1_any_continuerequest;
  wire             input_packet_s1_arb_counter_enable;
  reg     [  1: 0] input_packet_s1_arb_share_counter;
  wire    [  1: 0] input_packet_s1_arb_share_counter_next_value;
  wire    [  1: 0] input_packet_s1_arb_share_set_values;
  wire             input_packet_s1_beginbursttransfer_internal;
  wire             input_packet_s1_begins_xfer;
  wire             input_packet_s1_end_xfer;
  wire             input_packet_s1_firsttransfer;
  wire             input_packet_s1_grant_vector;
  wire             input_packet_s1_in_a_read_cycle;
  wire             input_packet_s1_in_a_write_cycle;
  wire             input_packet_s1_master_qreq_vector;
  wire             input_packet_s1_non_bursting_master_requests;
  wire    [ 31: 0] input_packet_s1_readdata_from_sa;
  reg              input_packet_s1_reg_firsttransfer;
  wire             input_packet_s1_reset_n;
  reg              input_packet_s1_slavearbiterlockenable;
  wire             input_packet_s1_slavearbiterlockenable2;
  wire             input_packet_s1_unreg_firsttransfer;
  wire             input_packet_s1_waits_for_read;
  wire             input_packet_s1_waits_for_write;
  wire    [ 24: 0] shifted_address_to_input_packet_s1_from_cpu_0_data_master;
  wire             wait_for_input_packet_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~input_packet_s1_end_xfer;
    end


  assign input_packet_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_input_packet_s1));
  //assign input_packet_s1_readdata_from_sa = input_packet_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign input_packet_s1_readdata_from_sa = input_packet_s1_readdata;

  assign cpu_0_data_master_requests_input_packet_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h11010a0) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //input_packet_s1_arb_share_counter set values, which is an e_mux
  assign input_packet_s1_arb_share_set_values = 1;

  //input_packet_s1_non_bursting_master_requests mux, which is an e_mux
  assign input_packet_s1_non_bursting_master_requests = cpu_0_data_master_requests_input_packet_s1;

  //input_packet_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign input_packet_s1_any_bursting_master_saved_grant = 0;

  //input_packet_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign input_packet_s1_arb_share_counter_next_value = input_packet_s1_firsttransfer ? (input_packet_s1_arb_share_set_values - 1) : |input_packet_s1_arb_share_counter ? (input_packet_s1_arb_share_counter - 1) : 0;

  //input_packet_s1_allgrants all slave grants, which is an e_mux
  assign input_packet_s1_allgrants = |input_packet_s1_grant_vector;

  //input_packet_s1_end_xfer assignment, which is an e_assign
  assign input_packet_s1_end_xfer = ~(input_packet_s1_waits_for_read | input_packet_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_input_packet_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_input_packet_s1 = input_packet_s1_end_xfer & (~input_packet_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //input_packet_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign input_packet_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_input_packet_s1 & input_packet_s1_allgrants) | (end_xfer_arb_share_counter_term_input_packet_s1 & ~input_packet_s1_non_bursting_master_requests);

  //input_packet_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          input_packet_s1_arb_share_counter <= 0;
      else if (input_packet_s1_arb_counter_enable)
          input_packet_s1_arb_share_counter <= input_packet_s1_arb_share_counter_next_value;
    end


  //input_packet_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          input_packet_s1_slavearbiterlockenable <= 0;
      else if ((|input_packet_s1_master_qreq_vector & end_xfer_arb_share_counter_term_input_packet_s1) | (end_xfer_arb_share_counter_term_input_packet_s1 & ~input_packet_s1_non_bursting_master_requests))
          input_packet_s1_slavearbiterlockenable <= |input_packet_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master input_packet/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = input_packet_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //input_packet_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign input_packet_s1_slavearbiterlockenable2 = |input_packet_s1_arb_share_counter_next_value;

  //cpu_0/data_master input_packet/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = input_packet_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //input_packet_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign input_packet_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_input_packet_s1 = cpu_0_data_master_requests_input_packet_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_input_packet_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_input_packet_s1 = cpu_0_data_master_granted_input_packet_s1 & cpu_0_data_master_read & ~input_packet_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_input_packet_s1 = cpu_0_data_master_qualified_request_input_packet_s1;

  //cpu_0/data_master saved-grant input_packet/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_input_packet_s1 = cpu_0_data_master_requests_input_packet_s1;

  //allow new arb cycle for input_packet/s1, which is an e_assign
  assign input_packet_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign input_packet_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign input_packet_s1_master_qreq_vector = 1;

  //input_packet_s1_reset_n assignment, which is an e_assign
  assign input_packet_s1_reset_n = reset_n;

  //input_packet_s1_firsttransfer first transaction, which is an e_assign
  assign input_packet_s1_firsttransfer = input_packet_s1_begins_xfer ? input_packet_s1_unreg_firsttransfer : input_packet_s1_reg_firsttransfer;

  //input_packet_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign input_packet_s1_unreg_firsttransfer = ~(input_packet_s1_slavearbiterlockenable & input_packet_s1_any_continuerequest);

  //input_packet_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          input_packet_s1_reg_firsttransfer <= 1'b1;
      else if (input_packet_s1_begins_xfer)
          input_packet_s1_reg_firsttransfer <= input_packet_s1_unreg_firsttransfer;
    end


  //input_packet_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign input_packet_s1_beginbursttransfer_internal = input_packet_s1_begins_xfer;

  assign shifted_address_to_input_packet_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //input_packet_s1_address mux, which is an e_mux
  assign input_packet_s1_address = shifted_address_to_input_packet_s1_from_cpu_0_data_master >> 2;

  //d1_input_packet_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_input_packet_s1_end_xfer <= 1;
      else 
        d1_input_packet_s1_end_xfer <= input_packet_s1_end_xfer;
    end


  //input_packet_s1_waits_for_read in a cycle, which is an e_mux
  assign input_packet_s1_waits_for_read = input_packet_s1_in_a_read_cycle & input_packet_s1_begins_xfer;

  //input_packet_s1_in_a_read_cycle assignment, which is an e_assign
  assign input_packet_s1_in_a_read_cycle = cpu_0_data_master_granted_input_packet_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = input_packet_s1_in_a_read_cycle;

  //input_packet_s1_waits_for_write in a cycle, which is an e_mux
  assign input_packet_s1_waits_for_write = input_packet_s1_in_a_write_cycle & 0;

  //input_packet_s1_in_a_write_cycle assignment, which is an e_assign
  assign input_packet_s1_in_a_write_cycle = cpu_0_data_master_granted_input_packet_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = input_packet_s1_in_a_write_cycle;

  assign wait_for_input_packet_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //input_packet/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module jtag_uart_0_avalon_jtag_slave_arbitrator (
                                                  // inputs:
                                                   clk,
                                                   cpu_0_data_master_address_to_slave,
                                                   cpu_0_data_master_latency_counter,
                                                   cpu_0_data_master_read,
                                                   cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                   cpu_0_data_master_write,
                                                   cpu_0_data_master_writedata,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable,
                                                   jtag_uart_0_avalon_jtag_slave_irq,
                                                   jtag_uart_0_avalon_jtag_slave_readdata,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest,
                                                   reset_n,

                                                  // outputs:
                                                   cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
                                                   cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
                                                   d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
                                                   jtag_uart_0_avalon_jtag_slave_address,
                                                   jtag_uart_0_avalon_jtag_slave_chipselect,
                                                   jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_irq_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_read_n,
                                                   jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_reset_n,
                                                   jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
                                                   jtag_uart_0_avalon_jtag_slave_write_n,
                                                   jtag_uart_0_avalon_jtag_slave_writedata
                                                )
;

  output           cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  output           cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  output           d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  output           jtag_uart_0_avalon_jtag_slave_address;
  output           jtag_uart_0_avalon_jtag_slave_chipselect;
  output           jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_read_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_reset_n;
  output           jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  output           jtag_uart_0_avalon_jtag_slave_write_n;
  output  [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            jtag_uart_0_avalon_jtag_slave_dataavailable;
  input            jtag_uart_0_avalon_jtag_slave_irq;
  input   [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  input            jtag_uart_0_avalon_jtag_slave_readyfordata;
  input            jtag_uart_0_avalon_jtag_slave_waitrequest;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave;
  reg              d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_allgrants;
  wire             jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant;
  wire             jtag_uart_0_avalon_jtag_slave_any_continuerequest;
  wire             jtag_uart_0_avalon_jtag_slave_arb_counter_enable;
  reg     [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
  wire    [  1: 0] jtag_uart_0_avalon_jtag_slave_arb_share_set_values;
  wire             jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal;
  wire             jtag_uart_0_avalon_jtag_slave_begins_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             jtag_uart_0_avalon_jtag_slave_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_grant_vector;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_master_qreq_vector;
  wire             jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  reg              jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  reg              jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable;
  wire             jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2;
  wire             jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_read;
  wire             jtag_uart_0_avalon_jtag_slave_waits_for_write;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [ 24: 0] shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master;
  wire             wait_for_jtag_uart_0_avalon_jtag_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  assign jtag_uart_0_avalon_jtag_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave));
  //assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata;

  assign cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave = ({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h11010d0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable;

  //assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata;

  //assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_arb_share_set_values = 1;

  //jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant = 0;

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value = jtag_uart_0_avalon_jtag_slave_firsttransfer ? (jtag_uart_0_avalon_jtag_slave_arb_share_set_values - 1) : |jtag_uart_0_avalon_jtag_slave_arb_share_counter ? (jtag_uart_0_avalon_jtag_slave_arb_share_counter - 1) : 0;

  //jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_allgrants = |jtag_uart_0_avalon_jtag_slave_grant_vector;

  //jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_end_xfer = ~(jtag_uart_0_avalon_jtag_slave_waits_for_read | jtag_uart_0_avalon_jtag_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave = jtag_uart_0_avalon_jtag_slave_end_xfer & (~jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & jtag_uart_0_avalon_jtag_slave_allgrants) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests);

  //jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= 0;
      else if (jtag_uart_0_avalon_jtag_slave_arb_counter_enable)
          jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= 0;
      else if ((|jtag_uart_0_avalon_jtag_slave_master_qreq_vector & end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave) | (end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave & ~jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests))
          jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 = |jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;

  //cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read & ~jtag_uart_0_avalon_jtag_slave_waits_for_read;

  //jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;

  //cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave = cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;

  //allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign jtag_uart_0_avalon_jtag_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign jtag_uart_0_avalon_jtag_slave_master_qreq_vector = 1;

  //jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_reset_n = reset_n;

  assign jtag_uart_0_avalon_jtag_slave_chipselect = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  //jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_firsttransfer = jtag_uart_0_avalon_jtag_slave_begins_xfer ? jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer : jtag_uart_0_avalon_jtag_slave_reg_firsttransfer;

  //jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer = ~(jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable & jtag_uart_0_avalon_jtag_slave_any_continuerequest);

  //jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= 1'b1;
      else if (jtag_uart_0_avalon_jtag_slave_begins_xfer)
          jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
    end


  //jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal = jtag_uart_0_avalon_jtag_slave_begins_xfer;

  //~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_read_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read);

  //~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_write_n = ~(cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write);

  assign shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_address = shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master >> 2;

  //d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= 1;
      else 
        d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end


  //jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_read = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_read_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;

  //jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  assign jtag_uart_0_avalon_jtag_slave_waits_for_write = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle & jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;

  //jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_in_a_write_cycle = cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;

  assign wait_for_jtag_uart_0_avalon_jtag_slave_counter = 0;
  //assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module lcd_0_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         lcd_0_control_slave_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_lcd_0_control_slave,
                                         cpu_0_data_master_qualified_request_lcd_0_control_slave,
                                         cpu_0_data_master_read_data_valid_lcd_0_control_slave,
                                         cpu_0_data_master_requests_lcd_0_control_slave,
                                         d1_lcd_0_control_slave_end_xfer,
                                         lcd_0_control_slave_address,
                                         lcd_0_control_slave_begintransfer,
                                         lcd_0_control_slave_read,
                                         lcd_0_control_slave_readdata_from_sa,
                                         lcd_0_control_slave_wait_counter_eq_0,
                                         lcd_0_control_slave_write,
                                         lcd_0_control_slave_writedata
                                      )
;

  output           cpu_0_data_master_granted_lcd_0_control_slave;
  output           cpu_0_data_master_qualified_request_lcd_0_control_slave;
  output           cpu_0_data_master_read_data_valid_lcd_0_control_slave;
  output           cpu_0_data_master_requests_lcd_0_control_slave;
  output           d1_lcd_0_control_slave_end_xfer;
  output  [  1: 0] lcd_0_control_slave_address;
  output           lcd_0_control_slave_begintransfer;
  output           lcd_0_control_slave_read;
  output  [  7: 0] lcd_0_control_slave_readdata_from_sa;
  output           lcd_0_control_slave_wait_counter_eq_0;
  output           lcd_0_control_slave_write;
  output  [  7: 0] lcd_0_control_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [  7: 0] lcd_0_control_slave_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_lcd_0_control_slave;
  wire             cpu_0_data_master_qualified_request_lcd_0_control_slave;
  wire             cpu_0_data_master_read_data_valid_lcd_0_control_slave;
  wire             cpu_0_data_master_requests_lcd_0_control_slave;
  wire             cpu_0_data_master_saved_grant_lcd_0_control_slave;
  reg              d1_lcd_0_control_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_lcd_0_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] lcd_0_control_slave_address;
  wire             lcd_0_control_slave_allgrants;
  wire             lcd_0_control_slave_allow_new_arb_cycle;
  wire             lcd_0_control_slave_any_bursting_master_saved_grant;
  wire             lcd_0_control_slave_any_continuerequest;
  wire             lcd_0_control_slave_arb_counter_enable;
  reg     [  1: 0] lcd_0_control_slave_arb_share_counter;
  wire    [  1: 0] lcd_0_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] lcd_0_control_slave_arb_share_set_values;
  wire             lcd_0_control_slave_beginbursttransfer_internal;
  wire             lcd_0_control_slave_begins_xfer;
  wire             lcd_0_control_slave_begintransfer;
  wire    [  5: 0] lcd_0_control_slave_counter_load_value;
  wire             lcd_0_control_slave_end_xfer;
  wire             lcd_0_control_slave_firsttransfer;
  wire             lcd_0_control_slave_grant_vector;
  wire             lcd_0_control_slave_in_a_read_cycle;
  wire             lcd_0_control_slave_in_a_write_cycle;
  wire             lcd_0_control_slave_master_qreq_vector;
  wire             lcd_0_control_slave_non_bursting_master_requests;
  wire             lcd_0_control_slave_pretend_byte_enable;
  wire             lcd_0_control_slave_read;
  wire    [  7: 0] lcd_0_control_slave_readdata_from_sa;
  reg              lcd_0_control_slave_reg_firsttransfer;
  reg              lcd_0_control_slave_slavearbiterlockenable;
  wire             lcd_0_control_slave_slavearbiterlockenable2;
  wire             lcd_0_control_slave_unreg_firsttransfer;
  reg     [  5: 0] lcd_0_control_slave_wait_counter;
  wire             lcd_0_control_slave_wait_counter_eq_0;
  wire             lcd_0_control_slave_waits_for_read;
  wire             lcd_0_control_slave_waits_for_write;
  wire             lcd_0_control_slave_write;
  wire    [  7: 0] lcd_0_control_slave_writedata;
  wire    [ 24: 0] shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master;
  wire             wait_for_lcd_0_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~lcd_0_control_slave_end_xfer;
    end


  assign lcd_0_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_lcd_0_control_slave));
  //assign lcd_0_control_slave_readdata_from_sa = lcd_0_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign lcd_0_control_slave_readdata_from_sa = lcd_0_control_slave_readdata;

  assign cpu_0_data_master_requests_lcd_0_control_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101090) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //lcd_0_control_slave_arb_share_counter set values, which is an e_mux
  assign lcd_0_control_slave_arb_share_set_values = 1;

  //lcd_0_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign lcd_0_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_lcd_0_control_slave;

  //lcd_0_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign lcd_0_control_slave_any_bursting_master_saved_grant = 0;

  //lcd_0_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign lcd_0_control_slave_arb_share_counter_next_value = lcd_0_control_slave_firsttransfer ? (lcd_0_control_slave_arb_share_set_values - 1) : |lcd_0_control_slave_arb_share_counter ? (lcd_0_control_slave_arb_share_counter - 1) : 0;

  //lcd_0_control_slave_allgrants all slave grants, which is an e_mux
  assign lcd_0_control_slave_allgrants = |lcd_0_control_slave_grant_vector;

  //lcd_0_control_slave_end_xfer assignment, which is an e_assign
  assign lcd_0_control_slave_end_xfer = ~(lcd_0_control_slave_waits_for_read | lcd_0_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_lcd_0_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_lcd_0_control_slave = lcd_0_control_slave_end_xfer & (~lcd_0_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //lcd_0_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign lcd_0_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_lcd_0_control_slave & lcd_0_control_slave_allgrants) | (end_xfer_arb_share_counter_term_lcd_0_control_slave & ~lcd_0_control_slave_non_bursting_master_requests);

  //lcd_0_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_0_control_slave_arb_share_counter <= 0;
      else if (lcd_0_control_slave_arb_counter_enable)
          lcd_0_control_slave_arb_share_counter <= lcd_0_control_slave_arb_share_counter_next_value;
    end


  //lcd_0_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_0_control_slave_slavearbiterlockenable <= 0;
      else if ((|lcd_0_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_lcd_0_control_slave) | (end_xfer_arb_share_counter_term_lcd_0_control_slave & ~lcd_0_control_slave_non_bursting_master_requests))
          lcd_0_control_slave_slavearbiterlockenable <= |lcd_0_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master lcd_0/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = lcd_0_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //lcd_0_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign lcd_0_control_slave_slavearbiterlockenable2 = |lcd_0_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master lcd_0/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = lcd_0_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //lcd_0_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign lcd_0_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_lcd_0_control_slave = cpu_0_data_master_requests_lcd_0_control_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_lcd_0_control_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_lcd_0_control_slave = cpu_0_data_master_granted_lcd_0_control_slave & cpu_0_data_master_read & ~lcd_0_control_slave_waits_for_read;

  //lcd_0_control_slave_writedata mux, which is an e_mux
  assign lcd_0_control_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_lcd_0_control_slave = cpu_0_data_master_qualified_request_lcd_0_control_slave;

  //cpu_0/data_master saved-grant lcd_0/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_lcd_0_control_slave = cpu_0_data_master_requests_lcd_0_control_slave;

  //allow new arb cycle for lcd_0/control_slave, which is an e_assign
  assign lcd_0_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign lcd_0_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign lcd_0_control_slave_master_qreq_vector = 1;

  assign lcd_0_control_slave_begintransfer = lcd_0_control_slave_begins_xfer;
  //lcd_0_control_slave_firsttransfer first transaction, which is an e_assign
  assign lcd_0_control_slave_firsttransfer = lcd_0_control_slave_begins_xfer ? lcd_0_control_slave_unreg_firsttransfer : lcd_0_control_slave_reg_firsttransfer;

  //lcd_0_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign lcd_0_control_slave_unreg_firsttransfer = ~(lcd_0_control_slave_slavearbiterlockenable & lcd_0_control_slave_any_continuerequest);

  //lcd_0_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_0_control_slave_reg_firsttransfer <= 1'b1;
      else if (lcd_0_control_slave_begins_xfer)
          lcd_0_control_slave_reg_firsttransfer <= lcd_0_control_slave_unreg_firsttransfer;
    end


  //lcd_0_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign lcd_0_control_slave_beginbursttransfer_internal = lcd_0_control_slave_begins_xfer;

  //lcd_0_control_slave_read assignment, which is an e_mux
  assign lcd_0_control_slave_read = ((cpu_0_data_master_granted_lcd_0_control_slave & cpu_0_data_master_read))& ~lcd_0_control_slave_begins_xfer & (lcd_0_control_slave_wait_counter < 13);

  //lcd_0_control_slave_write assignment, which is an e_mux
  assign lcd_0_control_slave_write = ((cpu_0_data_master_granted_lcd_0_control_slave & cpu_0_data_master_write)) & ~lcd_0_control_slave_begins_xfer & (lcd_0_control_slave_wait_counter >= 13) & (lcd_0_control_slave_wait_counter < 26) & lcd_0_control_slave_pretend_byte_enable;

  assign shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //lcd_0_control_slave_address mux, which is an e_mux
  assign lcd_0_control_slave_address = shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master >> 2;

  //d1_lcd_0_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_lcd_0_control_slave_end_xfer <= 1;
      else 
        d1_lcd_0_control_slave_end_xfer <= lcd_0_control_slave_end_xfer;
    end


  //lcd_0_control_slave_waits_for_read in a cycle, which is an e_mux
  assign lcd_0_control_slave_waits_for_read = lcd_0_control_slave_in_a_read_cycle & wait_for_lcd_0_control_slave_counter;

  //lcd_0_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign lcd_0_control_slave_in_a_read_cycle = cpu_0_data_master_granted_lcd_0_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = lcd_0_control_slave_in_a_read_cycle;

  //lcd_0_control_slave_waits_for_write in a cycle, which is an e_mux
  assign lcd_0_control_slave_waits_for_write = lcd_0_control_slave_in_a_write_cycle & wait_for_lcd_0_control_slave_counter;

  //lcd_0_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign lcd_0_control_slave_in_a_write_cycle = cpu_0_data_master_granted_lcd_0_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = lcd_0_control_slave_in_a_write_cycle;

  assign lcd_0_control_slave_wait_counter_eq_0 = lcd_0_control_slave_wait_counter == 0;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          lcd_0_control_slave_wait_counter <= 0;
      else 
        lcd_0_control_slave_wait_counter <= lcd_0_control_slave_counter_load_value;
    end


  assign lcd_0_control_slave_counter_load_value = ((lcd_0_control_slave_in_a_read_cycle & lcd_0_control_slave_begins_xfer))? 24 :
    ((lcd_0_control_slave_in_a_write_cycle & lcd_0_control_slave_begins_xfer))? 37 :
    (~lcd_0_control_slave_wait_counter_eq_0)? lcd_0_control_slave_wait_counter - 1 :
    0;

  assign wait_for_lcd_0_control_slave_counter = lcd_0_control_slave_begins_xfer | ~lcd_0_control_slave_wait_counter_eq_0;
  //lcd_0_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  assign lcd_0_control_slave_pretend_byte_enable = (cpu_0_data_master_granted_lcd_0_control_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //lcd_0/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module leds_s1_arbitrator (
                            // inputs:
                             clk,
                             cpu_0_data_master_address_to_slave,
                             cpu_0_data_master_latency_counter,
                             cpu_0_data_master_read,
                             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                             cpu_0_data_master_write,
                             cpu_0_data_master_writedata,
                             leds_s1_readdata,
                             reset_n,

                            // outputs:
                             cpu_0_data_master_granted_leds_s1,
                             cpu_0_data_master_qualified_request_leds_s1,
                             cpu_0_data_master_read_data_valid_leds_s1,
                             cpu_0_data_master_requests_leds_s1,
                             d1_leds_s1_end_xfer,
                             leds_s1_address,
                             leds_s1_chipselect,
                             leds_s1_readdata_from_sa,
                             leds_s1_reset_n,
                             leds_s1_write_n,
                             leds_s1_writedata
                          )
;

  output           cpu_0_data_master_granted_leds_s1;
  output           cpu_0_data_master_qualified_request_leds_s1;
  output           cpu_0_data_master_read_data_valid_leds_s1;
  output           cpu_0_data_master_requests_leds_s1;
  output           d1_leds_s1_end_xfer;
  output  [  1: 0] leds_s1_address;
  output           leds_s1_chipselect;
  output  [ 26: 0] leds_s1_readdata_from_sa;
  output           leds_s1_reset_n;
  output           leds_s1_write_n;
  output  [ 26: 0] leds_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 26: 0] leds_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_leds_s1;
  wire             cpu_0_data_master_qualified_request_leds_s1;
  wire             cpu_0_data_master_read_data_valid_leds_s1;
  wire             cpu_0_data_master_requests_leds_s1;
  wire             cpu_0_data_master_saved_grant_leds_s1;
  reg              d1_leds_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_leds_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_allgrants;
  wire             leds_s1_allow_new_arb_cycle;
  wire             leds_s1_any_bursting_master_saved_grant;
  wire             leds_s1_any_continuerequest;
  wire             leds_s1_arb_counter_enable;
  reg     [  1: 0] leds_s1_arb_share_counter;
  wire    [  1: 0] leds_s1_arb_share_counter_next_value;
  wire    [  1: 0] leds_s1_arb_share_set_values;
  wire             leds_s1_beginbursttransfer_internal;
  wire             leds_s1_begins_xfer;
  wire             leds_s1_chipselect;
  wire             leds_s1_end_xfer;
  wire             leds_s1_firsttransfer;
  wire             leds_s1_grant_vector;
  wire             leds_s1_in_a_read_cycle;
  wire             leds_s1_in_a_write_cycle;
  wire             leds_s1_master_qreq_vector;
  wire             leds_s1_non_bursting_master_requests;
  wire    [ 26: 0] leds_s1_readdata_from_sa;
  reg              leds_s1_reg_firsttransfer;
  wire             leds_s1_reset_n;
  reg              leds_s1_slavearbiterlockenable;
  wire             leds_s1_slavearbiterlockenable2;
  wire             leds_s1_unreg_firsttransfer;
  wire             leds_s1_waits_for_read;
  wire             leds_s1_waits_for_write;
  wire             leds_s1_write_n;
  wire    [ 26: 0] leds_s1_writedata;
  wire    [ 24: 0] shifted_address_to_leds_s1_from_cpu_0_data_master;
  wire             wait_for_leds_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~leds_s1_end_xfer;
    end


  assign leds_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_leds_s1));
  //assign leds_s1_readdata_from_sa = leds_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign leds_s1_readdata_from_sa = leds_s1_readdata;

  assign cpu_0_data_master_requests_leds_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101060) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //leds_s1_arb_share_counter set values, which is an e_mux
  assign leds_s1_arb_share_set_values = 1;

  //leds_s1_non_bursting_master_requests mux, which is an e_mux
  assign leds_s1_non_bursting_master_requests = cpu_0_data_master_requests_leds_s1;

  //leds_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign leds_s1_any_bursting_master_saved_grant = 0;

  //leds_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign leds_s1_arb_share_counter_next_value = leds_s1_firsttransfer ? (leds_s1_arb_share_set_values - 1) : |leds_s1_arb_share_counter ? (leds_s1_arb_share_counter - 1) : 0;

  //leds_s1_allgrants all slave grants, which is an e_mux
  assign leds_s1_allgrants = |leds_s1_grant_vector;

  //leds_s1_end_xfer assignment, which is an e_assign
  assign leds_s1_end_xfer = ~(leds_s1_waits_for_read | leds_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_leds_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_leds_s1 = leds_s1_end_xfer & (~leds_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //leds_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign leds_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_leds_s1 & leds_s1_allgrants) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests);

  //leds_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_arb_share_counter <= 0;
      else if (leds_s1_arb_counter_enable)
          leds_s1_arb_share_counter <= leds_s1_arb_share_counter_next_value;
    end


  //leds_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_slavearbiterlockenable <= 0;
      else if ((|leds_s1_master_qreq_vector & end_xfer_arb_share_counter_term_leds_s1) | (end_xfer_arb_share_counter_term_leds_s1 & ~leds_s1_non_bursting_master_requests))
          leds_s1_slavearbiterlockenable <= |leds_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master leds/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = leds_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //leds_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign leds_s1_slavearbiterlockenable2 = |leds_s1_arb_share_counter_next_value;

  //cpu_0/data_master leds/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = leds_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //leds_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign leds_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_leds_s1 = cpu_0_data_master_requests_leds_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_leds_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_leds_s1 = cpu_0_data_master_granted_leds_s1 & cpu_0_data_master_read & ~leds_s1_waits_for_read;

  //leds_s1_writedata mux, which is an e_mux
  assign leds_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_leds_s1 = cpu_0_data_master_qualified_request_leds_s1;

  //cpu_0/data_master saved-grant leds/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_leds_s1 = cpu_0_data_master_requests_leds_s1;

  //allow new arb cycle for leds/s1, which is an e_assign
  assign leds_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign leds_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign leds_s1_master_qreq_vector = 1;

  //leds_s1_reset_n assignment, which is an e_assign
  assign leds_s1_reset_n = reset_n;

  assign leds_s1_chipselect = cpu_0_data_master_granted_leds_s1;
  //leds_s1_firsttransfer first transaction, which is an e_assign
  assign leds_s1_firsttransfer = leds_s1_begins_xfer ? leds_s1_unreg_firsttransfer : leds_s1_reg_firsttransfer;

  //leds_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign leds_s1_unreg_firsttransfer = ~(leds_s1_slavearbiterlockenable & leds_s1_any_continuerequest);

  //leds_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          leds_s1_reg_firsttransfer <= 1'b1;
      else if (leds_s1_begins_xfer)
          leds_s1_reg_firsttransfer <= leds_s1_unreg_firsttransfer;
    end


  //leds_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign leds_s1_beginbursttransfer_internal = leds_s1_begins_xfer;

  //~leds_s1_write_n assignment, which is an e_mux
  assign leds_s1_write_n = ~(cpu_0_data_master_granted_leds_s1 & cpu_0_data_master_write);

  assign shifted_address_to_leds_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //leds_s1_address mux, which is an e_mux
  assign leds_s1_address = shifted_address_to_leds_s1_from_cpu_0_data_master >> 2;

  //d1_leds_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_leds_s1_end_xfer <= 1;
      else 
        d1_leds_s1_end_xfer <= leds_s1_end_xfer;
    end


  //leds_s1_waits_for_read in a cycle, which is an e_mux
  assign leds_s1_waits_for_read = leds_s1_in_a_read_cycle & leds_s1_begins_xfer;

  //leds_s1_in_a_read_cycle assignment, which is an e_assign
  assign leds_s1_in_a_read_cycle = cpu_0_data_master_granted_leds_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = leds_s1_in_a_read_cycle;

  //leds_s1_waits_for_write in a cycle, which is an e_mux
  assign leds_s1_waits_for_write = leds_s1_in_a_write_cycle & 0;

  //leds_s1_in_a_write_cycle assignment, which is an e_assign
  assign leds_s1_in_a_write_cycle = cpu_0_data_master_granted_leds_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = leds_s1_in_a_write_cycle;

  assign wait_for_leds_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //leds/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module output_packet_s1_arbitrator (
                                     // inputs:
                                      clk,
                                      cpu_0_data_master_address_to_slave,
                                      cpu_0_data_master_latency_counter,
                                      cpu_0_data_master_read,
                                      cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                      cpu_0_data_master_write,
                                      cpu_0_data_master_writedata,
                                      output_packet_s1_readdata,
                                      reset_n,

                                     // outputs:
                                      cpu_0_data_master_granted_output_packet_s1,
                                      cpu_0_data_master_qualified_request_output_packet_s1,
                                      cpu_0_data_master_read_data_valid_output_packet_s1,
                                      cpu_0_data_master_requests_output_packet_s1,
                                      d1_output_packet_s1_end_xfer,
                                      output_packet_s1_address,
                                      output_packet_s1_chipselect,
                                      output_packet_s1_readdata_from_sa,
                                      output_packet_s1_reset_n,
                                      output_packet_s1_write_n,
                                      output_packet_s1_writedata
                                   )
;

  output           cpu_0_data_master_granted_output_packet_s1;
  output           cpu_0_data_master_qualified_request_output_packet_s1;
  output           cpu_0_data_master_read_data_valid_output_packet_s1;
  output           cpu_0_data_master_requests_output_packet_s1;
  output           d1_output_packet_s1_end_xfer;
  output  [  2: 0] output_packet_s1_address;
  output           output_packet_s1_chipselect;
  output  [ 31: 0] output_packet_s1_readdata_from_sa;
  output           output_packet_s1_reset_n;
  output           output_packet_s1_write_n;
  output  [ 31: 0] output_packet_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] output_packet_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_output_packet_s1;
  wire             cpu_0_data_master_qualified_request_output_packet_s1;
  wire             cpu_0_data_master_read_data_valid_output_packet_s1;
  wire             cpu_0_data_master_requests_output_packet_s1;
  wire             cpu_0_data_master_saved_grant_output_packet_s1;
  reg              d1_output_packet_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_output_packet_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] output_packet_s1_address;
  wire             output_packet_s1_allgrants;
  wire             output_packet_s1_allow_new_arb_cycle;
  wire             output_packet_s1_any_bursting_master_saved_grant;
  wire             output_packet_s1_any_continuerequest;
  wire             output_packet_s1_arb_counter_enable;
  reg     [  1: 0] output_packet_s1_arb_share_counter;
  wire    [  1: 0] output_packet_s1_arb_share_counter_next_value;
  wire    [  1: 0] output_packet_s1_arb_share_set_values;
  wire             output_packet_s1_beginbursttransfer_internal;
  wire             output_packet_s1_begins_xfer;
  wire             output_packet_s1_chipselect;
  wire             output_packet_s1_end_xfer;
  wire             output_packet_s1_firsttransfer;
  wire             output_packet_s1_grant_vector;
  wire             output_packet_s1_in_a_read_cycle;
  wire             output_packet_s1_in_a_write_cycle;
  wire             output_packet_s1_master_qreq_vector;
  wire             output_packet_s1_non_bursting_master_requests;
  wire    [ 31: 0] output_packet_s1_readdata_from_sa;
  reg              output_packet_s1_reg_firsttransfer;
  wire             output_packet_s1_reset_n;
  reg              output_packet_s1_slavearbiterlockenable;
  wire             output_packet_s1_slavearbiterlockenable2;
  wire             output_packet_s1_unreg_firsttransfer;
  wire             output_packet_s1_waits_for_read;
  wire             output_packet_s1_waits_for_write;
  wire             output_packet_s1_write_n;
  wire    [ 31: 0] output_packet_s1_writedata;
  wire    [ 24: 0] shifted_address_to_output_packet_s1_from_cpu_0_data_master;
  wire             wait_for_output_packet_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~output_packet_s1_end_xfer;
    end


  assign output_packet_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_output_packet_s1));
  //assign output_packet_s1_readdata_from_sa = output_packet_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign output_packet_s1_readdata_from_sa = output_packet_s1_readdata;

  assign cpu_0_data_master_requests_output_packet_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1101020) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //output_packet_s1_arb_share_counter set values, which is an e_mux
  assign output_packet_s1_arb_share_set_values = 1;

  //output_packet_s1_non_bursting_master_requests mux, which is an e_mux
  assign output_packet_s1_non_bursting_master_requests = cpu_0_data_master_requests_output_packet_s1;

  //output_packet_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign output_packet_s1_any_bursting_master_saved_grant = 0;

  //output_packet_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign output_packet_s1_arb_share_counter_next_value = output_packet_s1_firsttransfer ? (output_packet_s1_arb_share_set_values - 1) : |output_packet_s1_arb_share_counter ? (output_packet_s1_arb_share_counter - 1) : 0;

  //output_packet_s1_allgrants all slave grants, which is an e_mux
  assign output_packet_s1_allgrants = |output_packet_s1_grant_vector;

  //output_packet_s1_end_xfer assignment, which is an e_assign
  assign output_packet_s1_end_xfer = ~(output_packet_s1_waits_for_read | output_packet_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_output_packet_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_output_packet_s1 = output_packet_s1_end_xfer & (~output_packet_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //output_packet_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign output_packet_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_output_packet_s1 & output_packet_s1_allgrants) | (end_xfer_arb_share_counter_term_output_packet_s1 & ~output_packet_s1_non_bursting_master_requests);

  //output_packet_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          output_packet_s1_arb_share_counter <= 0;
      else if (output_packet_s1_arb_counter_enable)
          output_packet_s1_arb_share_counter <= output_packet_s1_arb_share_counter_next_value;
    end


  //output_packet_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          output_packet_s1_slavearbiterlockenable <= 0;
      else if ((|output_packet_s1_master_qreq_vector & end_xfer_arb_share_counter_term_output_packet_s1) | (end_xfer_arb_share_counter_term_output_packet_s1 & ~output_packet_s1_non_bursting_master_requests))
          output_packet_s1_slavearbiterlockenable <= |output_packet_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master output_packet/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = output_packet_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //output_packet_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign output_packet_s1_slavearbiterlockenable2 = |output_packet_s1_arb_share_counter_next_value;

  //cpu_0/data_master output_packet/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = output_packet_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //output_packet_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign output_packet_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_output_packet_s1 = cpu_0_data_master_requests_output_packet_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_output_packet_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_output_packet_s1 = cpu_0_data_master_granted_output_packet_s1 & cpu_0_data_master_read & ~output_packet_s1_waits_for_read;

  //output_packet_s1_writedata mux, which is an e_mux
  assign output_packet_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_output_packet_s1 = cpu_0_data_master_qualified_request_output_packet_s1;

  //cpu_0/data_master saved-grant output_packet/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_output_packet_s1 = cpu_0_data_master_requests_output_packet_s1;

  //allow new arb cycle for output_packet/s1, which is an e_assign
  assign output_packet_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign output_packet_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign output_packet_s1_master_qreq_vector = 1;

  //output_packet_s1_reset_n assignment, which is an e_assign
  assign output_packet_s1_reset_n = reset_n;

  assign output_packet_s1_chipselect = cpu_0_data_master_granted_output_packet_s1;
  //output_packet_s1_firsttransfer first transaction, which is an e_assign
  assign output_packet_s1_firsttransfer = output_packet_s1_begins_xfer ? output_packet_s1_unreg_firsttransfer : output_packet_s1_reg_firsttransfer;

  //output_packet_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign output_packet_s1_unreg_firsttransfer = ~(output_packet_s1_slavearbiterlockenable & output_packet_s1_any_continuerequest);

  //output_packet_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          output_packet_s1_reg_firsttransfer <= 1'b1;
      else if (output_packet_s1_begins_xfer)
          output_packet_s1_reg_firsttransfer <= output_packet_s1_unreg_firsttransfer;
    end


  //output_packet_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign output_packet_s1_beginbursttransfer_internal = output_packet_s1_begins_xfer;

  //~output_packet_s1_write_n assignment, which is an e_mux
  assign output_packet_s1_write_n = ~(cpu_0_data_master_granted_output_packet_s1 & cpu_0_data_master_write);

  assign shifted_address_to_output_packet_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //output_packet_s1_address mux, which is an e_mux
  assign output_packet_s1_address = shifted_address_to_output_packet_s1_from_cpu_0_data_master >> 2;

  //d1_output_packet_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_output_packet_s1_end_xfer <= 1;
      else 
        d1_output_packet_s1_end_xfer <= output_packet_s1_end_xfer;
    end


  //output_packet_s1_waits_for_read in a cycle, which is an e_mux
  assign output_packet_s1_waits_for_read = output_packet_s1_in_a_read_cycle & output_packet_s1_begins_xfer;

  //output_packet_s1_in_a_read_cycle assignment, which is an e_assign
  assign output_packet_s1_in_a_read_cycle = cpu_0_data_master_granted_output_packet_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = output_packet_s1_in_a_read_cycle;

  //output_packet_s1_waits_for_write in a cycle, which is an e_mux
  assign output_packet_s1_waits_for_write = output_packet_s1_in_a_write_cycle & 0;

  //output_packet_s1_in_a_write_cycle assignment, which is an e_assign
  assign output_packet_s1_in_a_write_cycle = cpu_0_data_master_granted_output_packet_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = output_packet_s1_in_a_write_cycle;

  assign wait_for_output_packet_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //output_packet/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_buffer_0_avalon_pixel_buffer_slave_arbitrator (
                                                             // inputs:
                                                              clk,
                                                              cpu_0_data_master_address_to_slave,
                                                              cpu_0_data_master_byteenable,
                                                              cpu_0_data_master_latency_counter,
                                                              cpu_0_data_master_read,
                                                              cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                                              cpu_0_data_master_write,
                                                              cpu_0_data_master_writedata,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_readdata,
                                                              reset_n,

                                                             // outputs:
                                                              cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave,
                                                              cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave,
                                                              cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave,
                                                              cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave,
                                                              d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_address,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_byteenable,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_read,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_reset,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_write,
                                                              pixel_buffer_0_avalon_pixel_buffer_slave_writedata
                                                           )
;

  output           cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave;
  output           cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave;
  output           cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave;
  output           cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;
  output           d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
  output  [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_address;
  output  [  3: 0] pixel_buffer_0_avalon_pixel_buffer_slave_byteenable;
  output           pixel_buffer_0_avalon_pixel_buffer_slave_read;
  output  [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa;
  output           pixel_buffer_0_avalon_pixel_buffer_slave_reset;
  output           pixel_buffer_0_avalon_pixel_buffer_slave_write;
  output  [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave;
  reg              cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register_in;
  wire             cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_saved_grant_pixel_buffer_0_avalon_pixel_buffer_slave;
  reg              d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire             p1_cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_address;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_allgrants;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_allow_new_arb_cycle;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_any_bursting_master_saved_grant;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_any_continuerequest;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_arb_counter_enable;
  reg     [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_set_values;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_beginbursttransfer_internal;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_begins_xfer;
  wire    [  3: 0] pixel_buffer_0_avalon_pixel_buffer_slave_byteenable;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_firsttransfer;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_grant_vector;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_in_a_read_cycle;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_in_a_write_cycle;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_master_qreq_vector;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_non_bursting_master_requests;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_read;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa;
  reg              pixel_buffer_0_avalon_pixel_buffer_slave_reg_firsttransfer;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_reset;
  reg              pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable2;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_unreg_firsttransfer;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_read;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_write;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_write;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_writedata;
  wire    [ 24: 0] shifted_address_to_pixel_buffer_0_avalon_pixel_buffer_slave_from_cpu_0_data_master;
  wire             wait_for_pixel_buffer_0_avalon_pixel_buffer_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
    end


  assign pixel_buffer_0_avalon_pixel_buffer_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave));
  //assign pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa = pixel_buffer_0_avalon_pixel_buffer_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa = pixel_buffer_0_avalon_pixel_buffer_slave_readdata;

  assign cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h11010c0) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter set values, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_set_values = 1;

  //pixel_buffer_0_avalon_pixel_buffer_slave_non_bursting_master_requests mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_non_bursting_master_requests = cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;

  //pixel_buffer_0_avalon_pixel_buffer_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_any_bursting_master_saved_grant = 0;

  //pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value = pixel_buffer_0_avalon_pixel_buffer_slave_firsttransfer ? (pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_set_values - 1) : |pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter ? (pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter - 1) : 0;

  //pixel_buffer_0_avalon_pixel_buffer_slave_allgrants all slave grants, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_allgrants = |pixel_buffer_0_avalon_pixel_buffer_slave_grant_vector;

  //pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer = ~(pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_read | pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave = pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer & (~pixel_buffer_0_avalon_pixel_buffer_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave & pixel_buffer_0_avalon_pixel_buffer_slave_allgrants) | (end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave & ~pixel_buffer_0_avalon_pixel_buffer_slave_non_bursting_master_requests);

  //pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter <= 0;
      else if (pixel_buffer_0_avalon_pixel_buffer_slave_arb_counter_enable)
          pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter <= pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value;
    end


  //pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable <= 0;
      else if ((|pixel_buffer_0_avalon_pixel_buffer_slave_master_qreq_vector & end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave) | (end_xfer_arb_share_counter_term_pixel_buffer_0_avalon_pixel_buffer_slave & ~pixel_buffer_0_avalon_pixel_buffer_slave_non_bursting_master_requests))
          pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable <= |pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master pixel_buffer_0/avalon_pixel_buffer_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable2 = |pixel_buffer_0_avalon_pixel_buffer_slave_arb_share_counter_next_value;

  //cpu_0/data_master pixel_buffer_0/avalon_pixel_buffer_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pixel_buffer_0_avalon_pixel_buffer_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave = cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave & ~((cpu_0_data_master_read & ((1 < cpu_0_data_master_latency_counter) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register_in = cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave & cpu_0_data_master_read & ~pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register = {cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register, cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave = cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave_shift_register;

  //pixel_buffer_0_avalon_pixel_buffer_slave_writedata mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave = cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave;

  //cpu_0/data_master saved-grant pixel_buffer_0/avalon_pixel_buffer_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_pixel_buffer_0_avalon_pixel_buffer_slave = cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;

  //allow new arb cycle for pixel_buffer_0/avalon_pixel_buffer_slave, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pixel_buffer_0_avalon_pixel_buffer_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pixel_buffer_0_avalon_pixel_buffer_slave_master_qreq_vector = 1;

  //~pixel_buffer_0_avalon_pixel_buffer_slave_reset assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_reset = ~reset_n;

  //pixel_buffer_0_avalon_pixel_buffer_slave_firsttransfer first transaction, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_firsttransfer = pixel_buffer_0_avalon_pixel_buffer_slave_begins_xfer ? pixel_buffer_0_avalon_pixel_buffer_slave_unreg_firsttransfer : pixel_buffer_0_avalon_pixel_buffer_slave_reg_firsttransfer;

  //pixel_buffer_0_avalon_pixel_buffer_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_unreg_firsttransfer = ~(pixel_buffer_0_avalon_pixel_buffer_slave_slavearbiterlockenable & pixel_buffer_0_avalon_pixel_buffer_slave_any_continuerequest);

  //pixel_buffer_0_avalon_pixel_buffer_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_slave_reg_firsttransfer <= 1'b1;
      else if (pixel_buffer_0_avalon_pixel_buffer_slave_begins_xfer)
          pixel_buffer_0_avalon_pixel_buffer_slave_reg_firsttransfer <= pixel_buffer_0_avalon_pixel_buffer_slave_unreg_firsttransfer;
    end


  //pixel_buffer_0_avalon_pixel_buffer_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_beginbursttransfer_internal = pixel_buffer_0_avalon_pixel_buffer_slave_begins_xfer;

  //pixel_buffer_0_avalon_pixel_buffer_slave_read assignment, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_read = cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave & cpu_0_data_master_read;

  //pixel_buffer_0_avalon_pixel_buffer_slave_write assignment, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_write = cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave & cpu_0_data_master_write;

  assign shifted_address_to_pixel_buffer_0_avalon_pixel_buffer_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pixel_buffer_0_avalon_pixel_buffer_slave_address mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_address = shifted_address_to_pixel_buffer_0_avalon_pixel_buffer_slave_from_cpu_0_data_master >> 2;

  //d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer <= 1;
      else 
        d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer <= pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
    end


  //pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_read in a cycle, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_read = pixel_buffer_0_avalon_pixel_buffer_slave_in_a_read_cycle & 0;

  //pixel_buffer_0_avalon_pixel_buffer_slave_in_a_read_cycle assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_in_a_read_cycle = cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pixel_buffer_0_avalon_pixel_buffer_slave_in_a_read_cycle;

  //pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_write in a cycle, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_waits_for_write = pixel_buffer_0_avalon_pixel_buffer_slave_in_a_write_cycle & 0;

  //pixel_buffer_0_avalon_pixel_buffer_slave_in_a_write_cycle assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_slave_in_a_write_cycle = cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pixel_buffer_0_avalon_pixel_buffer_slave_in_a_write_cycle;

  assign wait_for_pixel_buffer_0_avalon_pixel_buffer_slave_counter = 0;
  //pixel_buffer_0_avalon_pixel_buffer_slave_byteenable byte enable port mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_slave_byteenable = (cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pixel_buffer_0/avalon_pixel_buffer_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_buffer_0_avalon_pixel_buffer_master_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               d1_sram_0_avalon_sram_slave_end_xfer,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_address,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_read,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave,
                                                               reset_n,
                                                               sram_0_avalon_sram_slave_readdata_from_sa,

                                                              // outputs:
                                                               pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_latency_counter,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_readdata,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid,
                                                               pixel_buffer_0_avalon_pixel_buffer_master_waitrequest
                                                            )
;

  output  [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave;
  output  [  1: 0] pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
  output  [ 15: 0] pixel_buffer_0_avalon_pixel_buffer_master_readdata;
  output           pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid;
  output           pixel_buffer_0_avalon_pixel_buffer_master_waitrequest;
  input            clk;
  input            d1_sram_0_avalon_sram_slave_end_xfer;
  input   [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address;
  input            pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave;
  input            pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave;
  input            pixel_buffer_0_avalon_pixel_buffer_master_read;
  input            pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave;
  input            pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;
  input            reset_n;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;

  reg              active_and_waiting_last_time;
  wire    [  1: 0] latency_load_value;
  wire    [  1: 0] p1_pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
  reg     [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address_last_time;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_is_granted_some_slave;
  reg     [  1: 0] pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
  reg              pixel_buffer_0_avalon_pixel_buffer_master_read_but_no_slave_selected;
  reg              pixel_buffer_0_avalon_pixel_buffer_master_read_last_time;
  wire    [ 15: 0] pixel_buffer_0_avalon_pixel_buffer_master_readdata;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_run;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_waitrequest;
  wire             pre_flush_pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid;
  wire             r_2;
  //r_2 master_run cascaded wait assignment, which is an e_assign
  assign r_2 = 1 & (pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave | ~pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave) & (pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave | ~pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave) & ((~pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave | ~pixel_buffer_0_avalon_pixel_buffer_master_read | (1 & pixel_buffer_0_avalon_pixel_buffer_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_master_run = r_2;

  //optimize select-logic by passing only those address bits which matter.
  assign pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave = {13'b100001,
    pixel_buffer_0_avalon_pixel_buffer_master_address[18 : 0]};

  //pixel_buffer_0_avalon_pixel_buffer_master_read_but_no_slave_selected assignment, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_master_read_but_no_slave_selected <= 0;
      else 
        pixel_buffer_0_avalon_pixel_buffer_master_read_but_no_slave_selected <= pixel_buffer_0_avalon_pixel_buffer_master_read & pixel_buffer_0_avalon_pixel_buffer_master_run & ~pixel_buffer_0_avalon_pixel_buffer_master_is_granted_some_slave;
    end


  //some slave is getting selected, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_is_granted_some_slave = pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave;

  //latent slave read data valids which may be flushed, which is an e_mux
  assign pre_flush_pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid = pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave;

  //latent slave read data valid which is not flushed, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid = pixel_buffer_0_avalon_pixel_buffer_master_read_but_no_slave_selected |
    pre_flush_pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid;

  //pixel_buffer_0/avalon_pixel_buffer_master readdata mux, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_readdata = sram_0_avalon_sram_slave_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_master_waitrequest = ~pixel_buffer_0_avalon_pixel_buffer_master_run;

  //latent max counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_master_latency_counter <= 0;
      else 
        pixel_buffer_0_avalon_pixel_buffer_master_latency_counter <= p1_pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
    end


  //latency counter load mux, which is an e_mux
  assign p1_pixel_buffer_0_avalon_pixel_buffer_master_latency_counter = ((pixel_buffer_0_avalon_pixel_buffer_master_run & pixel_buffer_0_avalon_pixel_buffer_master_read))? latency_load_value :
    (pixel_buffer_0_avalon_pixel_buffer_master_latency_counter)? pixel_buffer_0_avalon_pixel_buffer_master_latency_counter - 1 :
    0;

  //read latency load values, which is an e_mux
  assign latency_load_value = {2 {pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave}} & 2;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pixel_buffer_0_avalon_pixel_buffer_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_master_address_last_time <= 0;
      else 
        pixel_buffer_0_avalon_pixel_buffer_master_address_last_time <= pixel_buffer_0_avalon_pixel_buffer_master_address;
    end


  //pixel_buffer_0/avalon_pixel_buffer_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= pixel_buffer_0_avalon_pixel_buffer_master_waitrequest & (pixel_buffer_0_avalon_pixel_buffer_master_read);
    end


  //pixel_buffer_0_avalon_pixel_buffer_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pixel_buffer_0_avalon_pixel_buffer_master_address != pixel_buffer_0_avalon_pixel_buffer_master_address_last_time))
        begin
          $write("%0d ns: pixel_buffer_0_avalon_pixel_buffer_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //pixel_buffer_0_avalon_pixel_buffer_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_master_read_last_time <= 0;
      else 
        pixel_buffer_0_avalon_pixel_buffer_master_read_last_time <= pixel_buffer_0_avalon_pixel_buffer_master_read;
    end


  //pixel_buffer_0_avalon_pixel_buffer_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (pixel_buffer_0_avalon_pixel_buffer_master_read != pixel_buffer_0_avalon_pixel_buffer_master_read_last_time))
        begin
          $write("%0d ns: pixel_buffer_0_avalon_pixel_buffer_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pixel_buffer_0_avalon_pixel_buffer_source_arbitrator (
                                                              // inputs:
                                                               clk,
                                                               pixel_buffer_0_avalon_pixel_buffer_source_data,
                                                               pixel_buffer_0_avalon_pixel_buffer_source_empty,
                                                               pixel_buffer_0_avalon_pixel_buffer_source_endofpacket,
                                                               pixel_buffer_0_avalon_pixel_buffer_source_startofpacket,
                                                               pixel_buffer_0_avalon_pixel_buffer_source_valid,
                                                               reset_n,
                                                               vga_0_avalon_vga_sink_ready_from_sa,

                                                              // outputs:
                                                               pixel_buffer_0_avalon_pixel_buffer_source_ready
                                                            )
;

  output           pixel_buffer_0_avalon_pixel_buffer_source_ready;
  input            clk;
  input   [ 29: 0] pixel_buffer_0_avalon_pixel_buffer_source_data;
  input   [  1: 0] pixel_buffer_0_avalon_pixel_buffer_source_empty;
  input            pixel_buffer_0_avalon_pixel_buffer_source_endofpacket;
  input            pixel_buffer_0_avalon_pixel_buffer_source_startofpacket;
  input            pixel_buffer_0_avalon_pixel_buffer_source_valid;
  input            reset_n;
  input            vga_0_avalon_vga_sink_ready_from_sa;

  wire             pixel_buffer_0_avalon_pixel_buffer_source_ready;
  //mux pixel_buffer_0_avalon_pixel_buffer_source_ready, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_source_ready = vga_0_avalon_vga_sink_ready_from_sa;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module push_buttons_s1_arbitrator (
                                    // inputs:
                                     clk,
                                     cpu_0_data_master_address_to_slave,
                                     cpu_0_data_master_latency_counter,
                                     cpu_0_data_master_read,
                                     cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                     cpu_0_data_master_write,
                                     cpu_0_data_master_writedata,
                                     push_buttons_s1_irq,
                                     push_buttons_s1_readdata,
                                     reset_n,

                                    // outputs:
                                     cpu_0_data_master_granted_push_buttons_s1,
                                     cpu_0_data_master_qualified_request_push_buttons_s1,
                                     cpu_0_data_master_read_data_valid_push_buttons_s1,
                                     cpu_0_data_master_requests_push_buttons_s1,
                                     d1_push_buttons_s1_end_xfer,
                                     push_buttons_s1_address,
                                     push_buttons_s1_chipselect,
                                     push_buttons_s1_irq_from_sa,
                                     push_buttons_s1_readdata_from_sa,
                                     push_buttons_s1_reset_n,
                                     push_buttons_s1_write_n,
                                     push_buttons_s1_writedata
                                  )
;

  output           cpu_0_data_master_granted_push_buttons_s1;
  output           cpu_0_data_master_qualified_request_push_buttons_s1;
  output           cpu_0_data_master_read_data_valid_push_buttons_s1;
  output           cpu_0_data_master_requests_push_buttons_s1;
  output           d1_push_buttons_s1_end_xfer;
  output  [  1: 0] push_buttons_s1_address;
  output           push_buttons_s1_chipselect;
  output           push_buttons_s1_irq_from_sa;
  output  [  3: 0] push_buttons_s1_readdata_from_sa;
  output           push_buttons_s1_reset_n;
  output           push_buttons_s1_write_n;
  output  [  3: 0] push_buttons_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            push_buttons_s1_irq;
  input   [  3: 0] push_buttons_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_push_buttons_s1;
  wire             cpu_0_data_master_qualified_request_push_buttons_s1;
  wire             cpu_0_data_master_read_data_valid_push_buttons_s1;
  wire             cpu_0_data_master_requests_push_buttons_s1;
  wire             cpu_0_data_master_saved_grant_push_buttons_s1;
  reg              d1_push_buttons_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_push_buttons_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  1: 0] push_buttons_s1_address;
  wire             push_buttons_s1_allgrants;
  wire             push_buttons_s1_allow_new_arb_cycle;
  wire             push_buttons_s1_any_bursting_master_saved_grant;
  wire             push_buttons_s1_any_continuerequest;
  wire             push_buttons_s1_arb_counter_enable;
  reg     [  1: 0] push_buttons_s1_arb_share_counter;
  wire    [  1: 0] push_buttons_s1_arb_share_counter_next_value;
  wire    [  1: 0] push_buttons_s1_arb_share_set_values;
  wire             push_buttons_s1_beginbursttransfer_internal;
  wire             push_buttons_s1_begins_xfer;
  wire             push_buttons_s1_chipselect;
  wire             push_buttons_s1_end_xfer;
  wire             push_buttons_s1_firsttransfer;
  wire             push_buttons_s1_grant_vector;
  wire             push_buttons_s1_in_a_read_cycle;
  wire             push_buttons_s1_in_a_write_cycle;
  wire             push_buttons_s1_irq_from_sa;
  wire             push_buttons_s1_master_qreq_vector;
  wire             push_buttons_s1_non_bursting_master_requests;
  wire    [  3: 0] push_buttons_s1_readdata_from_sa;
  reg              push_buttons_s1_reg_firsttransfer;
  wire             push_buttons_s1_reset_n;
  reg              push_buttons_s1_slavearbiterlockenable;
  wire             push_buttons_s1_slavearbiterlockenable2;
  wire             push_buttons_s1_unreg_firsttransfer;
  wire             push_buttons_s1_waits_for_read;
  wire             push_buttons_s1_waits_for_write;
  wire             push_buttons_s1_write_n;
  wire    [  3: 0] push_buttons_s1_writedata;
  wire    [ 24: 0] shifted_address_to_push_buttons_s1_from_cpu_0_data_master;
  wire             wait_for_push_buttons_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~push_buttons_s1_end_xfer;
    end


  assign push_buttons_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_push_buttons_s1));
  //assign push_buttons_s1_readdata_from_sa = push_buttons_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign push_buttons_s1_readdata_from_sa = push_buttons_s1_readdata;

  assign cpu_0_data_master_requests_push_buttons_s1 = ({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101070) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //push_buttons_s1_arb_share_counter set values, which is an e_mux
  assign push_buttons_s1_arb_share_set_values = 1;

  //push_buttons_s1_non_bursting_master_requests mux, which is an e_mux
  assign push_buttons_s1_non_bursting_master_requests = cpu_0_data_master_requests_push_buttons_s1;

  //push_buttons_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign push_buttons_s1_any_bursting_master_saved_grant = 0;

  //push_buttons_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign push_buttons_s1_arb_share_counter_next_value = push_buttons_s1_firsttransfer ? (push_buttons_s1_arb_share_set_values - 1) : |push_buttons_s1_arb_share_counter ? (push_buttons_s1_arb_share_counter - 1) : 0;

  //push_buttons_s1_allgrants all slave grants, which is an e_mux
  assign push_buttons_s1_allgrants = |push_buttons_s1_grant_vector;

  //push_buttons_s1_end_xfer assignment, which is an e_assign
  assign push_buttons_s1_end_xfer = ~(push_buttons_s1_waits_for_read | push_buttons_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_push_buttons_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_push_buttons_s1 = push_buttons_s1_end_xfer & (~push_buttons_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //push_buttons_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign push_buttons_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_push_buttons_s1 & push_buttons_s1_allgrants) | (end_xfer_arb_share_counter_term_push_buttons_s1 & ~push_buttons_s1_non_bursting_master_requests);

  //push_buttons_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_buttons_s1_arb_share_counter <= 0;
      else if (push_buttons_s1_arb_counter_enable)
          push_buttons_s1_arb_share_counter <= push_buttons_s1_arb_share_counter_next_value;
    end


  //push_buttons_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_buttons_s1_slavearbiterlockenable <= 0;
      else if ((|push_buttons_s1_master_qreq_vector & end_xfer_arb_share_counter_term_push_buttons_s1) | (end_xfer_arb_share_counter_term_push_buttons_s1 & ~push_buttons_s1_non_bursting_master_requests))
          push_buttons_s1_slavearbiterlockenable <= |push_buttons_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master push_buttons/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = push_buttons_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //push_buttons_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign push_buttons_s1_slavearbiterlockenable2 = |push_buttons_s1_arb_share_counter_next_value;

  //cpu_0/data_master push_buttons/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = push_buttons_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //push_buttons_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign push_buttons_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_push_buttons_s1 = cpu_0_data_master_requests_push_buttons_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_push_buttons_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_push_buttons_s1 = cpu_0_data_master_granted_push_buttons_s1 & cpu_0_data_master_read & ~push_buttons_s1_waits_for_read;

  //push_buttons_s1_writedata mux, which is an e_mux
  assign push_buttons_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_push_buttons_s1 = cpu_0_data_master_qualified_request_push_buttons_s1;

  //cpu_0/data_master saved-grant push_buttons/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_push_buttons_s1 = cpu_0_data_master_requests_push_buttons_s1;

  //allow new arb cycle for push_buttons/s1, which is an e_assign
  assign push_buttons_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign push_buttons_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign push_buttons_s1_master_qreq_vector = 1;

  //push_buttons_s1_reset_n assignment, which is an e_assign
  assign push_buttons_s1_reset_n = reset_n;

  assign push_buttons_s1_chipselect = cpu_0_data_master_granted_push_buttons_s1;
  //push_buttons_s1_firsttransfer first transaction, which is an e_assign
  assign push_buttons_s1_firsttransfer = push_buttons_s1_begins_xfer ? push_buttons_s1_unreg_firsttransfer : push_buttons_s1_reg_firsttransfer;

  //push_buttons_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign push_buttons_s1_unreg_firsttransfer = ~(push_buttons_s1_slavearbiterlockenable & push_buttons_s1_any_continuerequest);

  //push_buttons_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          push_buttons_s1_reg_firsttransfer <= 1'b1;
      else if (push_buttons_s1_begins_xfer)
          push_buttons_s1_reg_firsttransfer <= push_buttons_s1_unreg_firsttransfer;
    end


  //push_buttons_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign push_buttons_s1_beginbursttransfer_internal = push_buttons_s1_begins_xfer;

  //~push_buttons_s1_write_n assignment, which is an e_mux
  assign push_buttons_s1_write_n = ~(cpu_0_data_master_granted_push_buttons_s1 & cpu_0_data_master_write);

  assign shifted_address_to_push_buttons_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //push_buttons_s1_address mux, which is an e_mux
  assign push_buttons_s1_address = shifted_address_to_push_buttons_s1_from_cpu_0_data_master >> 2;

  //d1_push_buttons_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_push_buttons_s1_end_xfer <= 1;
      else 
        d1_push_buttons_s1_end_xfer <= push_buttons_s1_end_xfer;
    end


  //push_buttons_s1_waits_for_read in a cycle, which is an e_mux
  assign push_buttons_s1_waits_for_read = push_buttons_s1_in_a_read_cycle & push_buttons_s1_begins_xfer;

  //push_buttons_s1_in_a_read_cycle assignment, which is an e_assign
  assign push_buttons_s1_in_a_read_cycle = cpu_0_data_master_granted_push_buttons_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = push_buttons_s1_in_a_read_cycle;

  //push_buttons_s1_waits_for_write in a cycle, which is an e_mux
  assign push_buttons_s1_waits_for_write = push_buttons_s1_in_a_write_cycle & 0;

  //push_buttons_s1_in_a_write_cycle assignment, which is an e_assign
  assign push_buttons_s1_in_a_write_cycle = cpu_0_data_master_granted_push_buttons_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = push_buttons_s1_in_a_write_cycle;

  assign wait_for_push_buttons_s1_counter = 0;
  //assign push_buttons_s1_irq_from_sa = push_buttons_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign push_buttons_s1_irq_from_sa = push_buttons_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //push_buttons/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module (
                                                             // inputs:
                                                              clear_fifo,
                                                              clk,
                                                              data_in,
                                                              read,
                                                              reset_n,
                                                              sync_reset,
                                                              write,

                                                             // outputs:
                                                              data_out,
                                                              empty,
                                                              fifo_contains_ones_n,
                                                              full
                                                           )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module (
                                                                    // inputs:
                                                                     clear_fifo,
                                                                     clk,
                                                                     data_in,
                                                                     read,
                                                                     reset_n,
                                                                     sync_reset,
                                                                     write,

                                                                    // outputs:
                                                                     data_out,
                                                                     empty,
                                                                     fifo_contains_ones_n,
                                                                     full
                                                                  )
;

  output           data_out;
  output           empty;
  output           fifo_contains_ones_n;
  output           full;
  input            clear_fifo;
  input            clk;
  input            data_in;
  input            read;
  input            reset_n;
  input            sync_reset;
  input            write;

  wire             data_out;
  wire             empty;
  reg              fifo_contains_ones_n;
  wire             full;
  reg              full_0;
  reg              full_1;
  reg              full_2;
  reg              full_3;
  reg              full_4;
  reg              full_5;
  reg              full_6;
  wire             full_7;
  reg     [  3: 0] how_many_ones;
  wire    [  3: 0] one_count_minus_one;
  wire    [  3: 0] one_count_plus_one;
  wire             p0_full_0;
  wire             p0_stage_0;
  wire             p1_full_1;
  wire             p1_stage_1;
  wire             p2_full_2;
  wire             p2_stage_2;
  wire             p3_full_3;
  wire             p3_stage_3;
  wire             p4_full_4;
  wire             p4_stage_4;
  wire             p5_full_5;
  wire             p5_stage_5;
  wire             p6_full_6;
  wire             p6_stage_6;
  reg              stage_0;
  reg              stage_1;
  reg              stage_2;
  reg              stage_3;
  reg              stage_4;
  reg              stage_5;
  reg              stage_6;
  wire    [  3: 0] updated_one_count;
  assign data_out = stage_0;
  assign full = full_6;
  assign empty = !full_0;
  assign full_7 = 0;
  //data_6, which is an e_mux
  assign p6_stage_6 = ((full_7 & ~clear_fifo) == 0)? data_in :
    data_in;

  //data_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_6 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_6))
          if (sync_reset & full_6 & !((full_7 == 0) & read & write))
              stage_6 <= 0;
          else 
            stage_6 <= p6_stage_6;
    end


  //control_6, which is an e_mux
  assign p6_full_6 = ((read & !write) == 0)? full_5 :
    0;

  //control_reg_6, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_6 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_6 <= 0;
          else 
            full_6 <= p6_full_6;
    end


  //data_5, which is an e_mux
  assign p5_stage_5 = ((full_6 & ~clear_fifo) == 0)? data_in :
    stage_6;

  //data_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_5 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_5))
          if (sync_reset & full_5 & !((full_6 == 0) & read & write))
              stage_5 <= 0;
          else 
            stage_5 <= p5_stage_5;
    end


  //control_5, which is an e_mux
  assign p5_full_5 = ((read & !write) == 0)? full_4 :
    full_6;

  //control_reg_5, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_5 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_5 <= 0;
          else 
            full_5 <= p5_full_5;
    end


  //data_4, which is an e_mux
  assign p4_stage_4 = ((full_5 & ~clear_fifo) == 0)? data_in :
    stage_5;

  //data_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_4 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_4))
          if (sync_reset & full_4 & !((full_5 == 0) & read & write))
              stage_4 <= 0;
          else 
            stage_4 <= p4_stage_4;
    end


  //control_4, which is an e_mux
  assign p4_full_4 = ((read & !write) == 0)? full_3 :
    full_5;

  //control_reg_4, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_4 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_4 <= 0;
          else 
            full_4 <= p4_full_4;
    end


  //data_3, which is an e_mux
  assign p3_stage_3 = ((full_4 & ~clear_fifo) == 0)? data_in :
    stage_4;

  //data_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_3 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_3))
          if (sync_reset & full_3 & !((full_4 == 0) & read & write))
              stage_3 <= 0;
          else 
            stage_3 <= p3_stage_3;
    end


  //control_3, which is an e_mux
  assign p3_full_3 = ((read & !write) == 0)? full_2 :
    full_4;

  //control_reg_3, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_3 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_3 <= 0;
          else 
            full_3 <= p3_full_3;
    end


  //data_2, which is an e_mux
  assign p2_stage_2 = ((full_3 & ~clear_fifo) == 0)? data_in :
    stage_3;

  //data_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_2 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_2))
          if (sync_reset & full_2 & !((full_3 == 0) & read & write))
              stage_2 <= 0;
          else 
            stage_2 <= p2_stage_2;
    end


  //control_2, which is an e_mux
  assign p2_full_2 = ((read & !write) == 0)? full_1 :
    full_3;

  //control_reg_2, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_2 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_2 <= 0;
          else 
            full_2 <= p2_full_2;
    end


  //data_1, which is an e_mux
  assign p1_stage_1 = ((full_2 & ~clear_fifo) == 0)? data_in :
    stage_2;

  //data_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_1 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_1))
          if (sync_reset & full_1 & !((full_2 == 0) & read & write))
              stage_1 <= 0;
          else 
            stage_1 <= p1_stage_1;
    end


  //control_1, which is an e_mux
  assign p1_full_1 = ((read & !write) == 0)? full_0 :
    full_2;

  //control_reg_1, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_1 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo)
              full_1 <= 0;
          else 
            full_1 <= p1_full_1;
    end


  //data_0, which is an e_mux
  assign p0_stage_0 = ((full_1 & ~clear_fifo) == 0)? data_in :
    stage_1;

  //data_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          stage_0 <= 0;
      else if (clear_fifo | sync_reset | read | (write & !full_0))
          if (sync_reset & full_0 & !((full_1 == 0) & read & write))
              stage_0 <= 0;
          else 
            stage_0 <= p0_stage_0;
    end


  //control_0, which is an e_mux
  assign p0_full_0 = ((read & !write) == 0)? 1 :
    full_1;

  //control_reg_0, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          full_0 <= 0;
      else if (clear_fifo | (read ^ write) | (write & !full_0))
          if (clear_fifo & ~write)
              full_0 <= 0;
          else 
            full_0 <= p0_full_0;
    end


  assign one_count_plus_one = how_many_ones + 1;
  assign one_count_minus_one = how_many_ones - 1;
  //updated_one_count, which is an e_mux
  assign updated_one_count = ((((clear_fifo | sync_reset) & !write)))? 0 :
    ((((clear_fifo | sync_reset) & write)))? |data_in :
    ((read & (|data_in) & write & (|stage_0)))? how_many_ones :
    ((write & (|data_in)))? one_count_plus_one :
    ((read & (|stage_0)))? one_count_minus_one :
    how_many_ones;

  //counts how many ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          how_many_ones <= 0;
      else if (clear_fifo | sync_reset | read | write)
          how_many_ones <= updated_one_count;
    end


  //this fifo contains ones in the data pipeline, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          fifo_contains_ones_n <= 1;
      else if (clear_fifo | sync_reset | read | write)
          fifo_contains_ones_n <= ~(|updated_one_count);
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sdram_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_byteenable,
                                cpu_0_data_master_dbs_address,
                                cpu_0_data_master_dbs_write_16,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_write,
                                cpu_0_instruction_master_address_to_slave,
                                cpu_0_instruction_master_dbs_address,
                                cpu_0_instruction_master_latency_counter,
                                cpu_0_instruction_master_read,
                                reset_n,
                                sdram_0_s1_readdata,
                                sdram_0_s1_readdatavalid,
                                sdram_0_s1_waitrequest,

                               // outputs:
                                cpu_0_data_master_byteenable_sdram_0_s1,
                                cpu_0_data_master_granted_sdram_0_s1,
                                cpu_0_data_master_qualified_request_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_requests_sdram_0_s1,
                                cpu_0_instruction_master_granted_sdram_0_s1,
                                cpu_0_instruction_master_qualified_request_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1,
                                cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_instruction_master_requests_sdram_0_s1,
                                d1_sdram_0_s1_end_xfer,
                                sdram_0_s1_address,
                                sdram_0_s1_byteenable_n,
                                sdram_0_s1_chipselect,
                                sdram_0_s1_read_n,
                                sdram_0_s1_readdata_from_sa,
                                sdram_0_s1_reset_n,
                                sdram_0_s1_waitrequest_from_sa,
                                sdram_0_s1_write_n,
                                sdram_0_s1_writedata
                             )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  output           cpu_0_data_master_granted_sdram_0_s1;
  output           cpu_0_data_master_qualified_request_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1;
  output           cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_data_master_requests_sdram_0_s1;
  output           cpu_0_instruction_master_granted_sdram_0_s1;
  output           cpu_0_instruction_master_qualified_request_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  output           cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  output           cpu_0_instruction_master_requests_sdram_0_s1;
  output           d1_sdram_0_s1_end_xfer;
  output  [ 21: 0] sdram_0_s1_address;
  output  [  1: 0] sdram_0_s1_byteenable_n;
  output           sdram_0_s1_chipselect;
  output           sdram_0_s1_read_n;
  output  [ 15: 0] sdram_0_s1_readdata_from_sa;
  output           sdram_0_s1_reset_n;
  output           sdram_0_s1_waitrequest_from_sa;
  output           sdram_0_s1_write_n;
  output  [ 15: 0] sdram_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            reset_n;
  input   [ 15: 0] sdram_0_s1_readdata;
  input            sdram_0_s1_readdatavalid;
  input            sdram_0_s1_waitrequest;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_saved_grant_sdram_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  wire             cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_saved_grant_sdram_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_sdram_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sdram_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
  wire    [ 21: 0] sdram_0_s1_address;
  wire             sdram_0_s1_allgrants;
  wire             sdram_0_s1_allow_new_arb_cycle;
  wire             sdram_0_s1_any_bursting_master_saved_grant;
  wire             sdram_0_s1_any_continuerequest;
  reg     [  1: 0] sdram_0_s1_arb_addend;
  wire             sdram_0_s1_arb_counter_enable;
  reg     [  1: 0] sdram_0_s1_arb_share_counter;
  wire    [  1: 0] sdram_0_s1_arb_share_counter_next_value;
  wire    [  1: 0] sdram_0_s1_arb_share_set_values;
  wire    [  1: 0] sdram_0_s1_arb_winner;
  wire             sdram_0_s1_arbitration_holdoff_internal;
  wire             sdram_0_s1_beginbursttransfer_internal;
  wire             sdram_0_s1_begins_xfer;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire    [  3: 0] sdram_0_s1_chosen_master_double_vector;
  wire    [  1: 0] sdram_0_s1_chosen_master_rot_left;
  wire             sdram_0_s1_end_xfer;
  wire             sdram_0_s1_firsttransfer;
  wire    [  1: 0] sdram_0_s1_grant_vector;
  wire             sdram_0_s1_in_a_read_cycle;
  wire             sdram_0_s1_in_a_write_cycle;
  wire    [  1: 0] sdram_0_s1_master_qreq_vector;
  wire             sdram_0_s1_move_on_to_next_transaction;
  wire             sdram_0_s1_non_bursting_master_requests;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid_from_sa;
  reg              sdram_0_s1_reg_firsttransfer;
  wire             sdram_0_s1_reset_n;
  reg     [  1: 0] sdram_0_s1_saved_chosen_master_vector;
  reg              sdram_0_s1_slavearbiterlockenable;
  wire             sdram_0_s1_slavearbiterlockenable2;
  wire             sdram_0_s1_unreg_firsttransfer;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_waits_for_read;
  wire             sdram_0_s1_waits_for_write;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_sdram_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sdram_0_s1_end_xfer;
    end


  assign sdram_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sdram_0_s1 | cpu_0_instruction_master_qualified_request_sdram_0_s1));
  //assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdatavalid_from_sa = sdram_0_s1_readdatavalid;

  //assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_readdata_from_sa = sdram_0_s1_readdata;

  assign cpu_0_data_master_requests_sdram_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sdram_0_s1_waitrequest_from_sa = sdram_0_s1_waitrequest;

  //sdram_0_s1_arb_share_counter set values, which is an e_mux
  assign sdram_0_s1_arb_share_set_values = (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    (cpu_0_data_master_granted_sdram_0_s1)? 2 :
    (cpu_0_instruction_master_granted_sdram_0_s1)? 2 :
    1;

  //sdram_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign sdram_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1 |
    cpu_0_data_master_requests_sdram_0_s1 |
    cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign sdram_0_s1_any_bursting_master_saved_grant = 0;

  //sdram_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign sdram_0_s1_arb_share_counter_next_value = sdram_0_s1_firsttransfer ? (sdram_0_s1_arb_share_set_values - 1) : |sdram_0_s1_arb_share_counter ? (sdram_0_s1_arb_share_counter - 1) : 0;

  //sdram_0_s1_allgrants all slave grants, which is an e_mux
  assign sdram_0_s1_allgrants = (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector) |
    (|sdram_0_s1_grant_vector);

  //sdram_0_s1_end_xfer assignment, which is an e_assign
  assign sdram_0_s1_end_xfer = ~(sdram_0_s1_waits_for_read | sdram_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_sdram_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sdram_0_s1 = sdram_0_s1_end_xfer & (~sdram_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sdram_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign sdram_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_sdram_0_s1 & sdram_0_s1_allgrants) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests);

  //sdram_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_share_counter <= 0;
      else if (sdram_0_s1_arb_counter_enable)
          sdram_0_s1_arb_share_counter <= sdram_0_s1_arb_share_counter_next_value;
    end


  //sdram_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_slavearbiterlockenable <= 0;
      else if ((|sdram_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_sdram_0_s1) | (end_xfer_arb_share_counter_term_sdram_0_s1 & ~sdram_0_s1_non_bursting_master_requests))
          sdram_0_s1_slavearbiterlockenable <= |sdram_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sdram_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sdram_0_s1_slavearbiterlockenable2 = |sdram_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sdram_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sdram_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sdram_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 <= cpu_0_instruction_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_sdram_0_s1 & cpu_0_instruction_master_requests_sdram_0_s1;

  //sdram_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sdram_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_sdram_0_s1 = cpu_0_data_master_requests_sdram_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (1 < cpu_0_data_master_latency_counter))) | ((!cpu_0_data_master_byteenable_sdram_0_s1) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //unique name for sdram_0_s1_move_on_to_next_transaction, which is an e_assign
  assign sdram_0_s1_move_on_to_next_transaction = sdram_0_s1_readdatavalid_from_sa;

  //rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_data_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_data_master_granted_sdram_0_s1),
      .data_out             (cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_data_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_data_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_data_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_data_master_rdv_fifo_empty_sdram_0_s1;

  //sdram_0_s1_writedata mux, which is an e_mux
  assign sdram_0_s1_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sdram_0_s1 = (({cpu_0_instruction_master_address_to_slave[24 : 23] , 23'b0} == 25'h800000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sdram_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 <= cpu_0_data_master_saved_grant_sdram_0_s1 ? 1 : (sdram_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sdram_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_sdram_0_s1 & cpu_0_data_master_requests_sdram_0_s1;

  assign cpu_0_instruction_master_qualified_request_sdram_0_s1 = cpu_0_instruction_master_requests_sdram_0_s1 & ~((cpu_0_instruction_master_read & ((cpu_0_instruction_master_latency_counter != 0) | (1 < cpu_0_instruction_master_latency_counter))) | cpu_0_data_master_arbiterlock);
  //rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1_module rdv_fifo_for_cpu_0_instruction_master_to_sdram_0_s1
    (
      .clear_fifo           (1'b0),
      .clk                  (clk),
      .data_in              (cpu_0_instruction_master_granted_sdram_0_s1),
      .data_out             (cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1),
      .empty                (),
      .fifo_contains_ones_n (cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1),
      .full                 (),
      .read                 (sdram_0_s1_move_on_to_next_transaction),
      .reset_n              (reset_n),
      .sync_reset           (1'b0),
      .write                (in_a_read_cycle & ~sdram_0_s1_waits_for_read)
    );

  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register = ~cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;
  //local readdatavalid cpu_0_instruction_master_read_data_valid_sdram_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sdram_0_s1 = (sdram_0_s1_readdatavalid_from_sa & cpu_0_instruction_master_rdv_fifo_output_from_sdram_0_s1) & ~ cpu_0_instruction_master_rdv_fifo_empty_sdram_0_s1;

  //allow new arb cycle for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_sdram_0_s1;

  //cpu_0/instruction_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_sdram_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for sdram_0/s1, which is an e_assign
  assign sdram_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_sdram_0_s1;

  //cpu_0/data_master grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_sdram_0_s1 = sdram_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant sdram_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_sdram_0_s1 = sdram_0_s1_arb_winner[1] && cpu_0_data_master_requests_sdram_0_s1;

  //sdram_0/s1 chosen-master double-vector, which is an e_assign
  assign sdram_0_s1_chosen_master_double_vector = {sdram_0_s1_master_qreq_vector, sdram_0_s1_master_qreq_vector} & ({~sdram_0_s1_master_qreq_vector, ~sdram_0_s1_master_qreq_vector} + sdram_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign sdram_0_s1_arb_winner = (sdram_0_s1_allow_new_arb_cycle & | sdram_0_s1_grant_vector) ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;

  //saved sdram_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_saved_chosen_master_vector <= 0;
      else if (sdram_0_s1_allow_new_arb_cycle)
          sdram_0_s1_saved_chosen_master_vector <= |sdram_0_s1_grant_vector ? sdram_0_s1_grant_vector : sdram_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sdram_0_s1_grant_vector = {(sdram_0_s1_chosen_master_double_vector[1] | sdram_0_s1_chosen_master_double_vector[3]),
    (sdram_0_s1_chosen_master_double_vector[0] | sdram_0_s1_chosen_master_double_vector[2])};

  //sdram_0/s1 chosen master rotated left, which is an e_assign
  assign sdram_0_s1_chosen_master_rot_left = (sdram_0_s1_arb_winner << 1) ? (sdram_0_s1_arb_winner << 1) : 1;

  //sdram_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_arb_addend <= 1;
      else if (|sdram_0_s1_grant_vector)
          sdram_0_s1_arb_addend <= sdram_0_s1_end_xfer? sdram_0_s1_chosen_master_rot_left : sdram_0_s1_grant_vector;
    end


  //sdram_0_s1_reset_n assignment, which is an e_assign
  assign sdram_0_s1_reset_n = reset_n;

  assign sdram_0_s1_chipselect = cpu_0_data_master_granted_sdram_0_s1 | cpu_0_instruction_master_granted_sdram_0_s1;
  //sdram_0_s1_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_firsttransfer = sdram_0_s1_begins_xfer ? sdram_0_s1_unreg_firsttransfer : sdram_0_s1_reg_firsttransfer;

  //sdram_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign sdram_0_s1_unreg_firsttransfer = ~(sdram_0_s1_slavearbiterlockenable & sdram_0_s1_any_continuerequest);

  //sdram_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sdram_0_s1_reg_firsttransfer <= 1'b1;
      else if (sdram_0_s1_begins_xfer)
          sdram_0_s1_reg_firsttransfer <= sdram_0_s1_unreg_firsttransfer;
    end


  //sdram_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sdram_0_s1_beginbursttransfer_internal = sdram_0_s1_begins_xfer;

  //sdram_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sdram_0_s1_arbitration_holdoff_internal = sdram_0_s1_begins_xfer & sdram_0_s1_firsttransfer;

  //~sdram_0_s1_read_n assignment, which is an e_mux
  assign sdram_0_s1_read_n = ~((cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read));

  //~sdram_0_s1_write_n assignment, which is an e_mux
  assign sdram_0_s1_write_n = ~(cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sdram_0_s1_address mux, which is an e_mux
  assign sdram_0_s1_address = (cpu_0_data_master_granted_sdram_0_s1)? (shifted_address_to_sdram_0_s1_from_cpu_0_data_master >> 1) :
    (shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master >> 1);

  assign shifted_address_to_sdram_0_s1_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  //d1_sdram_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sdram_0_s1_end_xfer <= 1;
      else 
        d1_sdram_0_s1_end_xfer <= sdram_0_s1_end_xfer;
    end


  //sdram_0_s1_waits_for_read in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_read = sdram_0_s1_in_a_read_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sdram_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sdram_0_s1_in_a_read_cycle;

  //sdram_0_s1_waits_for_write in a cycle, which is an e_mux
  assign sdram_0_s1_waits_for_write = sdram_0_s1_in_a_write_cycle & sdram_0_s1_waitrequest_from_sa;

  //sdram_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign sdram_0_s1_in_a_write_cycle = cpu_0_data_master_granted_sdram_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sdram_0_s1_in_a_write_cycle;

  assign wait_for_sdram_0_s1_counter = 0;
  //~sdram_0_s1_byteenable_n byte enable port mux, which is an e_mux
  assign sdram_0_s1_byteenable_n = ~((cpu_0_data_master_granted_sdram_0_s1)? cpu_0_data_master_byteenable_sdram_0_s1 :
    -1);

  assign {cpu_0_data_master_byteenable_sdram_0_s1_segment_1,
cpu_0_data_master_byteenable_sdram_0_s1_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sdram_0_s1 = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sdram_0_s1_segment_0 :
    cpu_0_data_master_byteenable_sdram_0_s1_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sdram_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sdram_0_s1 + cpu_0_instruction_master_granted_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sdram_0_s1 + cpu_0_instruction_master_saved_grant_sdram_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sram_0_avalon_sram_slave_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_data_master_address_to_slave,
                                              cpu_0_data_master_byteenable,
                                              cpu_0_data_master_dbs_address,
                                              cpu_0_data_master_dbs_write_16,
                                              cpu_0_data_master_latency_counter,
                                              cpu_0_data_master_read,
                                              cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                              cpu_0_data_master_write,
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_dbs_address,
                                              cpu_0_instruction_master_latency_counter,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register,
                                              pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave,
                                              pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock,
                                              pixel_buffer_0_avalon_pixel_buffer_master_latency_counter,
                                              pixel_buffer_0_avalon_pixel_buffer_master_read,
                                              reset_n,
                                              sram_0_avalon_sram_slave_readdata,

                                             // outputs:
                                              cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_data_master_requests_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
                                              cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
                                              d1_sram_0_avalon_sram_slave_end_xfer,
                                              pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave,
                                              pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave,
                                              pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave,
                                              pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave,
                                              sram_0_avalon_sram_slave_address,
                                              sram_0_avalon_sram_slave_byteenable,
                                              sram_0_avalon_sram_slave_read,
                                              sram_0_avalon_sram_slave_readdata_from_sa,
                                              sram_0_avalon_sram_slave_reset,
                                              sram_0_avalon_sram_slave_write,
                                              sram_0_avalon_sram_slave_writedata
                                           )
;

  output  [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  output           cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  output           cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  output           d1_sram_0_avalon_sram_slave_end_xfer;
  output           pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave;
  output           pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave;
  output           pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave;
  output           pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;
  output  [ 17: 0] sram_0_avalon_sram_slave_address;
  output  [  1: 0] sram_0_avalon_sram_slave_byteenable;
  output           sram_0_avalon_sram_slave_read;
  output  [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  output           sram_0_avalon_sram_slave_reset;
  output           sram_0_avalon_sram_slave_write;
  output  [ 15: 0] sram_0_avalon_sram_slave_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input   [  1: 0] cpu_0_data_master_dbs_address;
  input   [ 15: 0] cpu_0_data_master_dbs_write_16;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 24: 0] cpu_0_instruction_master_address_to_slave;
  input   [  1: 0] cpu_0_instruction_master_dbs_address;
  input   [  1: 0] cpu_0_instruction_master_latency_counter;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  input   [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave;
  input            pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock;
  input   [  1: 0] pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
  input            pixel_buffer_0_avalon_pixel_buffer_master_read;
  input            reset_n;
  input   [ 15: 0] sram_0_avalon_sram_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  reg     [  1: 0] cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in;
  wire             cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  reg     [  1: 0] cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in;
  wire             cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sram_0_avalon_sram_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave;
  reg              last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave;
  wire    [  1: 0] p1_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire    [  1: 0] p1_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire    [  1: 0] p1_pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock2;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_continuerequest;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave;
  reg     [  1: 0] pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_saved_grant_sram_0_avalon_sram_slave;
  wire             saved_chosen_master_btw_pixel_buffer_0_avalon_pixel_buffer_master_and_sram_0_avalon_sram_slave;
  wire    [ 24: 0] shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master;
  wire    [ 24: 0] shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master;
  wire    [ 31: 0] shifted_address_to_sram_0_avalon_sram_slave_from_pixel_buffer_0_avalon_pixel_buffer_master;
  wire    [ 17: 0] sram_0_avalon_sram_slave_address;
  wire             sram_0_avalon_sram_slave_allgrants;
  wire             sram_0_avalon_sram_slave_allow_new_arb_cycle;
  wire             sram_0_avalon_sram_slave_any_bursting_master_saved_grant;
  wire             sram_0_avalon_sram_slave_any_continuerequest;
  reg     [  2: 0] sram_0_avalon_sram_slave_arb_addend;
  wire             sram_0_avalon_sram_slave_arb_counter_enable;
  reg     [  1: 0] sram_0_avalon_sram_slave_arb_share_counter;
  wire    [  1: 0] sram_0_avalon_sram_slave_arb_share_counter_next_value;
  wire    [  1: 0] sram_0_avalon_sram_slave_arb_share_set_values;
  wire    [  2: 0] sram_0_avalon_sram_slave_arb_winner;
  wire             sram_0_avalon_sram_slave_arbitration_holdoff_internal;
  wire             sram_0_avalon_sram_slave_beginbursttransfer_internal;
  wire             sram_0_avalon_sram_slave_begins_xfer;
  wire    [  1: 0] sram_0_avalon_sram_slave_byteenable;
  wire    [  5: 0] sram_0_avalon_sram_slave_chosen_master_double_vector;
  wire    [  2: 0] sram_0_avalon_sram_slave_chosen_master_rot_left;
  wire             sram_0_avalon_sram_slave_end_xfer;
  wire             sram_0_avalon_sram_slave_firsttransfer;
  wire    [  2: 0] sram_0_avalon_sram_slave_grant_vector;
  wire             sram_0_avalon_sram_slave_in_a_read_cycle;
  wire             sram_0_avalon_sram_slave_in_a_write_cycle;
  wire    [  2: 0] sram_0_avalon_sram_slave_master_qreq_vector;
  wire             sram_0_avalon_sram_slave_non_bursting_master_requests;
  wire             sram_0_avalon_sram_slave_read;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  reg              sram_0_avalon_sram_slave_reg_firsttransfer;
  wire             sram_0_avalon_sram_slave_reset;
  reg     [  2: 0] sram_0_avalon_sram_slave_saved_chosen_master_vector;
  reg              sram_0_avalon_sram_slave_slavearbiterlockenable;
  wire             sram_0_avalon_sram_slave_slavearbiterlockenable2;
  wire             sram_0_avalon_sram_slave_unreg_firsttransfer;
  wire             sram_0_avalon_sram_slave_waits_for_read;
  wire             sram_0_avalon_sram_slave_waits_for_write;
  wire             sram_0_avalon_sram_slave_write;
  wire    [ 15: 0] sram_0_avalon_sram_slave_writedata;
  wire             wait_for_sram_0_avalon_sram_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sram_0_avalon_sram_slave_end_xfer;
    end


  assign sram_0_avalon_sram_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave | cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave | pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave));
  //assign sram_0_avalon_sram_slave_readdata_from_sa = sram_0_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sram_0_avalon_sram_slave_readdata_from_sa = sram_0_avalon_sram_slave_readdata;

  assign cpu_0_data_master_requests_sram_0_avalon_sram_slave = ({cpu_0_data_master_address_to_slave[24 : 19] , 19'b0} == 25'h1080000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //sram_0_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  assign sram_0_avalon_sram_slave_arb_share_set_values = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? 2 :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? 2 :
    1;

  //sram_0_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  assign sram_0_avalon_sram_slave_non_bursting_master_requests = cpu_0_data_master_requests_sram_0_avalon_sram_slave |
    cpu_0_instruction_master_requests_sram_0_avalon_sram_slave |
    pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave |
    cpu_0_data_master_requests_sram_0_avalon_sram_slave |
    cpu_0_instruction_master_requests_sram_0_avalon_sram_slave |
    pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave |
    cpu_0_data_master_requests_sram_0_avalon_sram_slave |
    cpu_0_instruction_master_requests_sram_0_avalon_sram_slave |
    pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;

  //sram_0_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sram_0_avalon_sram_slave_any_bursting_master_saved_grant = 0;

  //sram_0_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_arb_share_counter_next_value = sram_0_avalon_sram_slave_firsttransfer ? (sram_0_avalon_sram_slave_arb_share_set_values - 1) : |sram_0_avalon_sram_slave_arb_share_counter ? (sram_0_avalon_sram_slave_arb_share_counter - 1) : 0;

  //sram_0_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  assign sram_0_avalon_sram_slave_allgrants = (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector) |
    (|sram_0_avalon_sram_slave_grant_vector);

  //sram_0_avalon_sram_slave_end_xfer assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_end_xfer = ~(sram_0_avalon_sram_slave_waits_for_read | sram_0_avalon_sram_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_end_xfer & (~sram_0_avalon_sram_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sram_0_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sram_0_avalon_sram_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & sram_0_avalon_sram_slave_allgrants) | (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & ~sram_0_avalon_sram_slave_non_bursting_master_requests);

  //sram_0_avalon_sram_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_arb_share_counter <= 0;
      else if (sram_0_avalon_sram_slave_arb_counter_enable)
          sram_0_avalon_sram_slave_arb_share_counter <= sram_0_avalon_sram_slave_arb_share_counter_next_value;
    end


  //sram_0_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_slavearbiterlockenable <= 0;
      else if ((|sram_0_avalon_sram_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave) | (end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave & ~sram_0_avalon_sram_slave_non_bursting_master_requests))
          sram_0_avalon_sram_slave_slavearbiterlockenable <= |sram_0_avalon_sram_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sram_0_avalon_sram_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sram_0_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sram_0_avalon_sram_slave_slavearbiterlockenable2 = |sram_0_avalon_sram_slave_arb_share_counter_next_value;

  //cpu_0/data_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sram_0_avalon_sram_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = sram_0_avalon_sram_slave_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = sram_0_avalon_sram_slave_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted sram_0/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave ? 1 : (sram_0_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = (last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) |
    (last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_instruction_master_requests_sram_0_avalon_sram_slave);

  //sram_0_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  assign sram_0_avalon_sram_slave_any_continuerequest = cpu_0_instruction_master_continuerequest |
    pixel_buffer_0_avalon_pixel_buffer_master_continuerequest |
    cpu_0_data_master_continuerequest |
    pixel_buffer_0_avalon_pixel_buffer_master_continuerequest |
    cpu_0_data_master_continuerequest |
    cpu_0_instruction_master_continuerequest;

  //pixel_buffer_0/avalon_pixel_buffer_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock2 = sram_0_avalon_sram_slave_slavearbiterlockenable2 & pixel_buffer_0_avalon_pixel_buffer_master_continuerequest;

  //pixel_buffer_0/avalon_pixel_buffer_master granted sram_0/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave <= 0;
      else 
        last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave <= pixel_buffer_0_avalon_pixel_buffer_master_saved_grant_sram_0_avalon_sram_slave ? 1 : (sram_0_avalon_sram_slave_arbitration_holdoff_internal | ~pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave) ? 0 : last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave;
    end


  //pixel_buffer_0_avalon_pixel_buffer_master_continuerequest continued request, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_continuerequest = (last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave & pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave) |
    (last_cycle_pixel_buffer_0_avalon_pixel_buffer_master_granted_slave_sram_0_avalon_sram_slave & pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave);

  assign cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave = cpu_0_data_master_requests_sram_0_avalon_sram_slave & ~((cpu_0_data_master_read & ((2 < cpu_0_data_master_latency_counter) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))) | ((!cpu_0_data_master_byteenable_sram_0_avalon_sram_slave) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock | (pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock & (saved_chosen_master_btw_pixel_buffer_0_avalon_pixel_buffer_master_and_sram_0_avalon_sram_slave)));
  //cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in = cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read & ~sram_0_avalon_sram_slave_waits_for_read;

  //shift register p1 cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register = {cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register, cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in};

  //cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= p1_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave = cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register[1];

  //sram_0_avalon_sram_slave_writedata mux, which is an e_mux
  assign sram_0_avalon_sram_slave_writedata = cpu_0_data_master_dbs_write_16;

  assign cpu_0_instruction_master_requests_sram_0_avalon_sram_slave = (({cpu_0_instruction_master_address_to_slave[24 : 19] , 19'b0} == 25'h1080000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted sram_0/avalon_sram_slave last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave ? 1 : (sram_0_avalon_sram_slave_arbitration_holdoff_internal | ~cpu_0_data_master_requests_sram_0_avalon_sram_slave) ? 0 : last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = (last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_data_master_requests_sram_0_avalon_sram_slave) |
    (last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave & cpu_0_data_master_requests_sram_0_avalon_sram_slave);

  assign cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave = cpu_0_instruction_master_requests_sram_0_avalon_sram_slave & ~((cpu_0_instruction_master_read & ((2 < cpu_0_instruction_master_latency_counter) | (|cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register))) | cpu_0_data_master_arbiterlock | (pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock & (saved_chosen_master_btw_pixel_buffer_0_avalon_pixel_buffer_master_and_sram_0_avalon_sram_slave)));
  //cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in = cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read & ~sram_0_avalon_sram_slave_waits_for_read;

  //shift register p1 cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register = {cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register, cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= p1_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave = cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register[1];

  assign pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave = (({pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave[31 : 19] , 19'b0} == 32'h1080000) & (pixel_buffer_0_avalon_pixel_buffer_master_read)) & pixel_buffer_0_avalon_pixel_buffer_master_read;
  assign pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave = pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave & ~(cpu_0_data_master_arbiterlock | cpu_0_instruction_master_arbiterlock);
  //pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in = pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave & pixel_buffer_0_avalon_pixel_buffer_master_read & ~sram_0_avalon_sram_slave_waits_for_read;

  //shift register p1 pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register = {pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register, pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register_in};

  //pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= 0;
      else 
        pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= p1_pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
    end


  //local readdatavalid pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  assign pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave = pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave_shift_register[1];

  //allow new arb cycle for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock & ~(pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock & (saved_chosen_master_btw_pixel_buffer_0_avalon_pixel_buffer_master_and_sram_0_avalon_sram_slave));

  //pixel_buffer_0/avalon_pixel_buffer_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_master_qreq_vector[0] = pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave;

  //pixel_buffer_0/avalon_pixel_buffer_master grant sram_0/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_grant_vector[0];

  //pixel_buffer_0/avalon_pixel_buffer_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  assign pixel_buffer_0_avalon_pixel_buffer_master_saved_grant_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_arb_winner[0] && pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;

  //saved chosen master btw pixel_buffer_0/avalon_pixel_buffer_master and sram_0/avalon_sram_slave, which is an e_assign
  assign saved_chosen_master_btw_pixel_buffer_0_avalon_pixel_buffer_master_and_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_saved_chosen_master_vector[0];

  //cpu_0/instruction_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_master_qreq_vector[1] = cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;

  //cpu_0/instruction_master grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_instruction_master_granted_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_grant_vector[1];

  //cpu_0/instruction_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_arb_winner[1] && cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;

  //cpu_0/data_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  assign sram_0_avalon_sram_slave_master_qreq_vector[2] = cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;

  //cpu_0/data_master grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_data_master_granted_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_grant_vector[2];

  //cpu_0/data_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave = sram_0_avalon_sram_slave_arb_winner[2] && cpu_0_data_master_requests_sram_0_avalon_sram_slave;

  //sram_0/avalon_sram_slave chosen-master double-vector, which is an e_assign
  assign sram_0_avalon_sram_slave_chosen_master_double_vector = {sram_0_avalon_sram_slave_master_qreq_vector, sram_0_avalon_sram_slave_master_qreq_vector} & ({~sram_0_avalon_sram_slave_master_qreq_vector, ~sram_0_avalon_sram_slave_master_qreq_vector} + sram_0_avalon_sram_slave_arb_addend);

  //stable onehot encoding of arb winner
  assign sram_0_avalon_sram_slave_arb_winner = (sram_0_avalon_sram_slave_allow_new_arb_cycle & | sram_0_avalon_sram_slave_grant_vector) ? sram_0_avalon_sram_slave_grant_vector : sram_0_avalon_sram_slave_saved_chosen_master_vector;

  //saved sram_0_avalon_sram_slave_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_saved_chosen_master_vector <= 0;
      else if (sram_0_avalon_sram_slave_allow_new_arb_cycle)
          sram_0_avalon_sram_slave_saved_chosen_master_vector <= |sram_0_avalon_sram_slave_grant_vector ? sram_0_avalon_sram_slave_grant_vector : sram_0_avalon_sram_slave_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign sram_0_avalon_sram_slave_grant_vector = {(sram_0_avalon_sram_slave_chosen_master_double_vector[2] | sram_0_avalon_sram_slave_chosen_master_double_vector[5]),
    (sram_0_avalon_sram_slave_chosen_master_double_vector[1] | sram_0_avalon_sram_slave_chosen_master_double_vector[4]),
    (sram_0_avalon_sram_slave_chosen_master_double_vector[0] | sram_0_avalon_sram_slave_chosen_master_double_vector[3])};

  //sram_0/avalon_sram_slave chosen master rotated left, which is an e_assign
  assign sram_0_avalon_sram_slave_chosen_master_rot_left = (sram_0_avalon_sram_slave_arb_winner << 1) ? (sram_0_avalon_sram_slave_arb_winner << 1) : 1;

  //sram_0/avalon_sram_slave's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_arb_addend <= 1;
      else if (|sram_0_avalon_sram_slave_grant_vector)
          sram_0_avalon_sram_slave_arb_addend <= sram_0_avalon_sram_slave_end_xfer? sram_0_avalon_sram_slave_chosen_master_rot_left : sram_0_avalon_sram_slave_grant_vector;
    end


  //~sram_0_avalon_sram_slave_reset assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_reset = ~reset_n;

  //sram_0_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalon_sram_slave_firsttransfer = sram_0_avalon_sram_slave_begins_xfer ? sram_0_avalon_sram_slave_unreg_firsttransfer : sram_0_avalon_sram_slave_reg_firsttransfer;

  //sram_0_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sram_0_avalon_sram_slave_unreg_firsttransfer = ~(sram_0_avalon_sram_slave_slavearbiterlockenable & sram_0_avalon_sram_slave_any_continuerequest);

  //sram_0_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sram_0_avalon_sram_slave_reg_firsttransfer <= 1'b1;
      else if (sram_0_avalon_sram_slave_begins_xfer)
          sram_0_avalon_sram_slave_reg_firsttransfer <= sram_0_avalon_sram_slave_unreg_firsttransfer;
    end


  //sram_0_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sram_0_avalon_sram_slave_beginbursttransfer_internal = sram_0_avalon_sram_slave_begins_xfer;

  //sram_0_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign sram_0_avalon_sram_slave_arbitration_holdoff_internal = sram_0_avalon_sram_slave_begins_xfer & sram_0_avalon_sram_slave_firsttransfer;

  //sram_0_avalon_sram_slave_read assignment, which is an e_mux
  assign sram_0_avalon_sram_slave_read = (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read) | (pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave & pixel_buffer_0_avalon_pixel_buffer_master_read);

  //sram_0_avalon_sram_slave_write assignment, which is an e_mux
  assign sram_0_avalon_sram_slave_write = cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write;

  assign shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master = {cpu_0_data_master_address_to_slave >> 2,
    cpu_0_data_master_dbs_address[1],
    {1 {1'b0}}};

  //sram_0_avalon_sram_slave_address mux, which is an e_mux
  assign sram_0_avalon_sram_slave_address = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? (shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master >> 1) :
    (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)? (shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master >> 1) :
    (shifted_address_to_sram_0_avalon_sram_slave_from_pixel_buffer_0_avalon_pixel_buffer_master >> 1);

  assign shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master = {cpu_0_instruction_master_address_to_slave >> 2,
    cpu_0_instruction_master_dbs_address[1],
    {1 {1'b0}}};

  assign shifted_address_to_sram_0_avalon_sram_slave_from_pixel_buffer_0_avalon_pixel_buffer_master = pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave;
  //d1_sram_0_avalon_sram_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sram_0_avalon_sram_slave_end_xfer <= 1;
      else 
        d1_sram_0_avalon_sram_slave_end_xfer <= sram_0_avalon_sram_slave_end_xfer;
    end


  //sram_0_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  assign sram_0_avalon_sram_slave_waits_for_read = sram_0_avalon_sram_slave_in_a_read_cycle & 0;

  //sram_0_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_in_a_read_cycle = (cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave & cpu_0_instruction_master_read) | (pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave & pixel_buffer_0_avalon_pixel_buffer_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sram_0_avalon_sram_slave_in_a_read_cycle;

  //sram_0_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  assign sram_0_avalon_sram_slave_waits_for_write = sram_0_avalon_sram_slave_in_a_write_cycle & 0;

  //sram_0_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  assign sram_0_avalon_sram_slave_in_a_write_cycle = cpu_0_data_master_granted_sram_0_avalon_sram_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sram_0_avalon_sram_slave_in_a_write_cycle;

  assign wait_for_sram_0_avalon_sram_slave_counter = 0;
  //sram_0_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  assign sram_0_avalon_sram_slave_byteenable = (cpu_0_data_master_granted_sram_0_avalon_sram_slave)? cpu_0_data_master_byteenable_sram_0_avalon_sram_slave :
    -1;

  assign {cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1,
cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0} = cpu_0_data_master_byteenable;
  assign cpu_0_data_master_byteenable_sram_0_avalon_sram_slave = ((cpu_0_data_master_dbs_address[1] == 0))? cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0 :
    cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sram_0/avalon_sram_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_sram_0_avalon_sram_slave + cpu_0_instruction_master_granted_sram_0_avalon_sram_slave + pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave + cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave + pixel_buffer_0_avalon_pixel_buffer_master_saved_grant_sram_0_avalon_sram_slave > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module switches_s1_arbitrator (
                                // inputs:
                                 clk,
                                 cpu_0_data_master_address_to_slave,
                                 cpu_0_data_master_latency_counter,
                                 cpu_0_data_master_read,
                                 cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                 cpu_0_data_master_write,
                                 reset_n,
                                 switches_s1_readdata,

                                // outputs:
                                 cpu_0_data_master_granted_switches_s1,
                                 cpu_0_data_master_qualified_request_switches_s1,
                                 cpu_0_data_master_read_data_valid_switches_s1,
                                 cpu_0_data_master_requests_switches_s1,
                                 d1_switches_s1_end_xfer,
                                 switches_s1_address,
                                 switches_s1_readdata_from_sa,
                                 switches_s1_reset_n
                              )
;

  output           cpu_0_data_master_granted_switches_s1;
  output           cpu_0_data_master_qualified_request_switches_s1;
  output           cpu_0_data_master_read_data_valid_switches_s1;
  output           cpu_0_data_master_requests_switches_s1;
  output           d1_switches_s1_end_xfer;
  output  [  1: 0] switches_s1_address;
  output  [ 17: 0] switches_s1_readdata_from_sa;
  output           switches_s1_reset_n;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 17: 0] switches_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_switches_s1;
  wire             cpu_0_data_master_qualified_request_switches_s1;
  wire             cpu_0_data_master_read_data_valid_switches_s1;
  wire             cpu_0_data_master_requests_switches_s1;
  wire             cpu_0_data_master_saved_grant_switches_s1;
  reg              d1_reasons_to_wait;
  reg              d1_switches_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_switches_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_switches_s1_from_cpu_0_data_master;
  wire    [  1: 0] switches_s1_address;
  wire             switches_s1_allgrants;
  wire             switches_s1_allow_new_arb_cycle;
  wire             switches_s1_any_bursting_master_saved_grant;
  wire             switches_s1_any_continuerequest;
  wire             switches_s1_arb_counter_enable;
  reg     [  1: 0] switches_s1_arb_share_counter;
  wire    [  1: 0] switches_s1_arb_share_counter_next_value;
  wire    [  1: 0] switches_s1_arb_share_set_values;
  wire             switches_s1_beginbursttransfer_internal;
  wire             switches_s1_begins_xfer;
  wire             switches_s1_end_xfer;
  wire             switches_s1_firsttransfer;
  wire             switches_s1_grant_vector;
  wire             switches_s1_in_a_read_cycle;
  wire             switches_s1_in_a_write_cycle;
  wire             switches_s1_master_qreq_vector;
  wire             switches_s1_non_bursting_master_requests;
  wire    [ 17: 0] switches_s1_readdata_from_sa;
  reg              switches_s1_reg_firsttransfer;
  wire             switches_s1_reset_n;
  reg              switches_s1_slavearbiterlockenable;
  wire             switches_s1_slavearbiterlockenable2;
  wire             switches_s1_unreg_firsttransfer;
  wire             switches_s1_waits_for_read;
  wire             switches_s1_waits_for_write;
  wire             wait_for_switches_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~switches_s1_end_xfer;
    end


  assign switches_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_switches_s1));
  //assign switches_s1_readdata_from_sa = switches_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign switches_s1_readdata_from_sa = switches_s1_readdata;

  assign cpu_0_data_master_requests_switches_s1 = (({cpu_0_data_master_address_to_slave[24 : 4] , 4'b0} == 25'h1101080) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //switches_s1_arb_share_counter set values, which is an e_mux
  assign switches_s1_arb_share_set_values = 1;

  //switches_s1_non_bursting_master_requests mux, which is an e_mux
  assign switches_s1_non_bursting_master_requests = cpu_0_data_master_requests_switches_s1;

  //switches_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign switches_s1_any_bursting_master_saved_grant = 0;

  //switches_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign switches_s1_arb_share_counter_next_value = switches_s1_firsttransfer ? (switches_s1_arb_share_set_values - 1) : |switches_s1_arb_share_counter ? (switches_s1_arb_share_counter - 1) : 0;

  //switches_s1_allgrants all slave grants, which is an e_mux
  assign switches_s1_allgrants = |switches_s1_grant_vector;

  //switches_s1_end_xfer assignment, which is an e_assign
  assign switches_s1_end_xfer = ~(switches_s1_waits_for_read | switches_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_switches_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_switches_s1 = switches_s1_end_xfer & (~switches_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //switches_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign switches_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_switches_s1 & switches_s1_allgrants) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests);

  //switches_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_arb_share_counter <= 0;
      else if (switches_s1_arb_counter_enable)
          switches_s1_arb_share_counter <= switches_s1_arb_share_counter_next_value;
    end


  //switches_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_slavearbiterlockenable <= 0;
      else if ((|switches_s1_master_qreq_vector & end_xfer_arb_share_counter_term_switches_s1) | (end_xfer_arb_share_counter_term_switches_s1 & ~switches_s1_non_bursting_master_requests))
          switches_s1_slavearbiterlockenable <= |switches_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master switches/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = switches_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //switches_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign switches_s1_slavearbiterlockenable2 = |switches_s1_arb_share_counter_next_value;

  //cpu_0/data_master switches/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = switches_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //switches_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign switches_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_switches_s1 = cpu_0_data_master_requests_switches_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_switches_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_switches_s1 = cpu_0_data_master_granted_switches_s1 & cpu_0_data_master_read & ~switches_s1_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_switches_s1 = cpu_0_data_master_qualified_request_switches_s1;

  //cpu_0/data_master saved-grant switches/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_switches_s1 = cpu_0_data_master_requests_switches_s1;

  //allow new arb cycle for switches/s1, which is an e_assign
  assign switches_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign switches_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign switches_s1_master_qreq_vector = 1;

  //switches_s1_reset_n assignment, which is an e_assign
  assign switches_s1_reset_n = reset_n;

  //switches_s1_firsttransfer first transaction, which is an e_assign
  assign switches_s1_firsttransfer = switches_s1_begins_xfer ? switches_s1_unreg_firsttransfer : switches_s1_reg_firsttransfer;

  //switches_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign switches_s1_unreg_firsttransfer = ~(switches_s1_slavearbiterlockenable & switches_s1_any_continuerequest);

  //switches_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          switches_s1_reg_firsttransfer <= 1'b1;
      else if (switches_s1_begins_xfer)
          switches_s1_reg_firsttransfer <= switches_s1_unreg_firsttransfer;
    end


  //switches_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign switches_s1_beginbursttransfer_internal = switches_s1_begins_xfer;

  assign shifted_address_to_switches_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //switches_s1_address mux, which is an e_mux
  assign switches_s1_address = shifted_address_to_switches_s1_from_cpu_0_data_master >> 2;

  //d1_switches_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_switches_s1_end_xfer <= 1;
      else 
        d1_switches_s1_end_xfer <= switches_s1_end_xfer;
    end


  //switches_s1_waits_for_read in a cycle, which is an e_mux
  assign switches_s1_waits_for_read = switches_s1_in_a_read_cycle & switches_s1_begins_xfer;

  //switches_s1_in_a_read_cycle assignment, which is an e_assign
  assign switches_s1_in_a_read_cycle = cpu_0_data_master_granted_switches_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = switches_s1_in_a_read_cycle;

  //switches_s1_waits_for_write in a cycle, which is an e_mux
  assign switches_s1_waits_for_write = switches_s1_in_a_write_cycle & 0;

  //switches_s1_in_a_write_cycle assignment, which is an e_assign
  assign switches_s1_in_a_write_cycle = cpu_0_data_master_granted_switches_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = switches_s1_in_a_write_cycle;

  assign wait_for_switches_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //switches/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module sysid_control_slave_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_latency_counter,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                         cpu_0_data_master_write,
                                         reset_n,
                                         sysid_control_slave_readdata,

                                        // outputs:
                                         cpu_0_data_master_granted_sysid_control_slave,
                                         cpu_0_data_master_qualified_request_sysid_control_slave,
                                         cpu_0_data_master_read_data_valid_sysid_control_slave,
                                         cpu_0_data_master_requests_sysid_control_slave,
                                         d1_sysid_control_slave_end_xfer,
                                         sysid_control_slave_address,
                                         sysid_control_slave_readdata_from_sa
                                      )
;

  output           cpu_0_data_master_granted_sysid_control_slave;
  output           cpu_0_data_master_qualified_request_sysid_control_slave;
  output           cpu_0_data_master_read_data_valid_sysid_control_slave;
  output           cpu_0_data_master_requests_sysid_control_slave;
  output           d1_sysid_control_slave_end_xfer;
  output           sysid_control_slave_address;
  output  [ 31: 0] sysid_control_slave_readdata_from_sa;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input            reset_n;
  input   [ 31: 0] sysid_control_slave_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_saved_grant_sysid_control_slave;
  reg              d1_reasons_to_wait;
  reg              d1_sysid_control_slave_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_sysid_control_slave;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_sysid_control_slave_from_cpu_0_data_master;
  wire             sysid_control_slave_address;
  wire             sysid_control_slave_allgrants;
  wire             sysid_control_slave_allow_new_arb_cycle;
  wire             sysid_control_slave_any_bursting_master_saved_grant;
  wire             sysid_control_slave_any_continuerequest;
  wire             sysid_control_slave_arb_counter_enable;
  reg     [  1: 0] sysid_control_slave_arb_share_counter;
  wire    [  1: 0] sysid_control_slave_arb_share_counter_next_value;
  wire    [  1: 0] sysid_control_slave_arb_share_set_values;
  wire             sysid_control_slave_beginbursttransfer_internal;
  wire             sysid_control_slave_begins_xfer;
  wire             sysid_control_slave_end_xfer;
  wire             sysid_control_slave_firsttransfer;
  wire             sysid_control_slave_grant_vector;
  wire             sysid_control_slave_in_a_read_cycle;
  wire             sysid_control_slave_in_a_write_cycle;
  wire             sysid_control_slave_master_qreq_vector;
  wire             sysid_control_slave_non_bursting_master_requests;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  reg              sysid_control_slave_reg_firsttransfer;
  reg              sysid_control_slave_slavearbiterlockenable;
  wire             sysid_control_slave_slavearbiterlockenable2;
  wire             sysid_control_slave_unreg_firsttransfer;
  wire             sysid_control_slave_waits_for_read;
  wire             sysid_control_slave_waits_for_write;
  wire             wait_for_sysid_control_slave_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~sysid_control_slave_end_xfer;
    end


  assign sysid_control_slave_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_sysid_control_slave));
  //assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata;

  assign cpu_0_data_master_requests_sysid_control_slave = (({cpu_0_data_master_address_to_slave[24 : 3] , 3'b0} == 25'h11010d8) & (cpu_0_data_master_read | cpu_0_data_master_write)) & cpu_0_data_master_read;
  //sysid_control_slave_arb_share_counter set values, which is an e_mux
  assign sysid_control_slave_arb_share_set_values = 1;

  //sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  assign sysid_control_slave_non_bursting_master_requests = cpu_0_data_master_requests_sysid_control_slave;

  //sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  assign sysid_control_slave_any_bursting_master_saved_grant = 0;

  //sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  assign sysid_control_slave_arb_share_counter_next_value = sysid_control_slave_firsttransfer ? (sysid_control_slave_arb_share_set_values - 1) : |sysid_control_slave_arb_share_counter ? (sysid_control_slave_arb_share_counter - 1) : 0;

  //sysid_control_slave_allgrants all slave grants, which is an e_mux
  assign sysid_control_slave_allgrants = |sysid_control_slave_grant_vector;

  //sysid_control_slave_end_xfer assignment, which is an e_assign
  assign sysid_control_slave_end_xfer = ~(sysid_control_slave_waits_for_read | sysid_control_slave_waits_for_write);

  //end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_sysid_control_slave = sysid_control_slave_end_xfer & (~sysid_control_slave_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  assign sysid_control_slave_arb_counter_enable = (end_xfer_arb_share_counter_term_sysid_control_slave & sysid_control_slave_allgrants) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests);

  //sysid_control_slave_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_arb_share_counter <= 0;
      else if (sysid_control_slave_arb_counter_enable)
          sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
    end


  //sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_slavearbiterlockenable <= 0;
      else if ((|sysid_control_slave_master_qreq_vector & end_xfer_arb_share_counter_term_sysid_control_slave) | (end_xfer_arb_share_counter_term_sysid_control_slave & ~sysid_control_slave_non_bursting_master_requests))
          sysid_control_slave_slavearbiterlockenable <= |sysid_control_slave_arb_share_counter_next_value;
    end


  //cpu_0/data_master sysid/control_slave arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = sysid_control_slave_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign sysid_control_slave_slavearbiterlockenable2 = |sysid_control_slave_arb_share_counter_next_value;

  //cpu_0/data_master sysid/control_slave arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = sysid_control_slave_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  assign sysid_control_slave_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_sysid_control_slave, which is an e_mux
  assign cpu_0_data_master_read_data_valid_sysid_control_slave = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read & ~sysid_control_slave_waits_for_read;

  //master is always granted when requested
  assign cpu_0_data_master_granted_sysid_control_slave = cpu_0_data_master_qualified_request_sysid_control_slave;

  //cpu_0/data_master saved-grant sysid/control_slave, which is an e_assign
  assign cpu_0_data_master_saved_grant_sysid_control_slave = cpu_0_data_master_requests_sysid_control_slave;

  //allow new arb cycle for sysid/control_slave, which is an e_assign
  assign sysid_control_slave_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign sysid_control_slave_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign sysid_control_slave_master_qreq_vector = 1;

  //sysid_control_slave_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_firsttransfer = sysid_control_slave_begins_xfer ? sysid_control_slave_unreg_firsttransfer : sysid_control_slave_reg_firsttransfer;

  //sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  assign sysid_control_slave_unreg_firsttransfer = ~(sysid_control_slave_slavearbiterlockenable & sysid_control_slave_any_continuerequest);

  //sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          sysid_control_slave_reg_firsttransfer <= 1'b1;
      else if (sysid_control_slave_begins_xfer)
          sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
    end


  //sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign sysid_control_slave_beginbursttransfer_internal = sysid_control_slave_begins_xfer;

  assign shifted_address_to_sysid_control_slave_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //sysid_control_slave_address mux, which is an e_mux
  assign sysid_control_slave_address = shifted_address_to_sysid_control_slave_from_cpu_0_data_master >> 2;

  //d1_sysid_control_slave_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_sysid_control_slave_end_xfer <= 1;
      else 
        d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end


  //sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_read = sysid_control_slave_in_a_read_cycle & sysid_control_slave_begins_xfer;

  //sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_read_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = sysid_control_slave_in_a_read_cycle;

  //sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  assign sysid_control_slave_waits_for_write = sysid_control_slave_in_a_write_cycle & 0;

  //sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  assign sysid_control_slave_in_a_write_cycle = cpu_0_data_master_granted_sysid_control_slave & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = sysid_control_slave_in_a_write_cycle;

  assign wait_for_sysid_control_slave_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //sysid/control_slave enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module timer_0_s1_arbitrator (
                               // inputs:
                                clk,
                                cpu_0_data_master_address_to_slave,
                                cpu_0_data_master_latency_counter,
                                cpu_0_data_master_read,
                                cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register,
                                cpu_0_data_master_write,
                                cpu_0_data_master_writedata,
                                reset_n,
                                timer_0_s1_irq,
                                timer_0_s1_readdata,

                               // outputs:
                                cpu_0_data_master_granted_timer_0_s1,
                                cpu_0_data_master_qualified_request_timer_0_s1,
                                cpu_0_data_master_read_data_valid_timer_0_s1,
                                cpu_0_data_master_requests_timer_0_s1,
                                d1_timer_0_s1_end_xfer,
                                timer_0_s1_address,
                                timer_0_s1_chipselect,
                                timer_0_s1_irq_from_sa,
                                timer_0_s1_readdata_from_sa,
                                timer_0_s1_reset_n,
                                timer_0_s1_write_n,
                                timer_0_s1_writedata
                             )
;

  output           cpu_0_data_master_granted_timer_0_s1;
  output           cpu_0_data_master_qualified_request_timer_0_s1;
  output           cpu_0_data_master_read_data_valid_timer_0_s1;
  output           cpu_0_data_master_requests_timer_0_s1;
  output           d1_timer_0_s1_end_xfer;
  output  [  2: 0] timer_0_s1_address;
  output           timer_0_s1_chipselect;
  output           timer_0_s1_irq_from_sa;
  output  [ 15: 0] timer_0_s1_readdata_from_sa;
  output           timer_0_s1_reset_n;
  output           timer_0_s1_write_n;
  output  [ 15: 0] timer_0_s1_writedata;
  input            clk;
  input   [ 24: 0] cpu_0_data_master_address_to_slave;
  input   [  1: 0] cpu_0_data_master_latency_counter;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            reset_n;
  input            timer_0_s1_irq;
  input   [ 15: 0] timer_0_s1_readdata;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_saved_grant_timer_0_s1;
  reg              d1_reasons_to_wait;
  reg              d1_timer_0_s1_end_xfer;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_timer_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [ 24: 0] shifted_address_to_timer_0_s1_from_cpu_0_data_master;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_allgrants;
  wire             timer_0_s1_allow_new_arb_cycle;
  wire             timer_0_s1_any_bursting_master_saved_grant;
  wire             timer_0_s1_any_continuerequest;
  wire             timer_0_s1_arb_counter_enable;
  reg     [  1: 0] timer_0_s1_arb_share_counter;
  wire    [  1: 0] timer_0_s1_arb_share_counter_next_value;
  wire    [  1: 0] timer_0_s1_arb_share_set_values;
  wire             timer_0_s1_beginbursttransfer_internal;
  wire             timer_0_s1_begins_xfer;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_end_xfer;
  wire             timer_0_s1_firsttransfer;
  wire             timer_0_s1_grant_vector;
  wire             timer_0_s1_in_a_read_cycle;
  wire             timer_0_s1_in_a_write_cycle;
  wire             timer_0_s1_irq_from_sa;
  wire             timer_0_s1_master_qreq_vector;
  wire             timer_0_s1_non_bursting_master_requests;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  reg              timer_0_s1_reg_firsttransfer;
  wire             timer_0_s1_reset_n;
  reg              timer_0_s1_slavearbiterlockenable;
  wire             timer_0_s1_slavearbiterlockenable2;
  wire             timer_0_s1_unreg_firsttransfer;
  wire             timer_0_s1_waits_for_read;
  wire             timer_0_s1_waits_for_write;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire             wait_for_timer_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~timer_0_s1_end_xfer;
    end


  assign timer_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_timer_0_s1));
  //assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_readdata_from_sa = timer_0_s1_readdata;

  assign cpu_0_data_master_requests_timer_0_s1 = ({cpu_0_data_master_address_to_slave[24 : 5] , 5'b0} == 25'h1101000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //timer_0_s1_arb_share_counter set values, which is an e_mux
  assign timer_0_s1_arb_share_set_values = 1;

  //timer_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign timer_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_timer_0_s1;

  //timer_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign timer_0_s1_any_bursting_master_saved_grant = 0;

  //timer_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign timer_0_s1_arb_share_counter_next_value = timer_0_s1_firsttransfer ? (timer_0_s1_arb_share_set_values - 1) : |timer_0_s1_arb_share_counter ? (timer_0_s1_arb_share_counter - 1) : 0;

  //timer_0_s1_allgrants all slave grants, which is an e_mux
  assign timer_0_s1_allgrants = |timer_0_s1_grant_vector;

  //timer_0_s1_end_xfer assignment, which is an e_assign
  assign timer_0_s1_end_xfer = ~(timer_0_s1_waits_for_read | timer_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_timer_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_timer_0_s1 = timer_0_s1_end_xfer & (~timer_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //timer_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign timer_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_timer_0_s1 & timer_0_s1_allgrants) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests);

  //timer_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_arb_share_counter <= 0;
      else if (timer_0_s1_arb_counter_enable)
          timer_0_s1_arb_share_counter <= timer_0_s1_arb_share_counter_next_value;
    end


  //timer_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_slavearbiterlockenable <= 0;
      else if ((|timer_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_timer_0_s1) | (end_xfer_arb_share_counter_term_timer_0_s1 & ~timer_0_s1_non_bursting_master_requests))
          timer_0_s1_slavearbiterlockenable <= |timer_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master timer_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = timer_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //timer_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign timer_0_s1_slavearbiterlockenable2 = |timer_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master timer_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = timer_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //timer_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign timer_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1 & ~((cpu_0_data_master_read & ((cpu_0_data_master_latency_counter != 0) | (|cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register))));
  //local readdatavalid cpu_0_data_master_read_data_valid_timer_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_timer_0_s1 = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read & ~timer_0_s1_waits_for_read;

  //timer_0_s1_writedata mux, which is an e_mux
  assign timer_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_timer_0_s1 = cpu_0_data_master_qualified_request_timer_0_s1;

  //cpu_0/data_master saved-grant timer_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_timer_0_s1 = cpu_0_data_master_requests_timer_0_s1;

  //allow new arb cycle for timer_0/s1, which is an e_assign
  assign timer_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign timer_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign timer_0_s1_master_qreq_vector = 1;

  //timer_0_s1_reset_n assignment, which is an e_assign
  assign timer_0_s1_reset_n = reset_n;

  assign timer_0_s1_chipselect = cpu_0_data_master_granted_timer_0_s1;
  //timer_0_s1_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_firsttransfer = timer_0_s1_begins_xfer ? timer_0_s1_unreg_firsttransfer : timer_0_s1_reg_firsttransfer;

  //timer_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign timer_0_s1_unreg_firsttransfer = ~(timer_0_s1_slavearbiterlockenable & timer_0_s1_any_continuerequest);

  //timer_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          timer_0_s1_reg_firsttransfer <= 1'b1;
      else if (timer_0_s1_begins_xfer)
          timer_0_s1_reg_firsttransfer <= timer_0_s1_unreg_firsttransfer;
    end


  //timer_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign timer_0_s1_beginbursttransfer_internal = timer_0_s1_begins_xfer;

  //~timer_0_s1_write_n assignment, which is an e_mux
  assign timer_0_s1_write_n = ~(cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_timer_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //timer_0_s1_address mux, which is an e_mux
  assign timer_0_s1_address = shifted_address_to_timer_0_s1_from_cpu_0_data_master >> 2;

  //d1_timer_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_timer_0_s1_end_xfer <= 1;
      else 
        d1_timer_0_s1_end_xfer <= timer_0_s1_end_xfer;
    end


  //timer_0_s1_waits_for_read in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_read = timer_0_s1_in_a_read_cycle & timer_0_s1_begins_xfer;

  //timer_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_read_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = timer_0_s1_in_a_read_cycle;

  //timer_0_s1_waits_for_write in a cycle, which is an e_mux
  assign timer_0_s1_waits_for_write = timer_0_s1_in_a_write_cycle & 0;

  //timer_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign timer_0_s1_in_a_write_cycle = cpu_0_data_master_granted_timer_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = timer_0_s1_in_a_write_cycle;

  assign wait_for_timer_0_s1_counter = 0;
  //assign timer_0_s1_irq_from_sa = timer_0_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign timer_0_s1_irq_from_sa = timer_0_s1_irq;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //timer_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module vga_0_avalon_vga_sink_arbitrator (
                                          // inputs:
                                           clk,
                                           pixel_buffer_0_avalon_pixel_buffer_source_data,
                                           pixel_buffer_0_avalon_pixel_buffer_source_empty,
                                           pixel_buffer_0_avalon_pixel_buffer_source_endofpacket,
                                           pixel_buffer_0_avalon_pixel_buffer_source_startofpacket,
                                           pixel_buffer_0_avalon_pixel_buffer_source_valid,
                                           reset_n,
                                           vga_0_avalon_vga_sink_ready,

                                          // outputs:
                                           vga_0_avalon_vga_sink_data,
                                           vga_0_avalon_vga_sink_empty,
                                           vga_0_avalon_vga_sink_endofpacket,
                                           vga_0_avalon_vga_sink_ready_from_sa,
                                           vga_0_avalon_vga_sink_reset,
                                           vga_0_avalon_vga_sink_startofpacket,
                                           vga_0_avalon_vga_sink_valid
                                        )
;

  output  [ 29: 0] vga_0_avalon_vga_sink_data;
  output  [  1: 0] vga_0_avalon_vga_sink_empty;
  output           vga_0_avalon_vga_sink_endofpacket;
  output           vga_0_avalon_vga_sink_ready_from_sa;
  output           vga_0_avalon_vga_sink_reset;
  output           vga_0_avalon_vga_sink_startofpacket;
  output           vga_0_avalon_vga_sink_valid;
  input            clk;
  input   [ 29: 0] pixel_buffer_0_avalon_pixel_buffer_source_data;
  input   [  1: 0] pixel_buffer_0_avalon_pixel_buffer_source_empty;
  input            pixel_buffer_0_avalon_pixel_buffer_source_endofpacket;
  input            pixel_buffer_0_avalon_pixel_buffer_source_startofpacket;
  input            pixel_buffer_0_avalon_pixel_buffer_source_valid;
  input            reset_n;
  input            vga_0_avalon_vga_sink_ready;

  wire    [ 29: 0] vga_0_avalon_vga_sink_data;
  wire    [  1: 0] vga_0_avalon_vga_sink_empty;
  wire             vga_0_avalon_vga_sink_endofpacket;
  wire             vga_0_avalon_vga_sink_ready_from_sa;
  wire             vga_0_avalon_vga_sink_reset;
  wire             vga_0_avalon_vga_sink_startofpacket;
  wire             vga_0_avalon_vga_sink_valid;
  //mux vga_0_avalon_vga_sink_data, which is an e_mux
  assign vga_0_avalon_vga_sink_data = pixel_buffer_0_avalon_pixel_buffer_source_data;

  //mux vga_0_avalon_vga_sink_empty, which is an e_mux
  assign vga_0_avalon_vga_sink_empty = pixel_buffer_0_avalon_pixel_buffer_source_empty;

  //mux vga_0_avalon_vga_sink_endofpacket, which is an e_mux
  assign vga_0_avalon_vga_sink_endofpacket = pixel_buffer_0_avalon_pixel_buffer_source_endofpacket;

  //assign vga_0_avalon_vga_sink_ready_from_sa = vga_0_avalon_vga_sink_ready so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign vga_0_avalon_vga_sink_ready_from_sa = vga_0_avalon_vga_sink_ready;

  //mux vga_0_avalon_vga_sink_startofpacket, which is an e_mux
  assign vga_0_avalon_vga_sink_startofpacket = pixel_buffer_0_avalon_pixel_buffer_source_startofpacket;

  //mux vga_0_avalon_vga_sink_valid, which is an e_mux
  assign vga_0_avalon_vga_sink_valid = pixel_buffer_0_avalon_pixel_buffer_source_valid;

  //~vga_0_avalon_vga_sink_reset assignment, which is an e_assign
  assign vga_0_avalon_vga_sink_reset = ~reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module processor1_reset_clk_0_domain_synch_module (
                                                    // inputs:
                                                     clk,
                                                     data_in,
                                                     reset_n,

                                                    // outputs:
                                                     data_out
                                                  )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module processor1 (
                    // 1) global signals:
                     clk_0,
                     reset_n,

                    // the_audio_0
                     AUD_ADCDAT_to_the_audio_0,
                     AUD_ADCLRCK_to_and_from_the_audio_0,
                     AUD_BCLK_to_and_from_the_audio_0,
                     AUD_DACDAT_from_the_audio_0,
                     AUD_DACLRCK_to_and_from_the_audio_0,

                    // the_audio_and_video_config_0
                     I2C_SCLK_from_the_audio_and_video_config_0,
                     I2C_SDAT_to_and_from_the_audio_and_video_config_0,

                    // the_de_boards_0
                     AUD_XCK_from_the_de_boards_0,
                     DRAM_CLK_from_the_de_boards_0,
                     VGA_CLK_from_the_de_boards_0,
                     ext_clk_27_to_the_de_boards_0,
                     ext_clk_50_to_the_de_boards_0,
                     system_clk_from_the_de_boards_0,

                    // the_input_packet
                     in_port_to_the_input_packet,

                    // the_lcd_0
                     LCD_E_from_the_lcd_0,
                     LCD_RS_from_the_lcd_0,
                     LCD_RW_from_the_lcd_0,
                     LCD_data_to_and_from_the_lcd_0,

                    // the_leds
                     out_port_from_the_leds,

                    // the_output_packet
                     out_port_from_the_output_packet,

                    // the_push_buttons
                     in_port_to_the_push_buttons,

                    // the_sdram_0
                     zs_addr_from_the_sdram_0,
                     zs_ba_from_the_sdram_0,
                     zs_cas_n_from_the_sdram_0,
                     zs_cke_from_the_sdram_0,
                     zs_cs_n_from_the_sdram_0,
                     zs_dq_to_and_from_the_sdram_0,
                     zs_dqm_from_the_sdram_0,
                     zs_ras_n_from_the_sdram_0,
                     zs_we_n_from_the_sdram_0,

                    // the_sram_0
                     SRAM_ADDR_from_the_sram_0,
                     SRAM_CE_N_from_the_sram_0,
                     SRAM_DQ_to_and_from_the_sram_0,
                     SRAM_LB_N_from_the_sram_0,
                     SRAM_OE_N_from_the_sram_0,
                     SRAM_UB_N_from_the_sram_0,
                     SRAM_WE_N_from_the_sram_0,

                    // the_switches
                     in_port_to_the_switches,

                    // the_vga_0
                     VGA_BLANK_from_the_vga_0,
                     VGA_B_from_the_vga_0,
                     VGA_G_from_the_vga_0,
                     VGA_HS_from_the_vga_0,
                     VGA_R_from_the_vga_0,
                     VGA_SYNC_from_the_vga_0,
                     VGA_VS_from_the_vga_0
                  )
;

  inout            AUD_ADCLRCK_to_and_from_the_audio_0;
  inout            AUD_BCLK_to_and_from_the_audio_0;
  output           AUD_DACDAT_from_the_audio_0;
  inout            AUD_DACLRCK_to_and_from_the_audio_0;
  output           AUD_XCK_from_the_de_boards_0;
  output           DRAM_CLK_from_the_de_boards_0;
  output           I2C_SCLK_from_the_audio_and_video_config_0;
  inout            I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  output           LCD_E_from_the_lcd_0;
  output           LCD_RS_from_the_lcd_0;
  output           LCD_RW_from_the_lcd_0;
  inout   [  7: 0] LCD_data_to_and_from_the_lcd_0;
  output  [ 17: 0] SRAM_ADDR_from_the_sram_0;
  output           SRAM_CE_N_from_the_sram_0;
  inout   [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  output           SRAM_LB_N_from_the_sram_0;
  output           SRAM_OE_N_from_the_sram_0;
  output           SRAM_UB_N_from_the_sram_0;
  output           SRAM_WE_N_from_the_sram_0;
  output           VGA_BLANK_from_the_vga_0;
  output  [  9: 0] VGA_B_from_the_vga_0;
  output           VGA_CLK_from_the_de_boards_0;
  output  [  9: 0] VGA_G_from_the_vga_0;
  output           VGA_HS_from_the_vga_0;
  output  [  9: 0] VGA_R_from_the_vga_0;
  output           VGA_SYNC_from_the_vga_0;
  output           VGA_VS_from_the_vga_0;
  output  [ 26: 0] out_port_from_the_leds;
  output  [ 31: 0] out_port_from_the_output_packet;
  output           system_clk_from_the_de_boards_0;
  output  [ 11: 0] zs_addr_from_the_sdram_0;
  output  [  1: 0] zs_ba_from_the_sdram_0;
  output           zs_cas_n_from_the_sdram_0;
  output           zs_cke_from_the_sdram_0;
  output           zs_cs_n_from_the_sdram_0;
  inout   [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  output  [  1: 0] zs_dqm_from_the_sdram_0;
  output           zs_ras_n_from_the_sdram_0;
  output           zs_we_n_from_the_sdram_0;
  input            AUD_ADCDAT_to_the_audio_0;
  input            clk_0;
  input            ext_clk_27_to_the_de_boards_0;
  input            ext_clk_50_to_the_de_boards_0;
  input   [ 31: 0] in_port_to_the_input_packet;
  input   [  3: 0] in_port_to_the_push_buttons;
  input   [ 17: 0] in_port_to_the_switches;
  input            reset_n;

  wire             AUD_ADCLRCK_to_and_from_the_audio_0;
  wire             AUD_BCLK_to_and_from_the_audio_0;
  wire             AUD_DACDAT_from_the_audio_0;
  wire             AUD_DACLRCK_to_and_from_the_audio_0;
  wire             AUD_XCK_from_the_de_boards_0;
  wire             DRAM_CLK_from_the_de_boards_0;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  wire             LCD_E_from_the_lcd_0;
  wire             LCD_RS_from_the_lcd_0;
  wire             LCD_RW_from_the_lcd_0;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_0;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire             VGA_BLANK_from_the_vga_0;
  wire    [  9: 0] VGA_B_from_the_vga_0;
  wire             VGA_CLK_from_the_de_boards_0;
  wire    [  9: 0] VGA_G_from_the_vga_0;
  wire             VGA_HS_from_the_vga_0;
  wire    [  9: 0] VGA_R_from_the_vga_0;
  wire             VGA_SYNC_from_the_vga_0;
  wire             VGA_VS_from_the_vga_0;
  wire    [  1: 0] audio_0_avalon_audio_slave_address;
  wire             audio_0_avalon_audio_slave_chipselect;
  wire             audio_0_avalon_audio_slave_irq;
  wire             audio_0_avalon_audio_slave_irq_from_sa;
  wire             audio_0_avalon_audio_slave_read;
  wire    [ 31: 0] audio_0_avalon_audio_slave_readdata;
  wire    [ 31: 0] audio_0_avalon_audio_slave_readdata_from_sa;
  wire             audio_0_avalon_audio_slave_reset;
  wire             audio_0_avalon_audio_slave_write;
  wire    [ 31: 0] audio_0_avalon_audio_slave_writedata;
  wire    [  2: 0] audio_and_video_config_0_avalon_on_board_config_slave_address;
  wire    [  3: 0] audio_and_video_config_0_avalon_on_board_config_slave_byteenable;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_chipselect;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_read;
  wire    [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata;
  wire    [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_reset;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_waitrequest;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa;
  wire             audio_and_video_config_0_avalon_on_board_config_slave_write;
  wire    [ 31: 0] audio_and_video_config_0_avalon_on_board_config_slave_writedata;
  wire             clk_0_reset_n;
  wire    [ 24: 0] cpu_0_data_master_address;
  wire    [ 24: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire    [  1: 0] cpu_0_data_master_byteenable_sdram_0_s1;
  wire    [  1: 0] cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  wire    [  1: 0] cpu_0_data_master_dbs_address;
  wire    [ 15: 0] cpu_0_data_master_dbs_write_16;
  wire             cpu_0_data_master_debugaccess;
  wire             cpu_0_data_master_granted_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_granted_input_packet_s1;
  wire             cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_granted_lcd_0_control_slave;
  wire             cpu_0_data_master_granted_leds_s1;
  wire             cpu_0_data_master_granted_output_packet_s1;
  wire             cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_granted_push_buttons_s1;
  wire             cpu_0_data_master_granted_sdram_0_s1;
  wire             cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_granted_switches_s1;
  wire             cpu_0_data_master_granted_sysid_control_slave;
  wire             cpu_0_data_master_granted_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire    [  1: 0] cpu_0_data_master_latency_counter;
  wire             cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_qualified_request_input_packet_s1;
  wire             cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_qualified_request_lcd_0_control_slave;
  wire             cpu_0_data_master_qualified_request_leds_s1;
  wire             cpu_0_data_master_qualified_request_output_packet_s1;
  wire             cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_qualified_request_push_buttons_s1;
  wire             cpu_0_data_master_qualified_request_sdram_0_s1;
  wire             cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_qualified_request_switches_s1;
  wire             cpu_0_data_master_qualified_request_sysid_control_slave;
  wire             cpu_0_data_master_qualified_request_timer_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_read_data_valid_input_packet_s1;
  wire             cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_read_data_valid_lcd_0_control_slave;
  wire             cpu_0_data_master_read_data_valid_leds_s1;
  wire             cpu_0_data_master_read_data_valid_output_packet_s1;
  wire             cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_read_data_valid_push_buttons_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_read_data_valid_switches_s1;
  wire             cpu_0_data_master_read_data_valid_sysid_control_slave;
  wire             cpu_0_data_master_read_data_valid_timer_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_readdatavalid;
  wire             cpu_0_data_master_requests_audio_0_avalon_audio_slave;
  wire             cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave;
  wire             cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave;
  wire             cpu_0_data_master_requests_input_packet_s1;
  wire             cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  wire             cpu_0_data_master_requests_lcd_0_control_slave;
  wire             cpu_0_data_master_requests_leds_s1;
  wire             cpu_0_data_master_requests_output_packet_s1;
  wire             cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave;
  wire             cpu_0_data_master_requests_push_buttons_s1;
  wire             cpu_0_data_master_requests_sdram_0_s1;
  wire             cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_data_master_requests_switches_s1;
  wire             cpu_0_data_master_requests_sysid_control_slave;
  wire             cpu_0_data_master_requests_timer_0_s1;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 24: 0] cpu_0_instruction_master_address;
  wire    [ 24: 0] cpu_0_instruction_master_address_to_slave;
  wire    [  1: 0] cpu_0_instruction_master_dbs_address;
  wire             cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_granted_sdram_0_s1;
  wire             cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  wire    [  1: 0] cpu_0_instruction_master_latency_counter;
  wire             cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_qualified_request_sdram_0_s1;
  wire             cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_readdatavalid;
  wire             cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  wire             cpu_0_instruction_master_requests_sdram_0_s1;
  wire             cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  wire             cpu_0_instruction_master_waitrequest;
  wire    [  8: 0] cpu_0_jtag_debug_module_address;
  wire             cpu_0_jtag_debug_module_begintransfer;
  wire    [  3: 0] cpu_0_jtag_debug_module_byteenable;
  wire             cpu_0_jtag_debug_module_chipselect;
  wire             cpu_0_jtag_debug_module_debugaccess;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata;
  wire    [ 31: 0] cpu_0_jtag_debug_module_readdata_from_sa;
  wire             cpu_0_jtag_debug_module_reset_n;
  wire             cpu_0_jtag_debug_module_resetrequest;
  wire             cpu_0_jtag_debug_module_resetrequest_from_sa;
  wire             cpu_0_jtag_debug_module_write;
  wire    [ 31: 0] cpu_0_jtag_debug_module_writedata;
  wire             d1_audio_0_avalon_audio_slave_end_xfer;
  wire             d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer;
  wire             d1_cpu_0_jtag_debug_module_end_xfer;
  wire             d1_de_boards_0_avalon_external_clocks_slave_end_xfer;
  wire             d1_input_packet_s1_end_xfer;
  wire             d1_jtag_uart_0_avalon_jtag_slave_end_xfer;
  wire             d1_lcd_0_control_slave_end_xfer;
  wire             d1_leds_s1_end_xfer;
  wire             d1_output_packet_s1_end_xfer;
  wire             d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer;
  wire             d1_push_buttons_s1_end_xfer;
  wire             d1_sdram_0_s1_end_xfer;
  wire             d1_sram_0_avalon_sram_slave_end_xfer;
  wire             d1_switches_s1_end_xfer;
  wire             d1_sysid_control_slave_end_xfer;
  wire             d1_timer_0_s1_end_xfer;
  wire    [  3: 0] de_boards_0_avalon_external_clocks_slave_byteenable;
  wire             de_boards_0_avalon_external_clocks_slave_chipselect;
  wire             de_boards_0_avalon_external_clocks_slave_read;
  wire    [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata;
  wire    [ 31: 0] de_boards_0_avalon_external_clocks_slave_readdata_from_sa;
  wire             de_boards_0_avalon_external_clocks_slave_reset;
  wire             de_boards_0_avalon_external_clocks_slave_write;
  wire    [ 31: 0] de_boards_0_avalon_external_clocks_slave_writedata;
  wire    [  1: 0] input_packet_s1_address;
  wire    [ 31: 0] input_packet_s1_readdata;
  wire    [ 31: 0] input_packet_s1_readdata_from_sa;
  wire             input_packet_s1_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_address;
  wire             jtag_uart_0_avalon_jtag_slave_chipselect;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_irq;
  wire             jtag_uart_0_avalon_jtag_slave_irq_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_read_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_readdata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_reset_n;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest;
  wire             jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_write_n;
  wire    [ 31: 0] jtag_uart_0_avalon_jtag_slave_writedata;
  wire    [  1: 0] lcd_0_control_slave_address;
  wire             lcd_0_control_slave_begintransfer;
  wire             lcd_0_control_slave_read;
  wire    [  7: 0] lcd_0_control_slave_readdata;
  wire    [  7: 0] lcd_0_control_slave_readdata_from_sa;
  wire             lcd_0_control_slave_wait_counter_eq_0;
  wire             lcd_0_control_slave_write;
  wire    [  7: 0] lcd_0_control_slave_writedata;
  wire    [  1: 0] leds_s1_address;
  wire             leds_s1_chipselect;
  wire    [ 26: 0] leds_s1_readdata;
  wire    [ 26: 0] leds_s1_readdata_from_sa;
  wire             leds_s1_reset_n;
  wire             leds_s1_write_n;
  wire    [ 26: 0] leds_s1_writedata;
  wire    [ 26: 0] out_port_from_the_leds;
  wire    [ 31: 0] out_port_from_the_output_packet;
  wire    [  2: 0] output_packet_s1_address;
  wire             output_packet_s1_chipselect;
  wire    [ 31: 0] output_packet_s1_readdata;
  wire    [ 31: 0] output_packet_s1_readdata_from_sa;
  wire             output_packet_s1_reset_n;
  wire             output_packet_s1_write_n;
  wire    [ 31: 0] output_packet_s1_writedata;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_master_latency_counter;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_read;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave;
  wire    [ 15: 0] pixel_buffer_0_avalon_pixel_buffer_master_readdata;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave;
  wire             pixel_buffer_0_avalon_pixel_buffer_master_waitrequest;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_slave_address;
  wire    [  3: 0] pixel_buffer_0_avalon_pixel_buffer_slave_byteenable;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_read;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_reset;
  wire             pixel_buffer_0_avalon_pixel_buffer_slave_write;
  wire    [ 31: 0] pixel_buffer_0_avalon_pixel_buffer_slave_writedata;
  wire    [ 29: 0] pixel_buffer_0_avalon_pixel_buffer_source_data;
  wire    [  1: 0] pixel_buffer_0_avalon_pixel_buffer_source_empty;
  wire             pixel_buffer_0_avalon_pixel_buffer_source_endofpacket;
  wire             pixel_buffer_0_avalon_pixel_buffer_source_ready;
  wire             pixel_buffer_0_avalon_pixel_buffer_source_startofpacket;
  wire             pixel_buffer_0_avalon_pixel_buffer_source_valid;
  wire    [  1: 0] push_buttons_s1_address;
  wire             push_buttons_s1_chipselect;
  wire             push_buttons_s1_irq;
  wire             push_buttons_s1_irq_from_sa;
  wire    [  3: 0] push_buttons_s1_readdata;
  wire    [  3: 0] push_buttons_s1_readdata_from_sa;
  wire             push_buttons_s1_reset_n;
  wire             push_buttons_s1_write_n;
  wire    [  3: 0] push_buttons_s1_writedata;
  wire             reset_n_sources;
  wire    [ 21: 0] sdram_0_s1_address;
  wire    [  1: 0] sdram_0_s1_byteenable_n;
  wire             sdram_0_s1_chipselect;
  wire             sdram_0_s1_read_n;
  wire    [ 15: 0] sdram_0_s1_readdata;
  wire    [ 15: 0] sdram_0_s1_readdata_from_sa;
  wire             sdram_0_s1_readdatavalid;
  wire             sdram_0_s1_reset_n;
  wire             sdram_0_s1_waitrequest;
  wire             sdram_0_s1_waitrequest_from_sa;
  wire             sdram_0_s1_write_n;
  wire    [ 15: 0] sdram_0_s1_writedata;
  wire    [ 17: 0] sram_0_avalon_sram_slave_address;
  wire    [  1: 0] sram_0_avalon_sram_slave_byteenable;
  wire             sram_0_avalon_sram_slave_read;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata;
  wire    [ 15: 0] sram_0_avalon_sram_slave_readdata_from_sa;
  wire             sram_0_avalon_sram_slave_reset;
  wire             sram_0_avalon_sram_slave_write;
  wire    [ 15: 0] sram_0_avalon_sram_slave_writedata;
  wire    [  1: 0] switches_s1_address;
  wire    [ 17: 0] switches_s1_readdata;
  wire    [ 17: 0] switches_s1_readdata_from_sa;
  wire             switches_s1_reset_n;
  wire             sysid_control_slave_address;
  wire    [ 31: 0] sysid_control_slave_readdata;
  wire    [ 31: 0] sysid_control_slave_readdata_from_sa;
  wire             system_clk_from_the_de_boards_0;
  wire    [  2: 0] timer_0_s1_address;
  wire             timer_0_s1_chipselect;
  wire             timer_0_s1_irq;
  wire             timer_0_s1_irq_from_sa;
  wire    [ 15: 0] timer_0_s1_readdata;
  wire    [ 15: 0] timer_0_s1_readdata_from_sa;
  wire             timer_0_s1_reset_n;
  wire             timer_0_s1_write_n;
  wire    [ 15: 0] timer_0_s1_writedata;
  wire    [ 29: 0] vga_0_avalon_vga_sink_data;
  wire    [  1: 0] vga_0_avalon_vga_sink_empty;
  wire             vga_0_avalon_vga_sink_endofpacket;
  wire             vga_0_avalon_vga_sink_ready;
  wire             vga_0_avalon_vga_sink_ready_from_sa;
  wire             vga_0_avalon_vga_sink_reset;
  wire             vga_0_avalon_vga_sink_startofpacket;
  wire             vga_0_avalon_vga_sink_valid;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;
  audio_0_avalon_audio_slave_arbitrator the_audio_0_avalon_audio_slave
    (
      .audio_0_avalon_audio_slave_address                             (audio_0_avalon_audio_slave_address),
      .audio_0_avalon_audio_slave_chipselect                          (audio_0_avalon_audio_slave_chipselect),
      .audio_0_avalon_audio_slave_irq                                 (audio_0_avalon_audio_slave_irq),
      .audio_0_avalon_audio_slave_irq_from_sa                         (audio_0_avalon_audio_slave_irq_from_sa),
      .audio_0_avalon_audio_slave_read                                (audio_0_avalon_audio_slave_read),
      .audio_0_avalon_audio_slave_readdata                            (audio_0_avalon_audio_slave_readdata),
      .audio_0_avalon_audio_slave_readdata_from_sa                    (audio_0_avalon_audio_slave_readdata_from_sa),
      .audio_0_avalon_audio_slave_reset                               (audio_0_avalon_audio_slave_reset),
      .audio_0_avalon_audio_slave_write                               (audio_0_avalon_audio_slave_write),
      .audio_0_avalon_audio_slave_writedata                           (audio_0_avalon_audio_slave_writedata),
      .clk                                                            (clk_0),
      .cpu_0_data_master_address_to_slave                             (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_audio_0_avalon_audio_slave           (cpu_0_data_master_granted_audio_0_avalon_audio_slave),
      .cpu_0_data_master_latency_counter                              (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave (cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave),
      .cpu_0_data_master_read                                         (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave   (cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register    (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_audio_0_avalon_audio_slave          (cpu_0_data_master_requests_audio_0_avalon_audio_slave),
      .cpu_0_data_master_write                                        (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                    (cpu_0_data_master_writedata),
      .d1_audio_0_avalon_audio_slave_end_xfer                         (d1_audio_0_avalon_audio_slave_end_xfer),
      .reset_n                                                        (clk_0_reset_n)
    );

  audio_0 the_audio_0
    (
      .AUD_ADCDAT  (AUD_ADCDAT_to_the_audio_0),
      .AUD_ADCLRCK (AUD_ADCLRCK_to_and_from_the_audio_0),
      .AUD_BCLK    (AUD_BCLK_to_and_from_the_audio_0),
      .AUD_DACDAT  (AUD_DACDAT_from_the_audio_0),
      .AUD_DACLRCK (AUD_DACLRCK_to_and_from_the_audio_0),
      .address     (audio_0_avalon_audio_slave_address),
      .chipselect  (audio_0_avalon_audio_slave_chipselect),
      .clk         (clk_0),
      .irq         (audio_0_avalon_audio_slave_irq),
      .read        (audio_0_avalon_audio_slave_read),
      .readdata    (audio_0_avalon_audio_slave_readdata),
      .reset       (audio_0_avalon_audio_slave_reset),
      .write       (audio_0_avalon_audio_slave_write),
      .writedata   (audio_0_avalon_audio_slave_writedata)
    );

  audio_and_video_config_0_avalon_on_board_config_slave_arbitrator the_audio_and_video_config_0_avalon_on_board_config_slave
    (
      .audio_and_video_config_0_avalon_on_board_config_slave_address                             (audio_and_video_config_0_avalon_on_board_config_slave_address),
      .audio_and_video_config_0_avalon_on_board_config_slave_byteenable                          (audio_and_video_config_0_avalon_on_board_config_slave_byteenable),
      .audio_and_video_config_0_avalon_on_board_config_slave_chipselect                          (audio_and_video_config_0_avalon_on_board_config_slave_chipselect),
      .audio_and_video_config_0_avalon_on_board_config_slave_read                                (audio_and_video_config_0_avalon_on_board_config_slave_read),
      .audio_and_video_config_0_avalon_on_board_config_slave_readdata                            (audio_and_video_config_0_avalon_on_board_config_slave_readdata),
      .audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa                    (audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_on_board_config_slave_reset                               (audio_and_video_config_0_avalon_on_board_config_slave_reset),
      .audio_and_video_config_0_avalon_on_board_config_slave_waitrequest                         (audio_and_video_config_0_avalon_on_board_config_slave_waitrequest),
      .audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa                 (audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa),
      .audio_and_video_config_0_avalon_on_board_config_slave_write                               (audio_and_video_config_0_avalon_on_board_config_slave_write),
      .audio_and_video_config_0_avalon_on_board_config_slave_writedata                           (audio_and_video_config_0_avalon_on_board_config_slave_writedata),
      .clk                                                                                       (clk_0),
      .cpu_0_data_master_address_to_slave                                                        (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                              (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave           (cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_latency_counter                                                         (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_read                                                                    (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave   (cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                               (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave          (cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_write                                                                   (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                               (cpu_0_data_master_writedata),
      .d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer                         (d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer),
      .reset_n                                                                                   (clk_0_reset_n)
    );

  audio_and_video_config_0 the_audio_and_video_config_0
    (
      .I2C_SCLK       (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT       (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .clk            (clk_0),
      .ob_address     (audio_and_video_config_0_avalon_on_board_config_slave_address),
      .ob_byteenable  (audio_and_video_config_0_avalon_on_board_config_slave_byteenable),
      .ob_chipselect  (audio_and_video_config_0_avalon_on_board_config_slave_chipselect),
      .ob_read        (audio_and_video_config_0_avalon_on_board_config_slave_read),
      .ob_readdata    (audio_and_video_config_0_avalon_on_board_config_slave_readdata),
      .ob_waitrequest (audio_and_video_config_0_avalon_on_board_config_slave_waitrequest),
      .ob_write       (audio_and_video_config_0_avalon_on_board_config_slave_write),
      .ob_writedata   (audio_and_video_config_0_avalon_on_board_config_slave_writedata),
      .reset          (audio_and_video_config_0_avalon_on_board_config_slave_reset)
    );

  cpu_0_jtag_debug_module_arbitrator the_cpu_0_jtag_debug_module
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_debugaccess                                      (cpu_0_data_master_debugaccess),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                  (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module        (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module          (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                 (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                        (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module           (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module   (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module          (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_jtag_debug_module_address                                    (cpu_0_jtag_debug_module_address),
      .cpu_0_jtag_debug_module_begintransfer                              (cpu_0_jtag_debug_module_begintransfer),
      .cpu_0_jtag_debug_module_byteenable                                 (cpu_0_jtag_debug_module_byteenable),
      .cpu_0_jtag_debug_module_chipselect                                 (cpu_0_jtag_debug_module_chipselect),
      .cpu_0_jtag_debug_module_debugaccess                                (cpu_0_jtag_debug_module_debugaccess),
      .cpu_0_jtag_debug_module_readdata                                   (cpu_0_jtag_debug_module_readdata),
      .cpu_0_jtag_debug_module_readdata_from_sa                           (cpu_0_jtag_debug_module_readdata_from_sa),
      .cpu_0_jtag_debug_module_reset_n                                    (cpu_0_jtag_debug_module_reset_n),
      .cpu_0_jtag_debug_module_resetrequest                               (cpu_0_jtag_debug_module_resetrequest),
      .cpu_0_jtag_debug_module_resetrequest_from_sa                       (cpu_0_jtag_debug_module_resetrequest_from_sa),
      .cpu_0_jtag_debug_module_write                                      (cpu_0_jtag_debug_module_write),
      .cpu_0_jtag_debug_module_writedata                                  (cpu_0_jtag_debug_module_writedata),
      .d1_cpu_0_jtag_debug_module_end_xfer                                (d1_cpu_0_jtag_debug_module_end_xfer),
      .reset_n                                                            (clk_0_reset_n)
    );

  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .audio_0_avalon_audio_slave_irq_from_sa                                                    (audio_0_avalon_audio_slave_irq_from_sa),
      .audio_0_avalon_audio_slave_readdata_from_sa                                               (audio_0_avalon_audio_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa                    (audio_and_video_config_0_avalon_on_board_config_slave_readdata_from_sa),
      .audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa                 (audio_and_video_config_0_avalon_on_board_config_slave_waitrequest_from_sa),
      .clk                                                                                       (clk_0),
      .cpu_0_data_master_address                                                                 (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                                                        (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                              (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                                                   (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_byteenable_sram_0_avalon_sram_slave                                     (cpu_0_data_master_byteenable_sram_0_avalon_sram_slave),
      .cpu_0_data_master_dbs_address                                                             (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                                            (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_audio_0_avalon_audio_slave                                      (cpu_0_data_master_granted_audio_0_avalon_audio_slave),
      .cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave           (cpu_0_data_master_granted_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_granted_cpu_0_jtag_debug_module                                         (cpu_0_data_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave                        (cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_granted_input_packet_s1                                                 (cpu_0_data_master_granted_input_packet_s1),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave                                   (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_granted_lcd_0_control_slave                                             (cpu_0_data_master_granted_lcd_0_control_slave),
      .cpu_0_data_master_granted_leds_s1                                                         (cpu_0_data_master_granted_leds_s1),
      .cpu_0_data_master_granted_output_packet_s1                                                (cpu_0_data_master_granted_output_packet_s1),
      .cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave                        (cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_granted_push_buttons_s1                                                 (cpu_0_data_master_granted_push_buttons_s1),
      .cpu_0_data_master_granted_sdram_0_s1                                                      (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_granted_sram_0_avalon_sram_slave                                        (cpu_0_data_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_data_master_granted_switches_s1                                                     (cpu_0_data_master_granted_switches_s1),
      .cpu_0_data_master_granted_sysid_control_slave                                             (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_granted_timer_0_s1                                                      (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_irq                                                                     (cpu_0_data_master_irq),
      .cpu_0_data_master_latency_counter                                                         (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave                            (cpu_0_data_master_qualified_request_audio_0_avalon_audio_slave),
      .cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave (cpu_0_data_master_qualified_request_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module                               (cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave              (cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_qualified_request_input_packet_s1                                       (cpu_0_data_master_qualified_request_input_packet_s1),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave                         (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_qualified_request_lcd_0_control_slave                                   (cpu_0_data_master_qualified_request_lcd_0_control_slave),
      .cpu_0_data_master_qualified_request_leds_s1                                               (cpu_0_data_master_qualified_request_leds_s1),
      .cpu_0_data_master_qualified_request_output_packet_s1                                      (cpu_0_data_master_qualified_request_output_packet_s1),
      .cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave              (cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_qualified_request_push_buttons_s1                                       (cpu_0_data_master_qualified_request_push_buttons_s1),
      .cpu_0_data_master_qualified_request_sdram_0_s1                                            (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave                              (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_data_master_qualified_request_switches_s1                                           (cpu_0_data_master_qualified_request_switches_s1),
      .cpu_0_data_master_qualified_request_sysid_control_slave                                   (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_qualified_request_timer_0_s1                                            (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                                                                    (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave                              (cpu_0_data_master_read_data_valid_audio_0_avalon_audio_slave),
      .cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave   (cpu_0_data_master_read_data_valid_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module                                 (cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave                (cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_read_data_valid_input_packet_s1                                         (cpu_0_data_master_read_data_valid_input_packet_s1),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave                           (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_lcd_0_control_slave                                     (cpu_0_data_master_read_data_valid_lcd_0_control_slave),
      .cpu_0_data_master_read_data_valid_leds_s1                                                 (cpu_0_data_master_read_data_valid_leds_s1),
      .cpu_0_data_master_read_data_valid_output_packet_s1                                        (cpu_0_data_master_read_data_valid_output_packet_s1),
      .cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave                (cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_read_data_valid_push_buttons_s1                                         (cpu_0_data_master_read_data_valid_push_buttons_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                                              (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                               (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave                                (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_data_master_read_data_valid_switches_s1                                             (cpu_0_data_master_read_data_valid_switches_s1),
      .cpu_0_data_master_read_data_valid_sysid_control_slave                                     (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_read_data_valid_timer_0_s1                                              (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_readdata                                                                (cpu_0_data_master_readdata),
      .cpu_0_data_master_readdatavalid                                                           (cpu_0_data_master_readdatavalid),
      .cpu_0_data_master_requests_audio_0_avalon_audio_slave                                     (cpu_0_data_master_requests_audio_0_avalon_audio_slave),
      .cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave          (cpu_0_data_master_requests_audio_and_video_config_0_avalon_on_board_config_slave),
      .cpu_0_data_master_requests_cpu_0_jtag_debug_module                                        (cpu_0_data_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave                       (cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_requests_input_packet_s1                                                (cpu_0_data_master_requests_input_packet_s1),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave                                  (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_requests_lcd_0_control_slave                                            (cpu_0_data_master_requests_lcd_0_control_slave),
      .cpu_0_data_master_requests_leds_s1                                                        (cpu_0_data_master_requests_leds_s1),
      .cpu_0_data_master_requests_output_packet_s1                                               (cpu_0_data_master_requests_output_packet_s1),
      .cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave                       (cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_requests_push_buttons_s1                                                (cpu_0_data_master_requests_push_buttons_s1),
      .cpu_0_data_master_requests_sdram_0_s1                                                     (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_requests_sram_0_avalon_sram_slave                                       (cpu_0_data_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_data_master_requests_switches_s1                                                    (cpu_0_data_master_requests_switches_s1),
      .cpu_0_data_master_requests_sysid_control_slave                                            (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_requests_timer_0_s1                                                     (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_waitrequest                                                             (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                                                   (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                               (cpu_0_data_master_writedata),
      .cpu_0_jtag_debug_module_readdata_from_sa                                                  (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_audio_0_avalon_audio_slave_end_xfer                                                    (d1_audio_0_avalon_audio_slave_end_xfer),
      .d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer                         (d1_audio_and_video_config_0_avalon_on_board_config_slave_end_xfer),
      .d1_cpu_0_jtag_debug_module_end_xfer                                                       (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_de_boards_0_avalon_external_clocks_slave_end_xfer                                      (d1_de_boards_0_avalon_external_clocks_slave_end_xfer),
      .d1_input_packet_s1_end_xfer                                                               (d1_input_packet_s1_end_xfer),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                                                 (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .d1_lcd_0_control_slave_end_xfer                                                           (d1_lcd_0_control_slave_end_xfer),
      .d1_leds_s1_end_xfer                                                                       (d1_leds_s1_end_xfer),
      .d1_output_packet_s1_end_xfer                                                              (d1_output_packet_s1_end_xfer),
      .d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer                                      (d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer),
      .d1_push_buttons_s1_end_xfer                                                               (d1_push_buttons_s1_end_xfer),
      .d1_sdram_0_s1_end_xfer                                                                    (d1_sdram_0_s1_end_xfer),
      .d1_sram_0_avalon_sram_slave_end_xfer                                                      (d1_sram_0_avalon_sram_slave_end_xfer),
      .d1_switches_s1_end_xfer                                                                   (d1_switches_s1_end_xfer),
      .d1_sysid_control_slave_end_xfer                                                           (d1_sysid_control_slave_end_xfer),
      .d1_timer_0_s1_end_xfer                                                                    (d1_timer_0_s1_end_xfer),
      .de_boards_0_avalon_external_clocks_slave_readdata_from_sa                                 (de_boards_0_avalon_external_clocks_slave_readdata_from_sa),
      .input_packet_s1_readdata_from_sa                                                          (input_packet_s1_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                                                 (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                                            (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                                         (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .lcd_0_control_slave_readdata_from_sa                                                      (lcd_0_control_slave_readdata_from_sa),
      .lcd_0_control_slave_wait_counter_eq_0                                                     (lcd_0_control_slave_wait_counter_eq_0),
      .leds_s1_readdata_from_sa                                                                  (leds_s1_readdata_from_sa),
      .output_packet_s1_readdata_from_sa                                                         (output_packet_s1_readdata_from_sa),
      .pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa                                 (pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa),
      .push_buttons_s1_irq_from_sa                                                               (push_buttons_s1_irq_from_sa),
      .push_buttons_s1_readdata_from_sa                                                          (push_buttons_s1_readdata_from_sa),
      .reset_n                                                                                   (clk_0_reset_n),
      .sdram_0_s1_readdata_from_sa                                                               (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                                            (sdram_0_s1_waitrequest_from_sa),
      .sram_0_avalon_sram_slave_readdata_from_sa                                                 (sram_0_avalon_sram_slave_readdata_from_sa),
      .switches_s1_readdata_from_sa                                                              (switches_s1_readdata_from_sa),
      .sysid_control_slave_readdata_from_sa                                                      (sysid_control_slave_readdata_from_sa),
      .timer_0_s1_irq_from_sa                                                                    (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata_from_sa                                                               (timer_0_s1_readdata_from_sa)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                                 (clk_0),
      .cpu_0_instruction_master_address                                    (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                           (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_cpu_0_jtag_debug_module            (cpu_0_instruction_master_granted_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_granted_sdram_0_s1                         (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_granted_sram_0_avalon_sram_slave           (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_latency_counter                            (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module  (cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1               (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read                                       (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module    (cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                 (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register  (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave   (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_readdata                                   (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_readdatavalid                              (cpu_0_instruction_master_readdatavalid),
      .cpu_0_instruction_master_requests_cpu_0_jtag_debug_module           (cpu_0_instruction_master_requests_cpu_0_jtag_debug_module),
      .cpu_0_instruction_master_requests_sdram_0_s1                        (cpu_0_instruction_master_requests_sdram_0_s1),
      .cpu_0_instruction_master_requests_sram_0_avalon_sram_slave          (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_waitrequest                                (cpu_0_instruction_master_waitrequest),
      .cpu_0_jtag_debug_module_readdata_from_sa                            (cpu_0_jtag_debug_module_readdata_from_sa),
      .d1_cpu_0_jtag_debug_module_end_xfer                                 (d1_cpu_0_jtag_debug_module_end_xfer),
      .d1_sdram_0_s1_end_xfer                                              (d1_sdram_0_s1_end_xfer),
      .d1_sram_0_avalon_sram_slave_end_xfer                                (d1_sram_0_avalon_sram_slave_end_xfer),
      .reset_n                                                             (clk_0_reset_n),
      .sdram_0_s1_readdata_from_sa                                         (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_waitrequest_from_sa                                      (sdram_0_s1_waitrequest_from_sa),
      .sram_0_avalon_sram_slave_readdata_from_sa                           (sram_0_avalon_sram_slave_readdata_from_sa)
    );

  cpu_0 the_cpu_0
    (
      .clk                                   (clk_0),
      .d_address                             (cpu_0_data_master_address),
      .d_byteenable                          (cpu_0_data_master_byteenable),
      .d_irq                                 (cpu_0_data_master_irq),
      .d_read                                (cpu_0_data_master_read),
      .d_readdata                            (cpu_0_data_master_readdata),
      .d_readdatavalid                       (cpu_0_data_master_readdatavalid),
      .d_waitrequest                         (cpu_0_data_master_waitrequest),
      .d_write                               (cpu_0_data_master_write),
      .d_writedata                           (cpu_0_data_master_writedata),
      .i_address                             (cpu_0_instruction_master_address),
      .i_read                                (cpu_0_instruction_master_read),
      .i_readdata                            (cpu_0_instruction_master_readdata),
      .i_readdatavalid                       (cpu_0_instruction_master_readdatavalid),
      .i_waitrequest                         (cpu_0_instruction_master_waitrequest),
      .jtag_debug_module_address             (cpu_0_jtag_debug_module_address),
      .jtag_debug_module_begintransfer       (cpu_0_jtag_debug_module_begintransfer),
      .jtag_debug_module_byteenable          (cpu_0_jtag_debug_module_byteenable),
      .jtag_debug_module_debugaccess         (cpu_0_jtag_debug_module_debugaccess),
      .jtag_debug_module_debugaccess_to_roms (cpu_0_data_master_debugaccess),
      .jtag_debug_module_readdata            (cpu_0_jtag_debug_module_readdata),
      .jtag_debug_module_resetrequest        (cpu_0_jtag_debug_module_resetrequest),
      .jtag_debug_module_select              (cpu_0_jtag_debug_module_chipselect),
      .jtag_debug_module_write               (cpu_0_jtag_debug_module_write),
      .jtag_debug_module_writedata           (cpu_0_jtag_debug_module_writedata),
      .reset_n                               (cpu_0_jtag_debug_module_reset_n)
    );

  de_boards_0_avalon_external_clocks_slave_arbitrator the_de_boards_0_avalon_external_clocks_slave
    (
      .clk                                                                          (clk_0),
      .cpu_0_data_master_address_to_slave                                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                 (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave           (cpu_0_data_master_granted_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_latency_counter                                            (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave (cpu_0_data_master_qualified_request_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_read                                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave   (cpu_0_data_master_read_data_valid_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                  (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave          (cpu_0_data_master_requests_de_boards_0_avalon_external_clocks_slave),
      .cpu_0_data_master_write                                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                  (cpu_0_data_master_writedata),
      .d1_de_boards_0_avalon_external_clocks_slave_end_xfer                         (d1_de_boards_0_avalon_external_clocks_slave_end_xfer),
      .de_boards_0_avalon_external_clocks_slave_byteenable                          (de_boards_0_avalon_external_clocks_slave_byteenable),
      .de_boards_0_avalon_external_clocks_slave_chipselect                          (de_boards_0_avalon_external_clocks_slave_chipselect),
      .de_boards_0_avalon_external_clocks_slave_read                                (de_boards_0_avalon_external_clocks_slave_read),
      .de_boards_0_avalon_external_clocks_slave_readdata                            (de_boards_0_avalon_external_clocks_slave_readdata),
      .de_boards_0_avalon_external_clocks_slave_readdata_from_sa                    (de_boards_0_avalon_external_clocks_slave_readdata_from_sa),
      .de_boards_0_avalon_external_clocks_slave_reset                               (de_boards_0_avalon_external_clocks_slave_reset),
      .de_boards_0_avalon_external_clocks_slave_write                               (de_boards_0_avalon_external_clocks_slave_write),
      .de_boards_0_avalon_external_clocks_slave_writedata                           (de_boards_0_avalon_external_clocks_slave_writedata),
      .reset_n                                                                      (clk_0_reset_n)
    );

  de_boards_0 the_de_boards_0
    (
      .AUD_XCK    (AUD_XCK_from_the_de_boards_0),
      .DRAM_CLK   (DRAM_CLK_from_the_de_boards_0),
      .VGA_CLK    (VGA_CLK_from_the_de_boards_0),
      .byteenable (de_boards_0_avalon_external_clocks_slave_byteenable),
      .chipselect (de_boards_0_avalon_external_clocks_slave_chipselect),
      .clk        (clk_0),
      .ext_clk_27 (ext_clk_27_to_the_de_boards_0),
      .ext_clk_50 (ext_clk_50_to_the_de_boards_0),
      .read       (de_boards_0_avalon_external_clocks_slave_read),
      .readdata   (de_boards_0_avalon_external_clocks_slave_readdata),
      .reset      (de_boards_0_avalon_external_clocks_slave_reset),
      .system_clk (system_clk_from_the_de_boards_0),
      .write      (de_boards_0_avalon_external_clocks_slave_write),
      .writedata  (de_boards_0_avalon_external_clocks_slave_writedata)
    );

  input_packet_s1_arbitrator the_input_packet_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_input_packet_s1                   (cpu_0_data_master_granted_input_packet_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_input_packet_s1         (cpu_0_data_master_qualified_request_input_packet_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_input_packet_s1           (cpu_0_data_master_read_data_valid_input_packet_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_input_packet_s1                  (cpu_0_data_master_requests_input_packet_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_input_packet_s1_end_xfer                                 (d1_input_packet_s1_end_xfer),
      .input_packet_s1_address                                     (input_packet_s1_address),
      .input_packet_s1_readdata                                    (input_packet_s1_readdata),
      .input_packet_s1_readdata_from_sa                            (input_packet_s1_readdata_from_sa),
      .input_packet_s1_reset_n                                     (input_packet_s1_reset_n),
      .reset_n                                                     (clk_0_reset_n)
    );

  input_packet the_input_packet
    (
      .address  (input_packet_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_input_packet),
      .readdata (input_packet_s1_readdata),
      .reset_n  (input_packet_s1_reset_n)
    );

  jtag_uart_0_avalon_jtag_slave_arbitrator the_jtag_uart_0_avalon_jtag_slave
    (
      .clk                                                               (clk_0),
      .cpu_0_data_master_address_to_slave                                (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave           (cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_latency_counter                                 (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave (cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read                                            (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave   (cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register       (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave          (cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave),
      .cpu_0_data_master_write                                           (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                       (cpu_0_data_master_writedata),
      .d1_jtag_uart_0_avalon_jtag_slave_end_xfer                         (d1_jtag_uart_0_avalon_jtag_slave_end_xfer),
      .jtag_uart_0_avalon_jtag_slave_address                             (jtag_uart_0_avalon_jtag_slave_address),
      .jtag_uart_0_avalon_jtag_slave_chipselect                          (jtag_uart_0_avalon_jtag_slave_chipselect),
      .jtag_uart_0_avalon_jtag_slave_dataavailable                       (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa               (jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa),
      .jtag_uart_0_avalon_jtag_slave_irq                                 (jtag_uart_0_avalon_jtag_slave_irq),
      .jtag_uart_0_avalon_jtag_slave_irq_from_sa                         (jtag_uart_0_avalon_jtag_slave_irq_from_sa),
      .jtag_uart_0_avalon_jtag_slave_read_n                              (jtag_uart_0_avalon_jtag_slave_read_n),
      .jtag_uart_0_avalon_jtag_slave_readdata                            (jtag_uart_0_avalon_jtag_slave_readdata),
      .jtag_uart_0_avalon_jtag_slave_readdata_from_sa                    (jtag_uart_0_avalon_jtag_slave_readdata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_readyfordata                        (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa                (jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa),
      .jtag_uart_0_avalon_jtag_slave_reset_n                             (jtag_uart_0_avalon_jtag_slave_reset_n),
      .jtag_uart_0_avalon_jtag_slave_waitrequest                         (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa                 (jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa),
      .jtag_uart_0_avalon_jtag_slave_write_n                             (jtag_uart_0_avalon_jtag_slave_write_n),
      .jtag_uart_0_avalon_jtag_slave_writedata                           (jtag_uart_0_avalon_jtag_slave_writedata),
      .reset_n                                                           (clk_0_reset_n)
    );

  jtag_uart_0 the_jtag_uart_0
    (
      .av_address     (jtag_uart_0_avalon_jtag_slave_address),
      .av_chipselect  (jtag_uart_0_avalon_jtag_slave_chipselect),
      .av_irq         (jtag_uart_0_avalon_jtag_slave_irq),
      .av_read_n      (jtag_uart_0_avalon_jtag_slave_read_n),
      .av_readdata    (jtag_uart_0_avalon_jtag_slave_readdata),
      .av_waitrequest (jtag_uart_0_avalon_jtag_slave_waitrequest),
      .av_write_n     (jtag_uart_0_avalon_jtag_slave_write_n),
      .av_writedata   (jtag_uart_0_avalon_jtag_slave_writedata),
      .clk            (clk_0),
      .dataavailable  (jtag_uart_0_avalon_jtag_slave_dataavailable),
      .readyfordata   (jtag_uart_0_avalon_jtag_slave_readyfordata),
      .rst_n          (jtag_uart_0_avalon_jtag_slave_reset_n)
    );

  lcd_0_control_slave_arbitrator the_lcd_0_control_slave
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_lcd_0_control_slave               (cpu_0_data_master_granted_lcd_0_control_slave),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_lcd_0_control_slave     (cpu_0_data_master_qualified_request_lcd_0_control_slave),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_lcd_0_control_slave       (cpu_0_data_master_read_data_valid_lcd_0_control_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_lcd_0_control_slave              (cpu_0_data_master_requests_lcd_0_control_slave),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_lcd_0_control_slave_end_xfer                             (d1_lcd_0_control_slave_end_xfer),
      .lcd_0_control_slave_address                                 (lcd_0_control_slave_address),
      .lcd_0_control_slave_begintransfer                           (lcd_0_control_slave_begintransfer),
      .lcd_0_control_slave_read                                    (lcd_0_control_slave_read),
      .lcd_0_control_slave_readdata                                (lcd_0_control_slave_readdata),
      .lcd_0_control_slave_readdata_from_sa                        (lcd_0_control_slave_readdata_from_sa),
      .lcd_0_control_slave_wait_counter_eq_0                       (lcd_0_control_slave_wait_counter_eq_0),
      .lcd_0_control_slave_write                                   (lcd_0_control_slave_write),
      .lcd_0_control_slave_writedata                               (lcd_0_control_slave_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  lcd_0 the_lcd_0
    (
      .LCD_E         (LCD_E_from_the_lcd_0),
      .LCD_RS        (LCD_RS_from_the_lcd_0),
      .LCD_RW        (LCD_RW_from_the_lcd_0),
      .LCD_data      (LCD_data_to_and_from_the_lcd_0),
      .address       (lcd_0_control_slave_address),
      .begintransfer (lcd_0_control_slave_begintransfer),
      .read          (lcd_0_control_slave_read),
      .readdata      (lcd_0_control_slave_readdata),
      .write         (lcd_0_control_slave_write),
      .writedata     (lcd_0_control_slave_writedata)
    );

  leds_s1_arbitrator the_leds_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_leds_s1                           (cpu_0_data_master_granted_leds_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_leds_s1                 (cpu_0_data_master_qualified_request_leds_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_leds_s1                   (cpu_0_data_master_read_data_valid_leds_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_leds_s1                          (cpu_0_data_master_requests_leds_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_leds_s1_end_xfer                                         (d1_leds_s1_end_xfer),
      .leds_s1_address                                             (leds_s1_address),
      .leds_s1_chipselect                                          (leds_s1_chipselect),
      .leds_s1_readdata                                            (leds_s1_readdata),
      .leds_s1_readdata_from_sa                                    (leds_s1_readdata_from_sa),
      .leds_s1_reset_n                                             (leds_s1_reset_n),
      .leds_s1_write_n                                             (leds_s1_write_n),
      .leds_s1_writedata                                           (leds_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  leds the_leds
    (
      .address    (leds_s1_address),
      .chipselect (leds_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_leds),
      .readdata   (leds_s1_readdata),
      .reset_n    (leds_s1_reset_n),
      .write_n    (leds_s1_write_n),
      .writedata  (leds_s1_writedata)
    );

  output_packet_s1_arbitrator the_output_packet_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_output_packet_s1                  (cpu_0_data_master_granted_output_packet_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_output_packet_s1        (cpu_0_data_master_qualified_request_output_packet_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_output_packet_s1          (cpu_0_data_master_read_data_valid_output_packet_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_output_packet_s1                 (cpu_0_data_master_requests_output_packet_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_output_packet_s1_end_xfer                                (d1_output_packet_s1_end_xfer),
      .output_packet_s1_address                                    (output_packet_s1_address),
      .output_packet_s1_chipselect                                 (output_packet_s1_chipselect),
      .output_packet_s1_readdata                                   (output_packet_s1_readdata),
      .output_packet_s1_readdata_from_sa                           (output_packet_s1_readdata_from_sa),
      .output_packet_s1_reset_n                                    (output_packet_s1_reset_n),
      .output_packet_s1_write_n                                    (output_packet_s1_write_n),
      .output_packet_s1_writedata                                  (output_packet_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  output_packet the_output_packet
    (
      .address    (output_packet_s1_address),
      .chipselect (output_packet_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_output_packet),
      .readdata   (output_packet_s1_readdata),
      .reset_n    (output_packet_s1_reset_n),
      .write_n    (output_packet_s1_write_n),
      .writedata  (output_packet_s1_writedata)
    );

  pixel_buffer_0_avalon_pixel_buffer_slave_arbitrator the_pixel_buffer_0_avalon_pixel_buffer_slave
    (
      .clk                                                                          (clk_0),
      .cpu_0_data_master_address_to_slave                                           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                 (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave           (cpu_0_data_master_granted_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_latency_counter                                            (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave (cpu_0_data_master_qualified_request_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_read                                                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave   (cpu_0_data_master_read_data_valid_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                  (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave          (cpu_0_data_master_requests_pixel_buffer_0_avalon_pixel_buffer_slave),
      .cpu_0_data_master_write                                                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                                  (cpu_0_data_master_writedata),
      .d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer                         (d1_pixel_buffer_0_avalon_pixel_buffer_slave_end_xfer),
      .pixel_buffer_0_avalon_pixel_buffer_slave_address                             (pixel_buffer_0_avalon_pixel_buffer_slave_address),
      .pixel_buffer_0_avalon_pixel_buffer_slave_byteenable                          (pixel_buffer_0_avalon_pixel_buffer_slave_byteenable),
      .pixel_buffer_0_avalon_pixel_buffer_slave_read                                (pixel_buffer_0_avalon_pixel_buffer_slave_read),
      .pixel_buffer_0_avalon_pixel_buffer_slave_readdata                            (pixel_buffer_0_avalon_pixel_buffer_slave_readdata),
      .pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa                    (pixel_buffer_0_avalon_pixel_buffer_slave_readdata_from_sa),
      .pixel_buffer_0_avalon_pixel_buffer_slave_reset                               (pixel_buffer_0_avalon_pixel_buffer_slave_reset),
      .pixel_buffer_0_avalon_pixel_buffer_slave_write                               (pixel_buffer_0_avalon_pixel_buffer_slave_write),
      .pixel_buffer_0_avalon_pixel_buffer_slave_writedata                           (pixel_buffer_0_avalon_pixel_buffer_slave_writedata),
      .reset_n                                                                      (clk_0_reset_n)
    );

  pixel_buffer_0_avalon_pixel_buffer_master_arbitrator the_pixel_buffer_0_avalon_pixel_buffer_master
    (
      .clk                                                                                  (clk_0),
      .d1_sram_0_avalon_sram_slave_end_xfer                                                 (d1_sram_0_avalon_sram_slave_end_xfer),
      .pixel_buffer_0_avalon_pixel_buffer_master_address                                    (pixel_buffer_0_avalon_pixel_buffer_master_address),
      .pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave                           (pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave           (pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_latency_counter                            (pixel_buffer_0_avalon_pixel_buffer_master_latency_counter),
      .pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave (pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_read                                       (pixel_buffer_0_avalon_pixel_buffer_master_read),
      .pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave   (pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_readdata                                   (pixel_buffer_0_avalon_pixel_buffer_master_readdata),
      .pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid                              (pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid),
      .pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave          (pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_waitrequest                                (pixel_buffer_0_avalon_pixel_buffer_master_waitrequest),
      .reset_n                                                                              (clk_0_reset_n),
      .sram_0_avalon_sram_slave_readdata_from_sa                                            (sram_0_avalon_sram_slave_readdata_from_sa)
    );

  pixel_buffer_0_avalon_pixel_buffer_source_arbitrator the_pixel_buffer_0_avalon_pixel_buffer_source
    (
      .clk                                                     (clk_0),
      .pixel_buffer_0_avalon_pixel_buffer_source_data          (pixel_buffer_0_avalon_pixel_buffer_source_data),
      .pixel_buffer_0_avalon_pixel_buffer_source_empty         (pixel_buffer_0_avalon_pixel_buffer_source_empty),
      .pixel_buffer_0_avalon_pixel_buffer_source_endofpacket   (pixel_buffer_0_avalon_pixel_buffer_source_endofpacket),
      .pixel_buffer_0_avalon_pixel_buffer_source_ready         (pixel_buffer_0_avalon_pixel_buffer_source_ready),
      .pixel_buffer_0_avalon_pixel_buffer_source_startofpacket (pixel_buffer_0_avalon_pixel_buffer_source_startofpacket),
      .pixel_buffer_0_avalon_pixel_buffer_source_valid         (pixel_buffer_0_avalon_pixel_buffer_source_valid),
      .reset_n                                                 (clk_0_reset_n),
      .vga_0_avalon_vga_sink_ready_from_sa                     (vga_0_avalon_vga_sink_ready_from_sa)
    );

  pixel_buffer_0 the_pixel_buffer_0
    (
      .clk                  (clk_0),
      .master_address       (pixel_buffer_0_avalon_pixel_buffer_master_address),
      .master_arbiterlock   (pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock),
      .master_read          (pixel_buffer_0_avalon_pixel_buffer_master_read),
      .master_readdata      (pixel_buffer_0_avalon_pixel_buffer_master_readdata),
      .master_readdatavalid (pixel_buffer_0_avalon_pixel_buffer_master_readdatavalid),
      .master_waitrequest   (pixel_buffer_0_avalon_pixel_buffer_master_waitrequest),
      .reset                (pixel_buffer_0_avalon_pixel_buffer_slave_reset),
      .slave_address        (pixel_buffer_0_avalon_pixel_buffer_slave_address),
      .slave_byteenable     (pixel_buffer_0_avalon_pixel_buffer_slave_byteenable),
      .slave_read           (pixel_buffer_0_avalon_pixel_buffer_slave_read),
      .slave_readdata       (pixel_buffer_0_avalon_pixel_buffer_slave_readdata),
      .slave_write          (pixel_buffer_0_avalon_pixel_buffer_slave_write),
      .slave_writedata      (pixel_buffer_0_avalon_pixel_buffer_slave_writedata),
      .stream_data          (pixel_buffer_0_avalon_pixel_buffer_source_data),
      .stream_empty         (pixel_buffer_0_avalon_pixel_buffer_source_empty),
      .stream_endofpacket   (pixel_buffer_0_avalon_pixel_buffer_source_endofpacket),
      .stream_ready         (pixel_buffer_0_avalon_pixel_buffer_source_ready),
      .stream_startofpacket (pixel_buffer_0_avalon_pixel_buffer_source_startofpacket),
      .stream_valid         (pixel_buffer_0_avalon_pixel_buffer_source_valid)
    );

  push_buttons_s1_arbitrator the_push_buttons_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_push_buttons_s1                   (cpu_0_data_master_granted_push_buttons_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_push_buttons_s1         (cpu_0_data_master_qualified_request_push_buttons_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_push_buttons_s1           (cpu_0_data_master_read_data_valid_push_buttons_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_push_buttons_s1                  (cpu_0_data_master_requests_push_buttons_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_push_buttons_s1_end_xfer                                 (d1_push_buttons_s1_end_xfer),
      .push_buttons_s1_address                                     (push_buttons_s1_address),
      .push_buttons_s1_chipselect                                  (push_buttons_s1_chipselect),
      .push_buttons_s1_irq                                         (push_buttons_s1_irq),
      .push_buttons_s1_irq_from_sa                                 (push_buttons_s1_irq_from_sa),
      .push_buttons_s1_readdata                                    (push_buttons_s1_readdata),
      .push_buttons_s1_readdata_from_sa                            (push_buttons_s1_readdata_from_sa),
      .push_buttons_s1_reset_n                                     (push_buttons_s1_reset_n),
      .push_buttons_s1_write_n                                     (push_buttons_s1_write_n),
      .push_buttons_s1_writedata                                   (push_buttons_s1_writedata),
      .reset_n                                                     (clk_0_reset_n)
    );

  push_buttons the_push_buttons
    (
      .address    (push_buttons_s1_address),
      .chipselect (push_buttons_s1_chipselect),
      .clk        (clk_0),
      .in_port    (in_port_to_the_push_buttons),
      .irq        (push_buttons_s1_irq),
      .readdata   (push_buttons_s1_readdata),
      .reset_n    (push_buttons_s1_reset_n),
      .write_n    (push_buttons_s1_write_n),
      .writedata  (push_buttons_s1_writedata)
    );

  sdram_0_s1_arbitrator the_sdram_0_s1
    (
      .clk                                                                (clk_0),
      .cpu_0_data_master_address_to_slave                                 (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                       (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sdram_0_s1                            (cpu_0_data_master_byteenable_sdram_0_s1),
      .cpu_0_data_master_dbs_address                                      (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                     (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sdram_0_s1                               (cpu_0_data_master_granted_sdram_0_s1),
      .cpu_0_data_master_latency_counter                                  (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sdram_0_s1                     (cpu_0_data_master_qualified_request_sdram_0_s1),
      .cpu_0_data_master_read                                             (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1                       (cpu_0_data_master_read_data_valid_sdram_0_s1),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register        (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_requests_sdram_0_s1                              (cpu_0_data_master_requests_sdram_0_s1),
      .cpu_0_data_master_write                                            (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                          (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                               (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sdram_0_s1                        (cpu_0_instruction_master_granted_sdram_0_s1),
      .cpu_0_instruction_master_latency_counter                           (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_sdram_0_s1              (cpu_0_instruction_master_qualified_request_sdram_0_s1),
      .cpu_0_instruction_master_read                                      (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1                (cpu_0_instruction_master_read_data_valid_sdram_0_s1),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_requests_sdram_0_s1                       (cpu_0_instruction_master_requests_sdram_0_s1),
      .d1_sdram_0_s1_end_xfer                                             (d1_sdram_0_s1_end_xfer),
      .reset_n                                                            (clk_0_reset_n),
      .sdram_0_s1_address                                                 (sdram_0_s1_address),
      .sdram_0_s1_byteenable_n                                            (sdram_0_s1_byteenable_n),
      .sdram_0_s1_chipselect                                              (sdram_0_s1_chipselect),
      .sdram_0_s1_read_n                                                  (sdram_0_s1_read_n),
      .sdram_0_s1_readdata                                                (sdram_0_s1_readdata),
      .sdram_0_s1_readdata_from_sa                                        (sdram_0_s1_readdata_from_sa),
      .sdram_0_s1_readdatavalid                                           (sdram_0_s1_readdatavalid),
      .sdram_0_s1_reset_n                                                 (sdram_0_s1_reset_n),
      .sdram_0_s1_waitrequest                                             (sdram_0_s1_waitrequest),
      .sdram_0_s1_waitrequest_from_sa                                     (sdram_0_s1_waitrequest_from_sa),
      .sdram_0_s1_write_n                                                 (sdram_0_s1_write_n),
      .sdram_0_s1_writedata                                               (sdram_0_s1_writedata)
    );

  sdram_0 the_sdram_0
    (
      .az_addr        (sdram_0_s1_address),
      .az_be_n        (sdram_0_s1_byteenable_n),
      .az_cs          (sdram_0_s1_chipselect),
      .az_data        (sdram_0_s1_writedata),
      .az_rd_n        (sdram_0_s1_read_n),
      .az_wr_n        (sdram_0_s1_write_n),
      .clk            (clk_0),
      .reset_n        (sdram_0_s1_reset_n),
      .za_data        (sdram_0_s1_readdata),
      .za_valid       (sdram_0_s1_readdatavalid),
      .za_waitrequest (sdram_0_s1_waitrequest),
      .zs_addr        (zs_addr_from_the_sdram_0),
      .zs_ba          (zs_ba_from_the_sdram_0),
      .zs_cas_n       (zs_cas_n_from_the_sdram_0),
      .zs_cke         (zs_cke_from_the_sdram_0),
      .zs_cs_n        (zs_cs_n_from_the_sdram_0),
      .zs_dq          (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm         (zs_dqm_from_the_sdram_0),
      .zs_ras_n       (zs_ras_n_from_the_sdram_0),
      .zs_we_n        (zs_we_n_from_the_sdram_0)
    );

  sram_0_avalon_sram_slave_arbitrator the_sram_0_avalon_sram_slave
    (
      .clk                                                                                  (clk_0),
      .cpu_0_data_master_address_to_slave                                                   (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                                         (cpu_0_data_master_byteenable),
      .cpu_0_data_master_byteenable_sram_0_avalon_sram_slave                                (cpu_0_data_master_byteenable_sram_0_avalon_sram_slave),
      .cpu_0_data_master_dbs_address                                                        (cpu_0_data_master_dbs_address),
      .cpu_0_data_master_dbs_write_16                                                       (cpu_0_data_master_dbs_write_16),
      .cpu_0_data_master_granted_sram_0_avalon_sram_slave                                   (cpu_0_data_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_data_master_latency_counter                                                    (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave                         (cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_data_master_read                                                               (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register                          (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave                           (cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_data_master_requests_sram_0_avalon_sram_slave                                  (cpu_0_data_master_requests_sram_0_avalon_sram_slave),
      .cpu_0_data_master_write                                                              (cpu_0_data_master_write),
      .cpu_0_instruction_master_address_to_slave                                            (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_dbs_address                                                 (cpu_0_instruction_master_dbs_address),
      .cpu_0_instruction_master_granted_sram_0_avalon_sram_slave                            (cpu_0_instruction_master_granted_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_latency_counter                                             (cpu_0_instruction_master_latency_counter),
      .cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave                  (cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_read                                                        (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register                   (cpu_0_instruction_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave                    (cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave),
      .cpu_0_instruction_master_requests_sram_0_avalon_sram_slave                           (cpu_0_instruction_master_requests_sram_0_avalon_sram_slave),
      .d1_sram_0_avalon_sram_slave_end_xfer                                                 (d1_sram_0_avalon_sram_slave_end_xfer),
      .pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave                           (pixel_buffer_0_avalon_pixel_buffer_master_address_to_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock                                (pixel_buffer_0_avalon_pixel_buffer_master_arbiterlock),
      .pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave           (pixel_buffer_0_avalon_pixel_buffer_master_granted_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_latency_counter                            (pixel_buffer_0_avalon_pixel_buffer_master_latency_counter),
      .pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave (pixel_buffer_0_avalon_pixel_buffer_master_qualified_request_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_read                                       (pixel_buffer_0_avalon_pixel_buffer_master_read),
      .pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave   (pixel_buffer_0_avalon_pixel_buffer_master_read_data_valid_sram_0_avalon_sram_slave),
      .pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave          (pixel_buffer_0_avalon_pixel_buffer_master_requests_sram_0_avalon_sram_slave),
      .reset_n                                                                              (clk_0_reset_n),
      .sram_0_avalon_sram_slave_address                                                     (sram_0_avalon_sram_slave_address),
      .sram_0_avalon_sram_slave_byteenable                                                  (sram_0_avalon_sram_slave_byteenable),
      .sram_0_avalon_sram_slave_read                                                        (sram_0_avalon_sram_slave_read),
      .sram_0_avalon_sram_slave_readdata                                                    (sram_0_avalon_sram_slave_readdata),
      .sram_0_avalon_sram_slave_readdata_from_sa                                            (sram_0_avalon_sram_slave_readdata_from_sa),
      .sram_0_avalon_sram_slave_reset                                                       (sram_0_avalon_sram_slave_reset),
      .sram_0_avalon_sram_slave_write                                                       (sram_0_avalon_sram_slave_write),
      .sram_0_avalon_sram_slave_writedata                                                   (sram_0_avalon_sram_slave_writedata)
    );

  sram_0 the_sram_0
    (
      .SRAM_ADDR  (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N  (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ    (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N  (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N  (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N  (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N  (SRAM_WE_N_from_the_sram_0),
      .address    (sram_0_avalon_sram_slave_address),
      .byteenable (sram_0_avalon_sram_slave_byteenable),
      .clk        (clk_0),
      .read       (sram_0_avalon_sram_slave_read),
      .readdata   (sram_0_avalon_sram_slave_readdata),
      .reset      (sram_0_avalon_sram_slave_reset),
      .write      (sram_0_avalon_sram_slave_write),
      .writedata  (sram_0_avalon_sram_slave_writedata)
    );

  switches_s1_arbitrator the_switches_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_switches_s1                       (cpu_0_data_master_granted_switches_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_switches_s1             (cpu_0_data_master_qualified_request_switches_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_switches_s1               (cpu_0_data_master_read_data_valid_switches_s1),
      .cpu_0_data_master_requests_switches_s1                      (cpu_0_data_master_requests_switches_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_switches_s1_end_xfer                                     (d1_switches_s1_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .switches_s1_address                                         (switches_s1_address),
      .switches_s1_readdata                                        (switches_s1_readdata),
      .switches_s1_readdata_from_sa                                (switches_s1_readdata_from_sa),
      .switches_s1_reset_n                                         (switches_s1_reset_n)
    );

  switches the_switches
    (
      .address  (switches_s1_address),
      .clk      (clk_0),
      .in_port  (in_port_to_the_switches),
      .readdata (switches_s1_readdata),
      .reset_n  (switches_s1_reset_n)
    );

  sysid_control_slave_arbitrator the_sysid_control_slave
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_sysid_control_slave               (cpu_0_data_master_granted_sysid_control_slave),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_sysid_control_slave     (cpu_0_data_master_qualified_request_sysid_control_slave),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_sysid_control_slave       (cpu_0_data_master_read_data_valid_sysid_control_slave),
      .cpu_0_data_master_requests_sysid_control_slave              (cpu_0_data_master_requests_sysid_control_slave),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .d1_sysid_control_slave_end_xfer                             (d1_sysid_control_slave_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .sysid_control_slave_address                                 (sysid_control_slave_address),
      .sysid_control_slave_readdata                                (sysid_control_slave_readdata),
      .sysid_control_slave_readdata_from_sa                        (sysid_control_slave_readdata_from_sa)
    );

  sysid the_sysid
    (
      .address  (sysid_control_slave_address),
      .readdata (sysid_control_slave_readdata)
    );

  timer_0_s1_arbitrator the_timer_0_s1
    (
      .clk                                                         (clk_0),
      .cpu_0_data_master_address_to_slave                          (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_timer_0_s1                        (cpu_0_data_master_granted_timer_0_s1),
      .cpu_0_data_master_latency_counter                           (cpu_0_data_master_latency_counter),
      .cpu_0_data_master_qualified_request_timer_0_s1              (cpu_0_data_master_qualified_request_timer_0_s1),
      .cpu_0_data_master_read                                      (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register (cpu_0_data_master_read_data_valid_sdram_0_s1_shift_register),
      .cpu_0_data_master_read_data_valid_timer_0_s1                (cpu_0_data_master_read_data_valid_timer_0_s1),
      .cpu_0_data_master_requests_timer_0_s1                       (cpu_0_data_master_requests_timer_0_s1),
      .cpu_0_data_master_write                                     (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                 (cpu_0_data_master_writedata),
      .d1_timer_0_s1_end_xfer                                      (d1_timer_0_s1_end_xfer),
      .reset_n                                                     (clk_0_reset_n),
      .timer_0_s1_address                                          (timer_0_s1_address),
      .timer_0_s1_chipselect                                       (timer_0_s1_chipselect),
      .timer_0_s1_irq                                              (timer_0_s1_irq),
      .timer_0_s1_irq_from_sa                                      (timer_0_s1_irq_from_sa),
      .timer_0_s1_readdata                                         (timer_0_s1_readdata),
      .timer_0_s1_readdata_from_sa                                 (timer_0_s1_readdata_from_sa),
      .timer_0_s1_reset_n                                          (timer_0_s1_reset_n),
      .timer_0_s1_write_n                                          (timer_0_s1_write_n),
      .timer_0_s1_writedata                                        (timer_0_s1_writedata)
    );

  timer_0 the_timer_0
    (
      .address    (timer_0_s1_address),
      .chipselect (timer_0_s1_chipselect),
      .clk        (clk_0),
      .irq        (timer_0_s1_irq),
      .readdata   (timer_0_s1_readdata),
      .reset_n    (timer_0_s1_reset_n),
      .write_n    (timer_0_s1_write_n),
      .writedata  (timer_0_s1_writedata)
    );

  vga_0_avalon_vga_sink_arbitrator the_vga_0_avalon_vga_sink
    (
      .clk                                                     (clk_0),
      .pixel_buffer_0_avalon_pixel_buffer_source_data          (pixel_buffer_0_avalon_pixel_buffer_source_data),
      .pixel_buffer_0_avalon_pixel_buffer_source_empty         (pixel_buffer_0_avalon_pixel_buffer_source_empty),
      .pixel_buffer_0_avalon_pixel_buffer_source_endofpacket   (pixel_buffer_0_avalon_pixel_buffer_source_endofpacket),
      .pixel_buffer_0_avalon_pixel_buffer_source_startofpacket (pixel_buffer_0_avalon_pixel_buffer_source_startofpacket),
      .pixel_buffer_0_avalon_pixel_buffer_source_valid         (pixel_buffer_0_avalon_pixel_buffer_source_valid),
      .reset_n                                                 (clk_0_reset_n),
      .vga_0_avalon_vga_sink_data                              (vga_0_avalon_vga_sink_data),
      .vga_0_avalon_vga_sink_empty                             (vga_0_avalon_vga_sink_empty),
      .vga_0_avalon_vga_sink_endofpacket                       (vga_0_avalon_vga_sink_endofpacket),
      .vga_0_avalon_vga_sink_ready                             (vga_0_avalon_vga_sink_ready),
      .vga_0_avalon_vga_sink_ready_from_sa                     (vga_0_avalon_vga_sink_ready_from_sa),
      .vga_0_avalon_vga_sink_reset                             (vga_0_avalon_vga_sink_reset),
      .vga_0_avalon_vga_sink_startofpacket                     (vga_0_avalon_vga_sink_startofpacket),
      .vga_0_avalon_vga_sink_valid                             (vga_0_avalon_vga_sink_valid)
    );

  vga_0 the_vga_0
    (
      .VGA_B         (VGA_B_from_the_vga_0),
      .VGA_BLANK     (VGA_BLANK_from_the_vga_0),
      .VGA_G         (VGA_G_from_the_vga_0),
      .VGA_HS        (VGA_HS_from_the_vga_0),
      .VGA_R         (VGA_R_from_the_vga_0),
      .VGA_SYNC      (VGA_SYNC_from_the_vga_0),
      .VGA_VS        (VGA_VS_from_the_vga_0),
      .clk           (clk_0),
      .data          (vga_0_avalon_vga_sink_data),
      .empty         (vga_0_avalon_vga_sink_empty),
      .endofpacket   (vga_0_avalon_vga_sink_endofpacket),
      .ready         (vga_0_avalon_vga_sink_ready),
      .reset         (vga_0_avalon_vga_sink_reset),
      .startofpacket (vga_0_avalon_vga_sink_startofpacket),
      .valid         (vga_0_avalon_vga_sink_valid)
    );

  //reset is asserted asynchronously and deasserted synchronously
  processor1_reset_clk_0_domain_synch_module processor1_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0 |
    cpu_0_jtag_debug_module_resetrequest_from_sa |
    cpu_0_jtag_debug_module_resetrequest_from_sa);


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/91/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/91/quartus/eda/sim_lib/220model.v"
`include "c:/altera/91/quartus/eda/sim_lib/sgate.v"
`include "sram_0.v"
`include "pixel_buffer_0.v"
`include "audio_and_video_config_0.v"
`include "audio_0.v"
`include "vga_0.v"
`include "de_boards_0.v"
`include "leds.v"
`include "timer_0.v"
`include "sysid.v"
`include "input_packet.v"
`include "cpu_0_test_bench.v"
`include "cpu_0_mult_cell.v"
`include "cpu_0_oci_test_bench.v"
`include "cpu_0_jtag_debug_module_tck.v"
`include "cpu_0_jtag_debug_module_sysclk.v"
`include "cpu_0_jtag_debug_module_wrapper.v"
`include "cpu_0.v"
`include "switches.v"
`include "push_buttons.v"
`include "jtag_uart_0.v"
`include "lcd_0.v"
`include "sdram_0.v"
`include "output_packet.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             AUD_ADCDAT_to_the_audio_0;
  wire             AUD_ADCLRCK_to_and_from_the_audio_0;
  wire             AUD_BCLK_to_and_from_the_audio_0;
  wire             AUD_DACDAT_from_the_audio_0;
  wire             AUD_DACLRCK_to_and_from_the_audio_0;
  wire             AUD_XCK_from_the_de_boards_0;
  wire             DRAM_CLK_from_the_de_boards_0;
  wire             I2C_SCLK_from_the_audio_and_video_config_0;
  wire             I2C_SDAT_to_and_from_the_audio_and_video_config_0;
  wire             LCD_E_from_the_lcd_0;
  wire             LCD_RS_from_the_lcd_0;
  wire             LCD_RW_from_the_lcd_0;
  wire    [  7: 0] LCD_data_to_and_from_the_lcd_0;
  wire    [ 17: 0] SRAM_ADDR_from_the_sram_0;
  wire             SRAM_CE_N_from_the_sram_0;
  wire    [ 15: 0] SRAM_DQ_to_and_from_the_sram_0;
  wire             SRAM_LB_N_from_the_sram_0;
  wire             SRAM_OE_N_from_the_sram_0;
  wire             SRAM_UB_N_from_the_sram_0;
  wire             SRAM_WE_N_from_the_sram_0;
  wire             VGA_BLANK_from_the_vga_0;
  wire    [  9: 0] VGA_B_from_the_vga_0;
  wire             VGA_CLK_from_the_de_boards_0;
  wire    [  9: 0] VGA_G_from_the_vga_0;
  wire             VGA_HS_from_the_vga_0;
  wire    [  9: 0] VGA_R_from_the_vga_0;
  wire             VGA_SYNC_from_the_vga_0;
  wire             VGA_VS_from_the_vga_0;
  wire             clk;
  reg              clk_0;
  wire             ext_clk_27_to_the_de_boards_0;
  wire             ext_clk_50_to_the_de_boards_0;
  wire    [ 31: 0] in_port_to_the_input_packet;
  wire    [  3: 0] in_port_to_the_push_buttons;
  wire    [ 17: 0] in_port_to_the_switches;
  wire             jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa;
  wire             jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa;
  wire    [ 26: 0] out_port_from_the_leds;
  wire    [ 31: 0] out_port_from_the_output_packet;
  reg              reset_n;
  wire             system_clk_from_the_de_boards_0;
  wire    [ 11: 0] zs_addr_from_the_sdram_0;
  wire    [  1: 0] zs_ba_from_the_sdram_0;
  wire             zs_cas_n_from_the_sdram_0;
  wire             zs_cke_from_the_sdram_0;
  wire             zs_cs_n_from_the_sdram_0;
  wire    [ 15: 0] zs_dq_to_and_from_the_sdram_0;
  wire    [  1: 0] zs_dqm_from_the_sdram_0;
  wire             zs_ras_n_from_the_sdram_0;
  wire             zs_we_n_from_the_sdram_0;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  processor1 DUT
    (
      .AUD_ADCDAT_to_the_audio_0                         (AUD_ADCDAT_to_the_audio_0),
      .AUD_ADCLRCK_to_and_from_the_audio_0               (AUD_ADCLRCK_to_and_from_the_audio_0),
      .AUD_BCLK_to_and_from_the_audio_0                  (AUD_BCLK_to_and_from_the_audio_0),
      .AUD_DACDAT_from_the_audio_0                       (AUD_DACDAT_from_the_audio_0),
      .AUD_DACLRCK_to_and_from_the_audio_0               (AUD_DACLRCK_to_and_from_the_audio_0),
      .AUD_XCK_from_the_de_boards_0                      (AUD_XCK_from_the_de_boards_0),
      .DRAM_CLK_from_the_de_boards_0                     (DRAM_CLK_from_the_de_boards_0),
      .I2C_SCLK_from_the_audio_and_video_config_0        (I2C_SCLK_from_the_audio_and_video_config_0),
      .I2C_SDAT_to_and_from_the_audio_and_video_config_0 (I2C_SDAT_to_and_from_the_audio_and_video_config_0),
      .LCD_E_from_the_lcd_0                              (LCD_E_from_the_lcd_0),
      .LCD_RS_from_the_lcd_0                             (LCD_RS_from_the_lcd_0),
      .LCD_RW_from_the_lcd_0                             (LCD_RW_from_the_lcd_0),
      .LCD_data_to_and_from_the_lcd_0                    (LCD_data_to_and_from_the_lcd_0),
      .SRAM_ADDR_from_the_sram_0                         (SRAM_ADDR_from_the_sram_0),
      .SRAM_CE_N_from_the_sram_0                         (SRAM_CE_N_from_the_sram_0),
      .SRAM_DQ_to_and_from_the_sram_0                    (SRAM_DQ_to_and_from_the_sram_0),
      .SRAM_LB_N_from_the_sram_0                         (SRAM_LB_N_from_the_sram_0),
      .SRAM_OE_N_from_the_sram_0                         (SRAM_OE_N_from_the_sram_0),
      .SRAM_UB_N_from_the_sram_0                         (SRAM_UB_N_from_the_sram_0),
      .SRAM_WE_N_from_the_sram_0                         (SRAM_WE_N_from_the_sram_0),
      .VGA_BLANK_from_the_vga_0                          (VGA_BLANK_from_the_vga_0),
      .VGA_B_from_the_vga_0                              (VGA_B_from_the_vga_0),
      .VGA_CLK_from_the_de_boards_0                      (VGA_CLK_from_the_de_boards_0),
      .VGA_G_from_the_vga_0                              (VGA_G_from_the_vga_0),
      .VGA_HS_from_the_vga_0                             (VGA_HS_from_the_vga_0),
      .VGA_R_from_the_vga_0                              (VGA_R_from_the_vga_0),
      .VGA_SYNC_from_the_vga_0                           (VGA_SYNC_from_the_vga_0),
      .VGA_VS_from_the_vga_0                             (VGA_VS_from_the_vga_0),
      .clk_0                                             (clk_0),
      .ext_clk_27_to_the_de_boards_0                     (ext_clk_27_to_the_de_boards_0),
      .ext_clk_50_to_the_de_boards_0                     (ext_clk_50_to_the_de_boards_0),
      .in_port_to_the_input_packet                       (in_port_to_the_input_packet),
      .in_port_to_the_push_buttons                       (in_port_to_the_push_buttons),
      .in_port_to_the_switches                           (in_port_to_the_switches),
      .out_port_from_the_leds                            (out_port_from_the_leds),
      .out_port_from_the_output_packet                   (out_port_from_the_output_packet),
      .reset_n                                           (reset_n),
      .system_clk_from_the_de_boards_0                   (system_clk_from_the_de_boards_0),
      .zs_addr_from_the_sdram_0                          (zs_addr_from_the_sdram_0),
      .zs_ba_from_the_sdram_0                            (zs_ba_from_the_sdram_0),
      .zs_cas_n_from_the_sdram_0                         (zs_cas_n_from_the_sdram_0),
      .zs_cke_from_the_sdram_0                           (zs_cke_from_the_sdram_0),
      .zs_cs_n_from_the_sdram_0                          (zs_cs_n_from_the_sdram_0),
      .zs_dq_to_and_from_the_sdram_0                     (zs_dq_to_and_from_the_sdram_0),
      .zs_dqm_from_the_sdram_0                           (zs_dqm_from_the_sdram_0),
      .zs_ras_n_from_the_sdram_0                         (zs_ras_n_from_the_sdram_0),
      .zs_we_n_from_the_sdram_0                          (zs_we_n_from_the_sdram_0)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on