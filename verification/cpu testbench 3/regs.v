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

   input  wire                   dmem_update  ,            /* DMEM register update signal */
   input  wire [`DATA_WIDTH-1:0] dmem_data    ,            /* DMEM data */

   input  wire                   imem_update  ,            /* IMEM register update signal */
   input  wire [`INST_WIDTH-1:0] imem_data    ,            /* IMEM data */

   input  wire                   opcode_update,            /* OPCODE update signal */
   output reg  [`INST_WIDTH-1:0] opcode       ,            /* Current instruction */

   input  wire                   psr_update   ,            /* PSR update signal */
   input  wire [`APSR_WIDTH-1:0] apsr         ,            /* Arithmetic PSR */
   output reg  [`PSR_WIDTH-1:0]  psr          ,            /* Program status register */

   input  wire                   res_update   ,            /* Result update signal */
   input  wire [`RES_COUNT-1:0]  res_sel      ,            /* Result selector */

   input  wire [`DATA_WIDTH-1:0] alu          ,            /* ALU result */
   input  wire [`REG_COUNT-1:0]  opa_sel      ,            /* ALU First  Operand Selector */
   input  wire [`REG_COUNT-1:0]  opb_sel      ,            /* ALU Second Operand Selector */
   output reg  [`DATA_WIDTH-1:0] opa          ,            /* ALU First  Operand */
   output reg  [`DATA_WIDTH-1:0] opb          ,            /* ALU Second Operand */
   
   input  wire [`INST_DEPTH-1:0] pc                        /* Current program address */
);


//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg  [`DATA_WIDTH-1:0] acc;
reg  [`DATA_WIDTH-1:0] dmem;
reg  [`INST_WIDTH-1:0] imem;


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
// Immediate value update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      imem <= {`INST_WIDTH{1'b0}};
   end
   else if (imem_update) begin
      imem <= imem_data;
   end
   else begin
      imem <= imem;
   end
end

//-----------------------------------------------------------------
// RAM value update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      dmem <= {`DATA_WIDTH{1'b0}};
   end
   else if (dmem_update) begin
      dmem <= dmem_data;
   end
   else begin
      dmem <= dmem;
   end
end

//-----------------------------------------------------------------
// Accumulator update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      acc <= {`DATA_WIDTH{1'b0}};
   end
   else if (res_update) begin
      case (res_sel)
      `RES_ALU : begin
         acc <= alu;
      end
      `RES_DMEM : begin
         acc <= dmem_data;
      end
      `RES_IMEM : begin
         acc <= imem_data;
      end
      default : begin
         acc <= alu;
      end
      endcase
   end
   else begin
      acc <= acc;
   end
end

//-----------------------------------------------------------------
// Output wire assign
//-----------------------------------------------------------------
always @ (*) begin
   case (opa_sel)
   `REG_ACC : begin
      opa = acc;
   end
   `REG_IMEM : begin
      opa = imem;
   end
   `REG_DMEM : begin
      opa = dmem;
   end
   `REG_PC : begin
      opa = pc;
   end
   default : begin
      opa = acc;
   end
   endcase
end

always @ (*) begin
   case (opb_sel)
   `REG_ACC : begin
      opb = acc;
   end
   `REG_IMEM : begin
      opb = imem;
   end
   `REG_DMEM : begin
      opb = dmem;
   end
   `REG_PC : begin
      opb = pc;
   end
   default : begin
      opb = imem;
   end
   endcase
end

endmodule