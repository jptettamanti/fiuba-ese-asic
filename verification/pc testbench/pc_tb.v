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
module tb_pc ();

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------

reg                      tb_rst     ;      /* Reset signal */
reg                      tb_clk     ;      /* Clock signal */
reg                      tb_count   ;      /* Count signal */
reg                      tb_load    ;      /* New address load signal */
reg  [`INST_DEPTH-1:0]   tb_addr_in ;      /* New program address - after jump */
wire [`INST_DEPTH-1:0]   tb_addr_out;      /* Current program address */


//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

// Program Counter
pc
(
   .rst(tb_rst)          ,                 /* Reset signal */
   .clk(tb_clk)          ,                 /* Clock signal */
   .count(tb_count)      ,                 /* Count signal */
   .load(tb_load)        ,                 /* New address load signal */
   .addr_in(tb_addr_in)  ,                 /* New program address - after jump */
   .addr_out(tb_addr_out)                  /* Current program address */
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
   tb_count = 1'b0;
   tb_load = 1'b0;
   tb_addr_in  = {`INST_DEPTH{1'b0}};
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

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_count = 1'b1;
   
   @(negedge tb_clk)
   @(negedge tb_clk)
   @(negedge tb_clk)
   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_addr_in  = (2**`INST_DEPTH)/4-1;
   tb_load     = 1'b1;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_load = 1'b0;

   @(negedge tb_clk)
   @(negedge tb_clk)
   tb_count = 1'b0;

   @(negedge tb_clk)
   @(negedge tb_clk)
   $finish;
end
   
endmodule