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
module regs
(
   input  wire                   rst          ,            /* Reset signal */
   input  wire                   clk          ,            /* Clock signal */

   input  wire                   psr_update   ,            /* PSR update signal */
   input  wire                   opcode_update,            /* OPCODE update signal */
   input  wire                   acc_update   ,            /* ACC update signal */
   input  wire                   imm_update   ,            /* IMM update signal */

   input  wire [`DATA_WIDTH-1:0] alu          ,            /* ALU result */
   input  wire [`APSR_WIDTH-1:0] apsr         ,            /* Arithmetic PSR */
   input  wire [`INST_WIDTH-1:0] imem_data    ,            /* Instruction memory data */
   input  wire [`DATA_WIDTH-1:0] dmem_data    ,            /* Data memory data */

   output reg  [`INST_WIDTH-1:0] opcode       ,            /* Current instruction */
   output reg  [`APSR_WIDTH-1:0] psr                       /* Program status register */
);


//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------

reg  [`DATA_WIDTH-1:0] acc;
reg  [`INST_WIDTH-1:0] imm;


//-----------------------------------------------------------------
// Operation code update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      opcode <= `MCU_LOAD;
   end
   else if (opcode_update) begin
      opcode <= imem_data;
   end
   else begin
      opcode <= opcode;
   end
end

//-----------------------------------------------------------------
// Program Status Register Update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      psr <= {`PSR_WIDTH{1'b0}};
   end
   else if (psr_update) begin
      psr <= {apsr};
   end
   else begin
      psr <= psr;
   end
end

//-----------------------------------------------------------------
// Accumulator update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      acc <= {`DATA_WIDTH{1'b0}};
   end
   else if (acc_update) begin
      acc <= alu;
   end
   else begin
      acc <= acc;
   end
end

//-----------------------------------------------------------------
// Immediate value update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      imm <= {`INST_WIDTH{1'b0}};
   end
   else if (imm_update) begin
      imm <= imem_data;
   end
   else begin
      imm <= imm;
   end
end

endmodule