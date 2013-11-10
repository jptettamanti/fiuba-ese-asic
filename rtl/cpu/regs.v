//-----------------------------------------------------------------
//
//            Diseño de Circuitos Integrados Digitales
//                   Trabajo Practico Final
//
//            Autor: Juan Pablo Tettamanti
//            Email: jptettamanti@gmail.com
//
//-----------------------------------------------------------------


//-----------------------------------------------------------------
// Includes
//-----------------------------------------------------------------
`include "defs.v"

//-----------------------------------------------------------------
// Module - Register bank
//-----------------------------------------------------------------
module RegisterBank
(
   input  wire            rst,
   input  wire            clk,
   input  wire            update,

   // Selected registers
   input  wire [4:0]      ri_select,            /* First operand */
   input  wire [4:0]      rj_select,            /* Second operand */
   input  wire [4:0]      rk_select,            /* Result */

   // Registers
   output wire [8-1:0]    ri_data,              /*verilator public*/
   output wire [8-1:0]    rj_data,              /*verilator public*/
   input  wire [8-1:0]    rk_data,              /*verilator public*/
   
   acc
   ram
   imm
   
   ramsel
   ramaddr
   ramdatain
   ramdataout
   
   alusel
   
   pcjmp
);

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [8-1:0] r0;
reg [8-1:0] r1;

//-----------------------------------------------------------------
// ALU
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (~rst) begin
      r0 <= {8{1'b0}};
      r1 <= {8{1'b0}};
   end
   else if (update) begin
      case (rj_select)
      `R0 : begin
         r0 <= rk_data;
      end
      `R1 : begin
         r1 <= rk_data;
      end
   end
   else begin
      r0 <= r0;
      r1 <= r1;
   end

   case (operation)
   //----------------------------------------------
   // Arithmetic
   //----------------------------------------------
   `ALU_ADD : begin
      {c_o, result} = (a_i + b_i);
      c_update_o    = 1'b1;
   end
   `ALU_ADDC : begin
      {c_o, result} = (a_i + b_i) + {{(8-1){1'b0}}, c_i};
      c_update_o    = 1'b1;
   end
   `ALU_SUB : begin
      result        = (a_i - b_i);
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   `ALU_SUBC : begin
      result        = (a_i - b_i) - {{(8-1){1'b0}}, c_i};
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   //----------------------------------------------
   // Logical
   //----------------------------------------------
   `ALU_NAND : begin
      result        = ~(a_i & b_i);
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   `ALU_NOR  : begin
      result        = ~(a_i | b_i);
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   `ALU_XOR : begin
      result        = (a_i ^ b_i);
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   `ALU_XNOR : begin
      result        = ~(a_i ^ b_i);
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   //----------------------------------------------
   // Default
   //----------------------------------------------
   default : begin
      result        = a_i;
      c_o           = 1'b0;
      c_update_o    = 1'b0;
   end
   endcase
end