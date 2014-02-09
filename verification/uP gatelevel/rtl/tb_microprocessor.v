// -----------------------------------------------------------------------------
// Copyright (c) 2013 by Fabricio Alcalde and Gavriel Sanca
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; version 2.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
// 02111-1307, USA.
//
// -----------------------------------------------------------------------------
// File name:
// ----------
//
// tb_microprocessor.v
//
// -----------------------------------------------------------------------------
// Description:
// ------------
//
// Testbench for academic 8 bit processor for Laboratorio de Sistemas
// Digitales undergraduate course, Faculty of Engineering, University of
// Buenos Aires.
//
// -----------------------------------------------------------------------------

`timescale 1ns/1ps

// -----------------------------------------------------------------------
// Change following definitions in order to change the test to be run
// -----------------------------------------------------------------------
// Test names: mult_test/alu_test
`define TEST_NAME     mult_test
`define ROM_FILE_PATH "rom_mem.dat"
`define RAM_FILE_PATH "ram_mem.dat"
// -----------------------------------------------------------------------

module tb_microprocessor ();
   supply1 vdd ;
   supply0 gnd ;

   // --------------------------------------------------------------------
   // Testbench signals
   // --------------------------------------------------------------------
   reg             tb_clk;
   reg             tb_rst;
   wire     [ 7:0] tb_ram_word_read;
   wire     [ 7:0] tb_rom_word;
   wire     [ 7:0] tb_ram_addr;
   wire     [ 7:0] tb_rom_addr;
   wire     [ 7:0] tb_ram_word;
   wire            tb_ram_write_ena;
   // --------------------------------------------------------------------

   // --------------------------------------------------------------------
   // Device under verification (DUV)
   // --------------------------------------------------------------------
   cpu duv (
      .rst                (tb_rst),
      .clk                (tb_clk),
      .imem_data          (tb_rom_word),
      .imem_addr          (tb_rom_addr),
      .dmem_port_value    (tb_ram_word),
      .dmem_port_addr     (tb_ram_addr),
      .dmem_port_write    (tb_ram_write_ena),
      .vdd                (tb_vdd),
      .gnd                (tb_gnd)
   );
   assign tb_ram_word = (~tb_ram_write_ena)? tb_ram_word_read : {8{1'bz}};
   // --------------------------------------------------------------------

   // --------------------------------------------------------------------
   // Data memory
   // --------------------------------------------------------------------
   ram_memory #(
      .WIDTH (8),
      .N_ADDRESS (8),
      .MEMORY_FILE_PATH (`RAM_FILE_PATH)
   ) ram (
      // ----------------------------------
      // Inputs
      // ----------------------------------
      .address       (tb_ram_addr),
      .data_in       (tb_ram_word),
      .wr_ena        (tb_ram_write_ena),
      // ----------------------------------
      // Outputs
      // ----------------------------------
      .data_out      (tb_ram_word_read)
   );
   // --------------------------------------------------------------------

   // --------------------------------------------------------------------
   // Program memory
   // --------------------------------------------------------------------
   rom_memory #(
      .WIDTH            (8),
      .N_ADDRESS        (8),
      .MEMORY_FILE_PATH (`ROM_FILE_PATH)
   ) rom (
      // ----------------------------------
      // Inputs
      // ----------------------------------
      .address       (tb_rom_addr),
      // ----------------------------------
      // Outputs
      // ----------------------------------
      .data_out      (tb_rom_word)
   );
   // --------------------------------------------------------------------

   // --------------------------------------------------------------------
   // Tests
   // --------------------------------------------------------------------
   task mult_test;
      reg      [15:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'h87);
            if (tb_rom_addr==8'h87) begin
               gld_ref = (i*j);
               duv_val = {ram.matrix[3],ram.matrix[2]};
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d * %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d * %0d = %0d",j,i,gld_ref);
               $display ("");
               #50;
            end
         end
         #20;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task nand_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = ~(i&j);
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d ~& %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d ~& %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task nor_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = ~(i|j);
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d ~| %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d ~| %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task sub_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = j-i;
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d - %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d - %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task add_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = j+i;
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated: %0d + %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct   :  %0d + %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task xor_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = j^i;
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d ^ %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d ^ %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask

   task xnor_test;
      reg      [7:0] gld_ref;
      reg      [15:0] duv_val;
      integer         error;
      integer         correct;
      integer         i;
      integer         j;
   begin
      error = 0;
      correct = 0;
      #12 tb_rst = 1'b0;
      #10;
      for (i=0;i<256;i=i+1) begin
         for (j=0;j<256;j=j+1) begin
            wait (tb_rom_addr==8'd8);
            if (tb_rom_addr==8'd8) begin
               gld_ref = ~(j^i);
               duv_val = ram.matrix[2];
               if (gld_ref!=duv_val) begin
                  $display ("ERROR: Incorrect calculation.");
                  error = error + 1;
               end
               else begin
                  $display ("INFO: Correct calculation.");
                  correct = correct + 1;
               end
               $display ("Calculated : %0d ~^ %0d = %0d",ram.matrix[0],ram.matrix[1],duv_val);
               $display ("Correct    : %0d ~^ %0d = %0d",j,i,gld_ref);
               $display ("");
               #30;
            end
         end
         #30;
      end
      $display ("");
      $display ("INFO: It was founded %d errors.",error);
      $display ("INFO: It was founded %d correct values.",correct);
      $display ("");
   end
   endtask
   // --------------------------------------------------------------------

   // --------------------------------------------------------------------
   // Run simulation
   // --------------------------------------------------------------------
   initial begin
      $dumpfile ("./waves/microprocessor.vcd");
      //$dumpvars;
   end

   always begin
      #5 tb_clk = ~tb_clk;
   end

   initial begin
      tb_clk   = 1'b0;
      tb_rst   = 1'b1;
      `TEST_NAME ();
      $finish;
   end
   // --------------------------------------------------------------------

endmodule
