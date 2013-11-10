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
// Module - CPU
//-----------------------------------------------------------------
module Cpu
(
   input  wire         rst                /* Reset signal */,
   input  wire         clk                /* Clock signal */,

   input  wire [7:0]   imem_data          /* Instruction memory data */,
   input  wire [7:0]   imem_addr          /* Instruction memory address */,

   input  wire [7:0]   dmem_data          /* Data memory data */,
   inout  wire [7:0]   dmem_addr          /* Data memory address */,
   output wire [7:0]   dmem_write         /* Data memory write signal */
);

//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------


//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------


//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Microprocessor Control Unit
module mcu
(
   .rst               /* Reset signal */,
   .clk               /* Clock signal */,
   .rom_data          /* Program code */,

   .ram_write(dmem_write)         /* Data write signal */,
   .imm_update(dmem_addr)        /* Data address update signal */,
   .pc_ena(pc_ena)          /* PC count signal */,
   .pc_jmp(pc_jmp)           /* PC load signal */,
   .psr_update        /* PSR update flag */,
   .opcode_update     /* OPCODE update disabled */,
   .alu_operation     /* ALU operation selector */,
   .acc_update        /* ACC update flag */
);

// Aritmetic Logic Unit
module alu
(
   .operation         /* ALU operation */,
   .opa(alu_opa)               /* First operand */,
   .opb(alu_opb)               /* Second operand */,
   .cin(alu_cin)               /* Carry in */,

   .result(alu_result)               /* Result */,
   .cout(alu_cout)               /* Carry out */,
   .zero(alu_zero)
   .neg(alu_neg)
);

// Program Counter
module pc
(
   .rst(rst)               /* Reset signal */,
   .clk(clk)               /* Clock signal */,
   .ena(pc_ena)            /* Count signal */
   .jmp(pc_jmp)              /* Load instruction address signal */
   .jump_addr(alu_result),          /* New intruction address */
   .imem_addr(imem_addr)           /* Instruction address */
);


endmodule
