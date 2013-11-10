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
// Module - MCU Testbench
//-----------------------------------------------------------------
module tb_cpu ();

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------

// Common Signals
reg                          tb_rst          ;            /* Reset signal */
reg                          tb_clk          ;            /* Clock signal */

// Program Status
wire                         tb_psr_update   ;            /* PSR update signal */
wire [`PSR_WIDTH-1:0]        tb_psr          ;            /* Program status register */
wire [`APSR_WIDTH-1:0]       tb_apsr         ;            /* Arithmetic PSR */

wire [`INST_WIDTH-1:0]       tb_opcode       ;            /* Current instruction */
wire                         tb_opcode_update;            /* OPCODE update signal */

// Register file
wire                         tb_acc_update   ;            /* ACC update signal */
wire                         tb_imm_update   ;            /* IMM update signal */

// Data memory
wire                         tb_ram_write    ;            /* RAM write signal */
wire [`DATA_WIDTH-1:0]       tb_dmem_data_r  ;            /* Data from data memory */
wire [`DATA_WIDTH-1:0]       tb_dmem_data_w  ;            /* Data to data memory */
wire [`DATA_DEPTH-1:0]       tb_dmem_addr_reg;            /* Data memory address value (register indirect access mode) */

// Instruction memory
wire                         tb_pc_count     ;            /* PC count signal */
wire                         tb_pc_load      ;            /* PC load signal */
reg  [`INST_DEPTH-1:0]       tb_addr_in      ;            /* New program address - after jump */
reg  [`INST_WIDTH-1:0]       tb_imem_data    ;            /* Instruction memory data */
wire [`INST_DEPTH-1:0]       tb_imem_addr    ;            /* Current program address */

// ALU
wire [`ALUOP_WIDTH-1:0]      tb_alu_operation;            /* ALU operation selector */
wire [`DATA_WIDTH-1:0]       tb_alu          ;            /* ALU result */
wire [`DATA_WIDTH-1:0]       tb_opa          ;            /* First operand */
wire [`DATA_WIDTH-1:0]       tb_opb          ;            /* Second operand */


//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Microprocessor Control Unit
mcu
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .opcode(tb_opcode)              ,            /* Current instruction */
   .psr(tb_psr)                    ,            /* Program status register */

   .psr_update(tb_psr_update)      ,            /* PSR update signal */
   .opcode_update(tb_opcode_update),            /* OPCODE update signal */
   .acc_update(tb_acc_update)      ,            /* ACC update signal */
   .imm_update(tb_imm_update)      ,            /* IMM update signal */

   .alu_operation(tb_alu_operation),            /* ALU operation selector */

   .pc_count(tb_pc_count)          ,            /* PC count signal */
   .pc_load(tb_pc_load)            ,            /* PC load signal */

   .ram_write(tb_ram_write)                     /* RAM write signal */
);

// Microprocessor Registers
regs
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .imem_data(tb_imem_data)        ,            /* Instruction memory data */

   .opcode_update(tb_opcode_update),            /* OPCODE update signal */
   .opcode(tb_opcode)              ,            /* Program current instruction */

   .imm_update(tb_imm_update)      ,            /* IMM update signal */

   .psr_update(tb_psr_update)      ,            /* PSR update signal */
   .apsr(tb_apsr)                  ,            /* Arithmetic PSR */
   .psr(tb_psr)                    ,            /* Program status register */

   .acc_update(tb_acc_update)      ,            /* ACC update signal */
   .alu(tb_alu)                    ,            /* ALU result */
   .opa(tb_opa)                    ,            /* ALU First Operand - ACC*/
   .opb(tb_opb)                    ,            /* ALU Second Operand - IMM/DMEM */           

   .dmem_data_r(tb_dmem_data_r)    ,            /* Data from data memory */
   .dmem_data_w(tb_dmem_data_w)    ,            /* Data to data memory */
   .dmem_addr_reg(tb_dmem_addr_reg)             /* Data memory address value (register indirect access mode) */
);

// Program Counter
pc
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .count(tb_pc_count)             ,            /* Count signal */
   .load(tb_pc_load)               ,            /* New address load signal */

   .addr_in(tb_imem_data)          ,            /* New program address - after jump (imem_data es para prueba temporaria) */
   .addr_out(tb_imem_addr)                      /* Current program address */
);

// Arithmetic logic unit
alu
(
   .operation(tb_alu_operation)    ,            /* ALU operation */

   .a_i(tb_opa)                    ,            /* First operand */
   .b_i(tb_opb)                    ,            /* Second operand */
   .psr(tb_psr)                    ,            /* Program Status Register */

   .result(tb_alu)                 ,            /* Result */
   .apsr(tb_apsr)                               /* Arithmetic PSR */
);

//-----------------------------------------------------------------
// Initialize tasks
//-----------------------------------------------------------------
initial begin
   // Definir la base de datos VCD
   $dumpfile ("fsm.vcd");
   $dumpvars;
      
   // Definir la base de datos de Synopsys
//    $vcdplusfile("fsm.vpd");
//    $vcdpluson();
end

// Valores iniciales de las señales
initial begin
   tb_rst = 1'b1;
   tb_clk = 1'b0;
   tb_imem_data = `MCU_LOAD;
end



//-----------------------------------------------------------------
// Periodic tasks
//-----------------------------------------------------------------

// Generación de la señal de clock
always begin
   #5  tb_clk =  ~ tb_clk;
end

always
begin
   $display("Comienzo del testbench.");
   //$monitor("Clk: %b, Entrada: %b ; Salida: %b", tb_clk, tb_data_in, w_tick);

   @(negedge tb_clk)
   tb_rst = 1'b0;
   tb_imem_data = `MCU_LOAD;
   
   @(negedge tb_clk)   
   tb_imem_data = 8'hAE;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_imem_data = `MCU_ADD;

   @(negedge tb_clk)
   tb_imem_data = 8'hAE;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_imem_data = `MCU_SUB;

   @(negedge tb_clk)
   tb_imem_data = 8'hAE;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_imem_data = `MCU_JUMP;

   @(negedge tb_clk)
   tb_imem_data = 8'hAE;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_imem_data = `MCU_STORE;

   @(negedge tb_clk)
   tb_imem_data = 8'hAE;
   
   @(negedge tb_clk)
   @(negedge tb_clk)
   $finish;
end
   
endmodule