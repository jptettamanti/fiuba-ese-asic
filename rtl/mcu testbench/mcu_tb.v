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
module tb_mcu ();

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------

reg                      tb_rst          ;    /* Reset signal */
reg                      tb_clk          ;    /* Clock signal */
reg  [(`INST_WIDTH-1):0] tb_imem_data    ;    /* Program code */
reg  [(`APSR_WIDTH-1):0] tb_apsr         ;

wire                     tb_ram_write    ;     /* RAM write signal */
wire                     tb_imm_update   ;     /* RAM address update signal */
wire                     tb_pc_count     ;     /* PC count signal */
wire                     tb_pc_load      ;     /* PC load signal */
wire                     tb_psr_update   ;     /* PSR update flag */
wire                     tb_opcode_update;     /* OPCODE update disabled */
wire [`ALUOP_WIDTH:0]    tb_alu_operation;     /* ALU operation selector */
wire                     tb_acc_update   ;     /* ACC update flag */


//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Microprocessor Control Unit
mcu
(
   .rst(tb_rst)                         /* Reset signal */,
   .clk(tb_clk)                         /* Clock signal */,
   .imem_data(tb_imem_data)             /* Program code */,
   .apsr(tb_apsr),

   .ram_write(tb_ram_write)             /* RAM write signal */,
   .imm_update(tb_imm_update)           /* RAM address update signal */,
   .pc_count(tb_pc_count)               /* PC count signal */,
   .pc_load(tb_pc_load)                 /* PC load signal */,
   .psr_update(tb_psr_update)           /* PSR update flag */,
   .opcode_update(tb_opcode_update)     /* OPCODE update disabled */,
   .alu_operation(tb_alu_operation)     /* ALU operation selector */,
   .acc_update(tb_acc_update)           /* ACC update flag */
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
   tb_apsr = {`APSR_WIDTH{1'b0}};
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
   tb_imem_data = `MCU_STORE;

   @(negedge tb_clk)
   tb_imem_data = 8'hAE;

   @(negedge tb_clk)
   @(negedge tb_clk)
   $finish;
end
   
endmodule