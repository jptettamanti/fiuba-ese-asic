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

// Shared Signals [MCU - Register]
wire [`INST_WIDTH-1:0]       tb_opcode       ;            /* Current instruction */
wire [`APSR_WIDTH-1:0]       tb_psr          ;            /* Program status register */

wire                         tb_psr_update   ;            /* PSR update signal */
wire                         tb_opcode_update;            /* OPCODE update signal */
wire                         tb_acc_update   ;            /* ACC update signal */
wire                         tb_imm_update   ;            /* IMM update signal */

// Shared Signals [MCU - PC]
wire                         tb_pc_count     ;            /* PC count signal */
wire                         tb_pc_load      ;            /* PC load signal */

// Non-shared Signals [MCU]
wire [`ALUOP_WIDTH-1:0]      tb_alu_operation;            /* ALU operation selector */
wire                         tb_ram_write    ;            /* RAM write signal */

// Non-shared Signals [Register]
reg  [`DATA_WIDTH-1:0]       tb_alu          ;            /* ALU result */
reg  [`APSR_WIDTH-1:0]       tb_apsr         ;            /* Arithmetic PSR */
reg  [`INST_WIDTH-1:0]       tb_imem_data    ;            /* Instruction memory data */
reg  [`DATA_WIDTH-1:0]       tb_dmem_data    ;            /* Data memory data */

// Non-shared Signals [PC]
reg  [`INST_DEPTH-1:0]       tb_addr_in      ;            /* New program address - after jump */
wire [`INST_DEPTH-1:0]       tb_imem_addr    ;            /* Current program address */


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
   .acc_update(tb_acc_update)      ,            /* ACC update flag */
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

   .psr_update(tb_psr_update)      ,            /* PSR update signal */
   .opcode_update(tb_opcode_update),            /* OPCODE update signal */
   .acc_update(tb_acc_update)      ,            /* ACC update signal */
   .imm_update(tb_imm_update)      ,            /* IMM update signal */

   .alu(tb_alu)                    ,            /* ALU result */
   .apsr(tb_apsr)                  ,            /* Arithmetic PSR */
   .imem_data(tb_imem_data)        ,            /* Instruction memory data */
   .dmem_data(tb_dmem_data)        ,            /* Data memory data */

   .opcode(tb_opcode)              ,            /* Program current instruction */
   .psr(tb_psr)                                 /* Program status register */
);

// Program Counter
pc
(
   .rst(tb_rst)                    ,                 /* Reset signal */
   .clk(tb_clk)                    ,                 /* Clock signal */
   .count(tb_pc_count)             ,                 /* Count signal */
   .load(tb_pc_load)               ,                 /* New address load signal */
   .addr_in(tb_imem_data)          ,                 /* New program address - after jump (imem_data es para prueba temporaria) */
   .addr_out(tb_imem_addr)                           /* Current program address */
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