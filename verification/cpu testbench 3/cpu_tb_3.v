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
reg                          tb_rst               ;            /* Reset signal */
reg                          tb_clk               ;            /* Clock signal */

// Program Status
wire                         tb_psr_update        ;            /* PSR update signal */
wire [`PSR_WIDTH-1:0]        tb_psr               ;            /* Program status register */
wire [`APSR_WIDTH-1:0]       tb_apsr              ;            /* Arithmetic PSR */

wire [`INST_WIDTH-1:0]       tb_opcode            ;            /* Current instruction */
wire                         tb_opcode_update     ;            /* OPCODE update signal */

// Register file
wire                         tb_imem_update       ;            /* IMEM update signal */
wire                         tb_dmem_update       ;            /* DMEM update signal */
wire                         tb_res_update        ;            /* Result update signal */
wire [`REG_COUNT-1:0]        tb_opa_sel           ;            /* ALU First  Operand Selector */
wire [`REG_COUNT-1:0]        tb_opb_sel           ;            /* ALU Second Operand Selector */
wire [`RES_COUNT-1:0]        tb_res_sel           ;            /* Result selector */

// Data memory
wire                         tb_dmem_write        ;            /* DMEM write signal */
wire [`DATA_DEPTH-1:0]       tb_dmem_port_write   ;            /* DMEM port write signal */
wire [`DATA_WIDTH-1:0]       tb_dmem_data         ;            /* DMEM current value */
reg  [`DATA_DEPTH-1:0]       tb_dmem_port_value   ;            /* DMEM port value */
wire [`DATA_DEPTH-1:0]       tb_dmem_port_address ;            /* DMEM port address */

// Instruction memory
reg  [`INST_WIDTH-1:0]       tb_imem_data         ;            /* Instruction memory data */
wire [`INST_DEPTH-1:0]       tb_imem_addr         ;            /* Current program address */

// Program Counter
wire                         tb_pc_count          ;            /* PC count signal */
wire                         tb_pc_load           ;            /* PC load signal */

// ALU
wire [`ALUOP_WIDTH-1:0]      tb_alu_operation     ;            /* ALU operation selector */
wire [`DATA_WIDTH-1:0]       tb_alu               ;            /* ALU result */
wire [`DATA_WIDTH-1:0]       tb_opa               ;            /* First operand */
wire [`DATA_WIDTH-1:0]       tb_opb               ;            /* Second operand */

//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Microprocessor Control Unit
mcu
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .dmem_update(tb_dmem_update)    ,            /* DMEM update signal */
   .dmem_write(tb_dmem_write)      ,            /* DMEM write signal */

   .imem_update(tb_imem_update)    ,            /* IMEM update signal */

   .opcode_update(tb_opcode_update),            /* OPCODE update signal */
   .opcode(tb_opcode)              ,            /* Current instruction */

   .psr_update(tb_psr_update)      ,            /* PSR update signal */
   .psr(tb_psr)                    ,            /* Program status register */

   .res_update(tb_res_update)      ,            /* Result update signal */
   .res_sel(tb_res_sel)            ,            /* Result selector */

   .alu_operation(tb_alu_operation),            /* ALU operation selector */
   .alu_opa_sel(tb_opa)            ,            /* ALU First  Operand Selector */
   .alu_opb_sel(tb_opb)            ,            /* ALU Second Operand Selector */

   .pc_count(tb_pc_count)          ,            /* PC count signal */
   .pc_load(tb_pc_load)                         /* PC load signal */
);

// Microprocessor Registers
regs
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .dmem_update(tb_dmem_update)    ,            /* DMEM register update signal */
   .dmem_data(tb_dmem_data)        ,            /* DMEM data */

   .imem_update(tb_imem_update)    ,            /* IMEM register update signal */
   .imem_data(tb_imem_data)        ,            /* IMEM data */

   .opcode_update(tb_opcode_update),            /* OPCODE update signal */
   .opcode(tb_opcode)              ,            /* Program current instruction */

   .psr_update(tb_psr_update)      ,            /* PSR update signal */
   .apsr(tb_apsr)                  ,            /* Arithmetic PSR */
   .psr(tb_psr)                    ,            /* Program status register */

   .res_update(tb_res_update)      ,            /* Result update signal */
   .res_sel(tb_res_sel)            ,            /* Result selector */

   .alu(tb_alu)                    ,            /* ALU result */
   .opa_sel(tb_opa_sel)            ,            /* ALU First  Operand Selector */
   .opb_sel(tb_opb_sel)            ,            /* ALU Second Operand Selector */
   .opa(tb_opa)                    ,            /* ALU First  Operand */
   .opb(tb_opb)                                 /* ALU Second Operand */
);

// Program Counter
pc
(
   .rst(tb_rst)                    ,            /* Reset signal */
   .clk(tb_clk)                    ,            /* Clock signal */

   .count(tb_pc_count)             ,            /* Count signal */
   .load(tb_pc_load)               ,            /* New address load signal */

   .addr_in(tb_alu)                ,            /* New program address - after jump */
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

// RAM port
module ram_port
(
   .drive_enable(tb_dmem_write)    ,            /* DMEM write signal */
   .port_write(tb_dmem_port_write) ,            /* DMEM port write signal */

   .drive_value(tb_opb)            ,            /* DMEM output value */
   .current_value(tb_dmem_data)    ,            /* DMEM current value */
   .port_value(tb_dmem_port_value) ,            /* DMEM port value */

   .current_addr(tb_alu)           ,            /* DMEM current address */
   .port_addr(tb_dmem_port_addr)                /* DMEM port address */
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