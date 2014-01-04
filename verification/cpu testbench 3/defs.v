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
// MCU Configuration
//-----------------------------------------------------------------
`define INST_WIDTH                              8
`define INST_DEPTH                              8

`define DATA_WIDTH                              8
`define DATA_DEPTH                              8

`define ALUOP_WIDTH                             4

`define REG_COUNT                               2
`define RES_COUNT                               2

`define PSR_WIDTH                               3
`define APSR_WIDTH                              3

//-----------------------------------------------------------------
// Source Registers
//-----------------------------------------------------------------
`define REG_ACC                                 2'd0
`define REG_IMEM                                2'd1
`define REG_DMEM                                2'd2
`define REG_PC                                  2'd3

//-----------------------------------------------------------------
// Result Registers
//-----------------------------------------------------------------
`define RES_ALU                                 2'd0
`define RES_DMEM                                2'd1
`define RES_IMEM                                2'd2

//-----------------------------------------------------------------
// PSR Fields
//-----------------------------------------------------------------
`define APSR_MIN                                2'd0
`define APSR_ZERO                               2'd0
`define APSR_CARRY                              2'd1
`define APSR_NEG                                2'd2
`define APSR_MAX                                2'd2

//-----------------------------------------------------------------
// ALU Operations
//-----------------------------------------------------------------
`define ALU_ADD                                 4'b0000
`define ALU_SUB                                 4'b0001
`define ALU_ADDC                                4'b0010
`define ALU_SUBC                                4'b0011
`define ALU_NAND                                4'b0100
`define ALU_NOR                                 4'b0101
`define ALU_XOR                                 4'b0110
`define ALU_XNOR                                4'b0111
`define ALU_NOP                                 4'b1111

//-----------------------------------------------------------------
// Load/Store Instructions
//-----------------------------------------------------------------
`define MCU_LOAD                                8'b00000000
`define MCU_LOADI                               8'b00000001
`define MCU_STORE                               8'b00000010
`define MCU_STOREI                              8'b00000011

//-----------------------------------------------------------------
// Arithmetic Instructions
//-----------------------------------------------------------------
`define MCU_ADD                                 8'b01000000
`define MCU_SUB                                 8'b01000001
`define MCU_ADDC                                8'b01000010
`define MCU_SUBC                                8'b01000011
`define MCU_ADDI                                8'b01000100
`define MCU_SUBI                                8'b01000101
`define MCU_ADDCI                               8'b01000110
`define MCU_SUBCI                               8'b01000111

`define MCU_NAND                                8'b10000000
`define MCU_NOR                                 8'b10000001
`define MCU_XOR                                 8'b10000010
`define MCU_XNOR                                8'b10000011
`define MCU_NANDI                               8'b10000100
`define MCU_NORI                                8'b10000101
`define MCU_XORI                                8'b10000110
`define MCU_XNORI                               8'b10000111

//-----------------------------------------------------------------
// Jump Instructions
//-----------------------------------------------------------------
`define MCU_JUMP                                8'b11000000
`define MCU_JZ                                  8'b11000001
`define MCU_JC                                  8'b11000010
`define MCU_JN                                  8'b11000011
