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

   input  wire [`INST_WIDTH-1:0]       opcode       ,            /* Current instruction */
   input  wire [`APSR_WIDTH-1:0]       psr          ,            /* Program status register */

   output reg                          psr_update   ,            /* PSR update signal */
   output reg                          opcode_update,            /* OPCODE update signal */
   output reg                          acc_update   ,            /* ACC update signal */
   output reg                          imm_update   ,            /* IMM update signal */

   output reg  [`ALUOP_WIDTH-1:0]      alu_operation,            /* ALU operation selector */

   output reg                          pc_count     ,            /* PC count signal */
   output reg                          pc_load      ,            /* PC load signal */

   output reg                          ram_write                 /* RAM write signal */
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
      ram_write = 1'b0;           /* RAM set to read mode */
      imm_update = 1'b0;          /* RAM Address update disabled */

      pc_count = 1'b0;            /* PC disabled */
      pc_load = 1'b0;             /* PC load disabled */
      
      psr_update = 1'b0;          /* PSR update disabled */
      opcode_update = 1'b0;       /* OPCODE update disabled */

      alu_operation = `ALU_NOP;   /* ALU not operate */

      acc_update = 1'b0;          /* ACC update disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      pc_count = 1'b1;            /* PC enabled */
      opcode_update = 1'b1;       /* OPCODE update enabled */

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
      ram_write = 1'b0;           /* RAM set to read mode */
      imm_update = 1'b0;          /* RAM Address update disabled */

      pc_count = 1'b0;            /* PC disabled */
      pc_load = 1'b0;             /* PC load disabled */
      
      psr_update = 1'b0;          /* PSR update disabled */
      opcode_update = 1'b0;       /* OPCODE update disabled */

      alu_operation = `ALU_NOP;   /* ALU not operate */

      acc_update = 1'b0;          /* ACC update disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      imm_update = 1'b1;          /* RAM address update enabled */

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
      ram_write = 1'b0;           /* RAM set to read mode */
      imm_update = 1'b0;          /* RAM Address update disabled */

      pc_count = 1'b0;            /* PC disabled */
      pc_load = 1'b0;             /* PC load disabled */
      
      psr_update = 1'b0;          /* PSR update disabled */
      opcode_update = 1'b0;       /* OPCODE update disabled */

      alu_operation = `ALU_NOP;   /* ALU not operate */

      acc_update = 1'b0;          /* ACC update disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      pc_count = 1'b1;            /* PC enabled */
      psr_update = 1'b1;          /* PSR update enabled */
      acc_update = 1'b1;          /* ACC update enabled */

      //----------------------------------------------
      // Operation specific flag values
      //----------------------------------------------
      case (opcode)
      //----------------------------------------------
      // Default
      //----------------------------------------------
      default : begin
         ram_write = 1'b0;           /* RAM set to read mode */
         pc_load = 1'b0;             /* PC load disabled */
         alu_operation = `ALU_NOP;   /* ALU not operate */
      end
      //----------------------------------------------
      // Load / Store
      //----------------------------------------------
      `MCU_LOAD : begin
         ram_write = 1'b0;           /* RAM set to read mode */
      end
      `MCU_STORE : begin
         ram_write = 1'b1;           /* RAM set to write mode */
      end
      `MCU_LOADI : begin
         ram_write = 1'b0;           /* RAM set to read mode */
      end
      `MCU_STOREI : begin
         ram_write = 1'b1;           /* RAM set to write mode */
      end
      //----------------------------------------------
      // Jump
      //----------------------------------------------
      `MCU_JUMP : begin
         pc_load = 1'b1;
      end
      `MCU_JZ : begin
         if (psr[`APSR_NEG]) begin
            pc_load = 1'b1;
         end
         else begin
            pc_load = 1'b0;
         end
      end
      `MCU_JC : begin
         if (psr[`APSR_NEG]) begin
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
      end
      `MCU_ADDC : begin
         alu_operation = `ALU_ADDC;
      end
      `MCU_SUB : begin
         alu_operation = `ALU_SUB;
      end
      `MCU_SUBC : begin
         alu_operation = `ALU_SUBC;
      end
      `MCU_ADDI : begin
         alu_operation = `ALU_ADD;
      end
      `MCU_ADDCI : begin
         alu_operation = `ALU_ADDC;
      end
      `MCU_SUBI : begin
         alu_operation = `ALU_SUB;
      end
      `MCU_SUBCI : begin
         alu_operation = `ALU_SUBC;
      end
      //----------------------------------------------
      // Logical
      //----------------------------------------------
      `MCU_NAND : begin
         alu_operation = `ALU_NAND;
      end
      `MCU_NOR  : begin
         alu_operation = `ALU_NOR;
      end
      `MCU_XOR : begin
         alu_operation = `ALU_XOR;
      end
      `MCU_XNOR : begin
         alu_operation = `ALU_XNOR;
      end
      `MCU_NANDI : begin
         alu_operation = `ALU_NAND;
      end
      `MCU_NORI  : begin
         alu_operation = `ALU_NOR;
      end
      `MCU_XORI : begin
         alu_operation = `ALU_XOR;
      end
      `MCU_XNORI : begin
         alu_operation = `ALU_XNOR;
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
      ram_write = 1'b0;           /* RAM set to read mode */
      imm_update = 1'b0;          /* RAM Address update disabled */

      pc_count = 1'b0;            /* PC disabled */
      pc_load = 1'b0;             /* PC load disabled */
      
      psr_update = 1'b0;          /* PSR update disabled */
      opcode_update = 1'b0;       /* OPCODE update disabled */

      alu_operation = `ALU_NOP;   /* ALU not operate */

      acc_update = 1'b0;          /* ACC update disabled */

      //----------------------------------------------
      // Registers to be updated on next cycle
      //----------------------------------------------
      pc_count = 1'b1;            /* PC enabled */
      opcode_update = 1'b1;       /* OPCODE update enabled */

      //----------------------------------------------
      // Next state
      //----------------------------------------------
      next_state = `MCU_STATE_FETCH;
   end
   endcase

end

endmodule