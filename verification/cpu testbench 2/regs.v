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

   input  wire [`INST_WIDTH-1:0] imem_data    ,            /* Data from instruction memory */

   input  wire                   opcode_update,            /* OPCODE update signal */
   output reg  [`INST_WIDTH-1:0] opcode       ,            /* Current instruction */

   input  wire                   imm_update   ,            /* IMM update signal */

   input  wire                   psr_update   ,            /* PSR update signal */
   input  wire [`APSR_WIDTH-1:0] apsr         ,            /* Arithmetic PSR */
   output reg  [`PSR_WIDTH-1:0]  psr          ,            /* Program status register */

   input  wire                   acc_update   ,            /* ACC update signal */   
   input  wire [`DATA_WIDTH-1:0] alu          ,            /* ALU result */
   output wire [`DATA_WIDTH-1:0] opa          ,            /* ALU First Operand - ACC*/
   output wire [`DATA_WIDTH-1:0] opb          ,            /* ALU Second Operand - IMM/DMEM */

   input  wire [`DATA_WIDTH-1:0] dmem_data_r  ,            /* Data from data memory */
   output wire [`DATA_WIDTH-1:0] dmem_data_w  ,            /* Data to data memory */
   output wire [`DATA_DEPTH-1:0] dmem_addr_reg             /* Data memory address value (register indirect access mode) */
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

//-----------------------------------------------------------------
// Output wire assign
//-----------------------------------------------------------------
assign opa = acc;
assign opb = imm;
assign dmem_data_w = acc;
assign dmem_addr_reg = acc;

endmodule