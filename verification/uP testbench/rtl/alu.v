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
module alu
(
   input  wire [`ALUOP_WIDTH-1:0]  operation,         /* ALU operation */

   input  wire [`DATA_WIDTH-1:0]   a_i      ,         /* First operand */
   input  wire [`DATA_WIDTH-1:0]   b_i      ,         /* Second operand */
   input  wire [`PSR_WIDTH-1:0]    psr      ,         /* Program Status Register */

   output reg  [`DATA_WIDTH-1:0]   result   ,         /* Result */
   output reg  [`APSR_WIDTH-1:0]   apsr               /* Arithmetic PSR */
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
      {apsr[`APSR_CARRY], result}     = (a_i + b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
   end
   `ALU_ADDC : begin
      {apsr[`APSR_CARRY], result}     = (a_i + b_i) + {{(`DATA_WIDTH-1){1'b0}}, psr[`APSR_CARRY]};
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
   end
   `ALU_SUB : begin
      result                          = (a_i - b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   `ALU_SUBC : begin
      result                          = (a_i - b_i) - {{(`DATA_WIDTH-1){1'b0}}, psr[`APSR_CARRY]};
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   //----------------------------------------------
   // Logical
   //----------------------------------------------
   `ALU_NAND : begin
      result                          = ~(a_i & b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   `ALU_NOR  : begin
      result                          = ~(a_i | b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   `ALU_XOR : begin
      result                          = (a_i ^ b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   `ALU_XNOR : begin
      result                          = ~(a_i ^ b_i);
      apsr[`APSR_ZERO]                = (result == {`DATA_WIDTH{1'b0}});
      apsr[`APSR_NEG]                 = result[`DATA_WIDTH-1];
      apsr[`APSR_CARRY]               = 1'b0;
   end
   //----------------------------------------------
   // Default
   //----------------------------------------------
   default : begin
      result                          = a_i;
      apsr                            = psr[`APSR_MAX:`APSR_MIN];
   end
   endcase
end

endmodule
