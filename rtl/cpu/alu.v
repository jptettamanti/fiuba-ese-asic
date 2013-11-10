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
// Module - ALU
//-----------------------------------------------------------------
module alu #
(
   parameter             N = `DATA_WIDTH   /* Data width */
)
(
   input  wire [3:0]     operation,         /* ALU operation */

   input  wire [N-1:0]   a_i      ,         /* First operand */
   input  wire [N-1:0]   b_i      ,         /* Second operand */
   input  wire           c_i      ,         /* Carry in */

   output wire [N-1:0]   result_o ,         /* Result */
   output reg            c_o      ,         /* Carry Out */
);

//-----------------------------------------------------------------
// ALU
//-----------------------------------------------------------------
always @ (*) begin
   case (operation)
   //----------------------------------------------
   // Arithmetic
   //----------------------------------------------
   `ALU_ADD : begin
      {c_o, result} = (a_i + b_i);
      z_o           = (result == {N{1'b0}});
      n_o           = result_o[N-1];
   end
   `ALU_ADDC : begin
      {c_o, result} = (a_i + b_i) + {{(N-1){1'b0}}, c_i};
      z_o           = (result == {N{1'b0}});
      n_o           = result_o[N-1];
   end
   `ALU_SUB : begin
      result        = (a_i - b_i);
      z_o           = (result == {N{1'b0}});
      c_o           = 1'b0;
      n_o           = result_o[N-1];
   end
   `ALU_SUBC : begin
      result        = (a_i - b_i) - {{(N-1){1'b0}}, c_i};
      z_o           = (result == {N{1'b0}});
      c_o           = 1'b0;
      n_o           = result_o[N-1];
   end
   //----------------------------------------------
   // Logical
   //----------------------------------------------
   `ALU_NAND : begin
      result        = ~(a_i & b_i);
      z_o           = (result == {N{1'b0}});
      c_o           = c_i;
      n_o           = n_i;
   end
   `ALU_NOR  : begin
      result        = ~(a_i | b_i);
      z_o           = (result == {N{1'b0}});
      c_o           = c_i;
      n_o           = n_i;
   end
   `ALU_XOR : begin
      result        = (a_i ^ b_i);
      z_o           = (result == {N{1'b0}});
      c_o           = c_i;
      n_o           = n_i;
   end
   `ALU_XNOR : begin
      result        = ~(a_i ^ b_i);
      z_o           = (result == {N{1'b0}});
      c_o           = c_i;
      n_o           = n_i;
   end
   //----------------------------------------------
   // Default
   //----------------------------------------------
   default : begin
      result        = a_i;
      z_o           = z_i;
      c_o           = c_i;
      n_o           = n_i;
   end
   endcase
end

endmodule
