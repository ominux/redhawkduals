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

module output_packet (
                       // inputs:
                        address,
                        chipselect,
                        clk,
                        reset_n,
                        write_n,
                        writedata,

                       // outputs:
                        out_port,
                        readdata
                     )
;

  output  [ 31: 0] out_port;
  output  [ 31: 0] readdata;
  input   [  2: 0] address;
  input            chipselect;
  input            clk;
  input            reset_n;
  input            write_n;
  input   [ 31: 0] writedata;

  wire             clk_en;
  reg     [ 31: 0] data_out;
  wire             out_clear_wr_strobe;
  wire    [ 31: 0] out_port;
  wire    [ 31: 0] read_mux_out;
  wire    [ 31: 0] readdata;
  wire             wr_strobe;
  assign clk_en = 1;
  //s1, which is an e_avalon_slave
  assign read_mux_out = {32 {(address == 0)}} & data_out;
  assign out_clear_wr_strobe = chipselect && ~write_n && (address == 5);
  assign wr_strobe = chipselect && ~write_n;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[0] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[0])
              data_out[0] <= 0;
          else if (wr_strobe)
              data_out[0] <= ((address == 4) && (writedata[0] == 1))? 1: (address == 0)? writedata[0]: data_out[0];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[1] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[1])
              data_out[1] <= 0;
          else if (wr_strobe)
              data_out[1] <= ((address == 4) && (writedata[1] == 1))? 1: (address == 0)? writedata[1]: data_out[1];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[2] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[2])
              data_out[2] <= 0;
          else if (wr_strobe)
              data_out[2] <= ((address == 4) && (writedata[2] == 1))? 1: (address == 0)? writedata[2]: data_out[2];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[3] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[3])
              data_out[3] <= 0;
          else if (wr_strobe)
              data_out[3] <= ((address == 4) && (writedata[3] == 1))? 1: (address == 0)? writedata[3]: data_out[3];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[4] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[4])
              data_out[4] <= 0;
          else if (wr_strobe)
              data_out[4] <= ((address == 4) && (writedata[4] == 1))? 1: (address == 0)? writedata[4]: data_out[4];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[5] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[5])
              data_out[5] <= 0;
          else if (wr_strobe)
              data_out[5] <= ((address == 4) && (writedata[5] == 1))? 1: (address == 0)? writedata[5]: data_out[5];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[6] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[6])
              data_out[6] <= 0;
          else if (wr_strobe)
              data_out[6] <= ((address == 4) && (writedata[6] == 1))? 1: (address == 0)? writedata[6]: data_out[6];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[7] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[7])
              data_out[7] <= 0;
          else if (wr_strobe)
              data_out[7] <= ((address == 4) && (writedata[7] == 1))? 1: (address == 0)? writedata[7]: data_out[7];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[8] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[8])
              data_out[8] <= 0;
          else if (wr_strobe)
              data_out[8] <= ((address == 4) && (writedata[8] == 1))? 1: (address == 0)? writedata[8]: data_out[8];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[9] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[9])
              data_out[9] <= 0;
          else if (wr_strobe)
              data_out[9] <= ((address == 4) && (writedata[9] == 1))? 1: (address == 0)? writedata[9]: data_out[9];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[10] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[10])
              data_out[10] <= 0;
          else if (wr_strobe)
              data_out[10] <= ((address == 4) && (writedata[10] == 1))? 1: (address == 0)? writedata[10]: data_out[10];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[11] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[11])
              data_out[11] <= 0;
          else if (wr_strobe)
              data_out[11] <= ((address == 4) && (writedata[11] == 1))? 1: (address == 0)? writedata[11]: data_out[11];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[12] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[12])
              data_out[12] <= 0;
          else if (wr_strobe)
              data_out[12] <= ((address == 4) && (writedata[12] == 1))? 1: (address == 0)? writedata[12]: data_out[12];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[13] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[13])
              data_out[13] <= 0;
          else if (wr_strobe)
              data_out[13] <= ((address == 4) && (writedata[13] == 1))? 1: (address == 0)? writedata[13]: data_out[13];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[14] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[14])
              data_out[14] <= 0;
          else if (wr_strobe)
              data_out[14] <= ((address == 4) && (writedata[14] == 1))? 1: (address == 0)? writedata[14]: data_out[14];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[15] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[15])
              data_out[15] <= 0;
          else if (wr_strobe)
              data_out[15] <= ((address == 4) && (writedata[15] == 1))? 1: (address == 0)? writedata[15]: data_out[15];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[16] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[16])
              data_out[16] <= 0;
          else if (wr_strobe)
              data_out[16] <= ((address == 4) && (writedata[16] == 1))? 1: (address == 0)? writedata[16]: data_out[16];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[17] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[17])
              data_out[17] <= 0;
          else if (wr_strobe)
              data_out[17] <= ((address == 4) && (writedata[17] == 1))? 1: (address == 0)? writedata[17]: data_out[17];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[18] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[18])
              data_out[18] <= 0;
          else if (wr_strobe)
              data_out[18] <= ((address == 4) && (writedata[18] == 1))? 1: (address == 0)? writedata[18]: data_out[18];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[19] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[19])
              data_out[19] <= 0;
          else if (wr_strobe)
              data_out[19] <= ((address == 4) && (writedata[19] == 1))? 1: (address == 0)? writedata[19]: data_out[19];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[20] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[20])
              data_out[20] <= 0;
          else if (wr_strobe)
              data_out[20] <= ((address == 4) && (writedata[20] == 1))? 1: (address == 0)? writedata[20]: data_out[20];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[21] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[21])
              data_out[21] <= 0;
          else if (wr_strobe)
              data_out[21] <= ((address == 4) && (writedata[21] == 1))? 1: (address == 0)? writedata[21]: data_out[21];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[22] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[22])
              data_out[22] <= 0;
          else if (wr_strobe)
              data_out[22] <= ((address == 4) && (writedata[22] == 1))? 1: (address == 0)? writedata[22]: data_out[22];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[23] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[23])
              data_out[23] <= 0;
          else if (wr_strobe)
              data_out[23] <= ((address == 4) && (writedata[23] == 1))? 1: (address == 0)? writedata[23]: data_out[23];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[24] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[24])
              data_out[24] <= 0;
          else if (wr_strobe)
              data_out[24] <= ((address == 4) && (writedata[24] == 1))? 1: (address == 0)? writedata[24]: data_out[24];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[25] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[25])
              data_out[25] <= 0;
          else if (wr_strobe)
              data_out[25] <= ((address == 4) && (writedata[25] == 1))? 1: (address == 0)? writedata[25]: data_out[25];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[26] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[26])
              data_out[26] <= 0;
          else if (wr_strobe)
              data_out[26] <= ((address == 4) && (writedata[26] == 1))? 1: (address == 0)? writedata[26]: data_out[26];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[27] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[27])
              data_out[27] <= 0;
          else if (wr_strobe)
              data_out[27] <= ((address == 4) && (writedata[27] == 1))? 1: (address == 0)? writedata[27]: data_out[27];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[28] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[28])
              data_out[28] <= 0;
          else if (wr_strobe)
              data_out[28] <= ((address == 4) && (writedata[28] == 1))? 1: (address == 0)? writedata[28]: data_out[28];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[29] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[29])
              data_out[29] <= 0;
          else if (wr_strobe)
              data_out[29] <= ((address == 4) && (writedata[29] == 1))? 1: (address == 0)? writedata[29]: data_out[29];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[30] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[30])
              data_out[30] <= 0;
          else if (wr_strobe)
              data_out[30] <= ((address == 4) && (writedata[30] == 1))? 1: (address == 0)? writedata[30]: data_out[30];
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out[31] <= 0;
      else if (clk_en)
          if (out_clear_wr_strobe && writedata[31])
              data_out[31] <= 0;
          else if (wr_strobe)
              data_out[31] <= ((address == 4) && (writedata[31] == 1))? 1: (address == 0)? writedata[31]: data_out[31];
    end


  assign readdata = read_mux_out;
  assign out_port = data_out;

endmodule

