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
// Local Parameters
//-----------------------------------------------------------------
`define STATE_WIDTH        2
`define MCU_STATE_FETCH    2'd0
`define MCU_STATE_DECODE   2'd1
`define MCU_STATE_EXECUTE  2'd2
`define MCU_STATE_RESET    2'd3

//-----------------------------------------------------------------
// Module - MCU
//-----------------------------------------------------------------
module mcu
(
   input  wire                         rst          ,            /* Reset signal */
   input  wire                         clk          ,            /* Clock signal */

   output reg                          dmem_update  ,            /* DMEM update signal */
   output reg                          dmem_write   ,            /* DMEM write signal */

   output reg                          imem_update  ,            /* IMEM update signal */

   output reg                          opcode_update,            /* OPCODE update signal */
   input  wire [`INST_WIDTH-1:0]       opcode       ,            /* Current instruction */

   output reg                          psr_update   ,            /* PSR update signal */
   input  wire [`APSR_WIDTH-1:0]       psr          ,            /* Program status register */

   output reg                          res_update   ,            /* Result update signal */
   output reg  [`RES_COUNT-1:0]        res_sel      ,            /* Result selector */

   output reg  [`ALUOP_WIDTH-1:0]      alu_operation,            /* ALU operation selector */
   output reg  [`REG_COUNT-1:0]        alu_opa_sel  ,            /* ALU First  Operand Selector */
   output reg  [`REG_COUNT-1:0]        alu_opb_sel  ,            /* ALU Second Operand Selector */

   output reg                          pc_count     ,            /* PC count signal */
   output reg                          pc_load                   /* PC load signal */
);

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg [`STATE_WIDTH-1:0]    state;
reg [`STATE_WIDTH-1:0]    next_state;

//-----------------------------------------------------------------
// State Update
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      state <= `MCU_STATE_RESET;
   end
   else begin
      state <= next_state;
   end
end

//-----------------------------------------------------------------
// FSM
//-----------------------------------------------------------------
always @(*) begin
   case (state)
   //----------------------------------------------
   // MCU Default
   //----------------------------------------------
   default: begin
      //----------------------------------------------
      // Default control flags values
      //----------------------------------------------
      dmem_write = 1'b0;             /* DMEM set to read mode */
      dmem_update = 1'b0;            /* DMEM update disabled */

      imem_update = 1'b0;            /* IMEM update disabled */

      opcode_update = 1'b0;          /* OPCODE update disabled */
      
      psr_update = 1'b0;             /* PSR update disabled */

      res_update = 1'b0;             /* ACC update disabled */
      alu_operation = `ALU_NOP;      /* ALU not operate */

      pc_count = 1'b0;               /* PC disabled */
      pc_load = 1'b0;                /* PC load disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      opcode_update = 1'b1;          /* OPCODE update enabled */
      pc_count = 1'b1;               /* PC enabled */

      //----------------------------------------------
      // Next state
      //----------------------------------------------
      next_state = `MCU_STATE_FETCH;
   end
   //----------------------------------------------
   // MCU Fetch
   //----------------------------------------------
   `MCU_STATE_FETCH: begin
      //----------------------------------------------
      // Default control flags values
      //----------------------------------------------
      dmem_write = 1'b0;             /* DMEM set to read mode */
      dmem_update = 1'b0;            /* DMEM update disabled */

      imem_update = 1'b0;            /* IMEM update disabled */

      opcode_update = 1'b0;          /* OPCODE update disabled */
      
      psr_update = 1'b0;             /* PSR update disabled */

      res_update = 1'b0;             /* ACC update disabled */
      alu_operation = `ALU_NOP;      /* ALU not operate */

      pc_count = 1'b0;               /* PC disabled */
      pc_load = 1'b0;                /* PC load disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      imem_update = 1'b1;            /* IMEM update enabled */

      //----------------------------------------------
      // Next state
      //----------------------------------------------
      next_state = `MCU_STATE_DECODE;
   end
   //----------------------------------------------
   // MCU Decode
   //----------------------------------------------
   `MCU_STATE_DECODE: begin
      //----------------------------------------------
      // Default control flags values
      //----------------------------------------------
      dmem_write = 1'b0;             /* DMEM set to read mode */
      dmem_update = 1'b0;            /* DMEM update disabled */

      imem_update = 1'b0;            /* IMEM update disabled */

      opcode_update = 1'b0;          /* OPCODE update disabled */
      
      psr_update = 1'b0;             /* PSR update disabled */

      res_update = 1'b0;             /* ACC update disabled */
      alu_operation = `ALU_NOP;      /* ALU not operate */

      pc_count = 1'b0;               /* PC disabled */
      pc_load = 1'b0;                /* PC load disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      pc_count = 1'b1;               /* PC enabled */

      //----------------------------------------------
      // Operation specific flag values
      //----------------------------------------------
      case (opcode)
      //----------------------------------------------
      // Default
      //----------------------------------------------
      default : begin
         dmem_write = 1'b0;          /* DMEM set to read mode */
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b0;          /* ACC update disabled */
         alu_operation = `ALU_NOP;   /* ALU not operate */
         pc_load = 1'b0;             /* PC load disabled */
      end
      //----------------------------------------------
      // Load / Store
      //----------------------------------------------
      `MCU_LOAD : begin
         dmem_write = 1'b0;          /* DMEM set to read mode */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_STORE : begin
         dmem_write = 1'b1;          /* DMEM set to write mode */
      end
      `MCU_LOADI : begin
         dmem_write = 1'b0;          /* DMEM set to read mode */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_STOREI : begin
         dmem_write = 1'b1;          /* DMEM set to write mode */
      end
      //----------------------------------------------
      // Jump
      //----------------------------------------------
      `MCU_JUMP : begin
         pc_load = 1'b1;
      end
      `MCU_JZ : begin
         if (psr[`APSR_ZERO]) begin
            pc_load = 1'b1;
         end
         else begin
            pc_load = 1'b0;
         end
      end
      `MCU_JC : begin
         if (psr[`APSR_CARRY]) begin
            pc_load = 1'b1;
         end
         else begin
            pc_load = 1'b0;
         end
      end
      `MCU_JN : begin
         if (psr[`APSR_NEG]) begin
            pc_load = 1'b1;
         end
         else begin
            pc_load = 1'b0;
         end
      end
      //----------------------------------------------
      // Arithmetic
      //----------------------------------------------
      `MCU_ADD : begin
         alu_operation = `ALU_ADD;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_ADDC : begin
         alu_operation = `ALU_ADDC;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_SUB : begin
         alu_operation = `ALU_SUB;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_SUBC : begin
         alu_operation = `ALU_SUBC;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_ADDI : begin
         alu_operation = `ALU_ADD;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_ADDCI : begin
         alu_operation = `ALU_ADDC;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_SUBI : begin
         alu_operation = `ALU_SUB;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_SUBCI : begin
         alu_operation = `ALU_SUBC;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      //----------------------------------------------
      // Logical
      //----------------------------------------------
      `MCU_NAND : begin
         alu_operation = `ALU_NAND;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_NOR  : begin
         alu_operation = `ALU_NOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_XOR : begin
         alu_operation = `ALU_XOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_XNOR : begin
         alu_operation = `ALU_XNOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_NANDI : begin
         alu_operation = `ALU_NAND;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_NORI  : begin
         alu_operation = `ALU_NOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_XORI : begin
         alu_operation = `ALU_XOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      `MCU_XNORI : begin
         alu_operation = `ALU_XNOR;
         psr_update = 1'b1;          /* PSR update enabled */
         res_update = 1'b1;          /* ACC update enabled */
      end
      endcase

      //----------------------------------------------
      // Next state
      //----------------------------------------------
      next_state = `MCU_STATE_EXECUTE;
   end
   //----------------------------------------------
   // MCU Execute
   //----------------------------------------------
   `MCU_STATE_EXECUTE: begin
      //----------------------------------------------
      // Default control flags values
      //----------------------------------------------
      dmem_write = 1'b0;             /* DMEM set to read mode */
      dmem_update = 1'b0;            /* DMEM update disabled */

      imem_update = 1'b0;            /* IMEM update disabled */

      opcode_update = 1'b0;          /* OPCODE update disabled */
      
      psr_update = 1'b0;             /* PSR update disabled */

      res_update = 1'b0;             /* ACC update disabled */
      alu_operation = `ALU_NOP;      /* ALU not operate */

      pc_count = 1'b0;               /* PC disabled */
      pc_load = 1'b0;                /* PC load disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      opcode_update = 1'b1;          /* OPCODE update enabled */
      pc_count = 1'b1;               /* PC enabled */

      //----------------------------------------------
      // Next state
      //----------------------------------------------
      next_state = `MCU_STATE_FETCH;
   end
   endcase

end

endmodule