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
module cpu
(
   input  wire                         rst             ,            /* Reset signal */
   input  wire                         clk             ,            /* Clock signal */

   input  wire [`INST_WIDTH-1:0]       imem_data       ,            /* Instruction memory data */
   output wire [`INST_DEPTH-1:0]       imem_addr       ,            /* Current program address */
   
   output wire                         dmem_port_write ,            /* DMEM port write signal */
   inout  wire [`DATA_WIDTH-1:0]       dmem_port_value ,            /* DMEM port value */
   output wire [`DATA_DEPTH-1:0]       dmem_port_addr               /* DMEM port address */
);

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------

// Program Status
wire                         psr_update        ;            /* PSR update signal */
wire [`PSR_WIDTH-1:0]        psr               ;            /* Program status register */
wire [`APSR_WIDTH-1:0]       apsr              ;            /* Arithmetic PSR */

wire [`INST_WIDTH-1:0]       opcode            ;            /* Current instruction */
wire                         opcode_update     ;            /* OPCODE update signal */

// Register file
wire                         imem_update       ;            /* IMEM update signal */
wire                         dmem_update       ;            /* DMEM update signal */
wire                         res_update        ;            /* Result update signal */
wire [`REG_COUNT-1:0]        opa_sel           ;            /* ALU First  Operand Selector */
wire [`REG_COUNT-1:0]        opb_sel           ;            /* ALU Second Operand Selector */
wire [`RES_COUNT-1:0]        res_sel           ;            /* Result selector */

// Data memory
wire                         dmem_write        ;            /* DMEM write signal */
wire [`DATA_WIDTH-1:0]       dmem_data         ;            /* DMEM current value */

// Instruction memory

// Program Counter
wire                         pc_count          ;            /* PC count signal */
wire                         pc_load           ;            /* PC load signal */

// ALU
wire [`ALUOP_WIDTH-1:0]      alu_operation     ;            /* ALU operation selector */
wire [`DATA_WIDTH-1:0]       alu_result        ;            /* ALU result */
wire [`DATA_WIDTH-1:0]       opa               ;            /* First operand */
wire [`DATA_WIDTH-1:0]       opb               ;            /* Second operand */

//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Microprocessor Control Unit
mcu mcu
(
   .rst(rst)                    ,            /* Reset signal */
   .clk(clk)                    ,            /* Clock signal */

   .dmem_update(dmem_update)    ,            /* DMEM update signal */
   .dmem_write(dmem_write)      ,            /* DMEM write signal */

   .imem_update(imem_update)    ,            /* IMEM update signal */

   .opcode_update(opcode_update),            /* OPCODE update signal */
   .opcode(opcode)              ,            /* Current instruction */

   .psr_update(psr_update)      ,            /* PSR update signal */
   .psr(psr)                    ,            /* Program status register */

   .res_update(res_update)      ,            /* Result update signal */
   .res_sel(res_sel)            ,            /* Result selector */

   .alu_operation(alu_operation),            /* ALU operation selector */
   .alu_opa_sel(opa_sel)        ,            /* ALU First  Operand Selector */
   .alu_opb_sel(opb_sel)        ,            /* ALU Second Operand Selector */

   .pc_count(pc_count)          ,            /* PC count signal */
   .pc_load(pc_load)                         /* PC load signal */
);

// Microprocessor Registers
regs regs
(
   .rst(rst)                    ,            /* Reset signal */
   .clk(clk)                    ,            /* Clock signal */

   .dmem_update(dmem_update)    ,            /* DMEM register update signal */
   .dmem_data(dmem_data)        ,            /* DMEM data */

   .imem_update(imem_update)    ,            /* IMEM register update signal */
   .imem_data(imem_data)        ,            /* IMEM data */

   .opcode_update(opcode_update),            /* OPCODE update signal */
   .opcode(opcode)              ,            /* Program current instruction */

   .psr_update(psr_update)      ,            /* PSR update signal */
   .apsr(apsr)                  ,            /* Arithmetic PSR */
   .psr(psr)                    ,            /* Program status register */

   .res_update(res_update)      ,            /* Result update signal */
   .res_sel(res_sel)            ,            /* Result selector */

   .alu(alu_result)             ,            /* ALU result */
   .opa_sel(opa_sel)            ,            /* ALU First  Operand Selector */
   .opb_sel(opb_sel)            ,            /* ALU Second Operand Selector */
   .opa(opa)                    ,            /* ALU First  Operand */
   .opb(opb)                    ,            /* ALU Second Operand */

   .pc(imem_addr)                            /* Current program address */
);

// Program Counter
pc pc
(
   .rst(rst)                    ,            /* Reset signal */
   .clk(clk)                    ,            /* Clock signal */

   .count(pc_count)             ,            /* Count signal */
   .load(pc_load)               ,            /* New address load signal */

   .addr_in(alu_result)         ,            /* New program address - after jump */
   .addr_out(imem_addr)                      /* Current program address */
);

// Arithmetic logic unit
alu alu
(
   .operation(alu_operation)    ,            /* ALU operation */

   .a_i(opa)                    ,            /* First operand */
   .b_i(opb)                    ,            /* Second operand */
   .psr(psr)                    ,            /* Program Status Register */

   .result(alu_result)          ,            /* Result */
   .apsr(apsr)                               /* Arithmetic PSR */
);

// RAM port
ram_port ram_port
(
   .drive_enable(dmem_write)    ,            /* DMEM write signal */
   .port_write(dmem_port_write) ,            /* DMEM port write signal */

   .drive_value(opb)            ,            /* DMEM output value */
   .current_value(dmem_data)    ,            /* DMEM current value */
   .port_value(dmem_port_value) ,            /* DMEM port value */

   .current_addr(alu_result)    ,            /* DMEM current address */
   .port_addr(dmem_port_addr)                /* DMEM port address */
);
   
endmodule