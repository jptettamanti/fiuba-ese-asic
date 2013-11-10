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
module tb_alu ();

//-----------------------------------------------------------------
// Registers / Wires
//-----------------------------------------------------------------

reg  [`ALUOP_WIDTH-1:0]  tb_operation;         /* ALU operation */

reg  [`DATA_WIDTH-1:0]   tb_a_i      ;         /* First operand */
reg  [`DATA_WIDTH-1:0]   tb_b_i      ;         /* Second operand */
reg                      tb_psr      ;         /* Program Status Register */

wire [`DATA_WIDTH-1:0]   tb_result   ;         /* Result */
wire [`APSR_WIDTH-1:0]   tb_apsr     ;         /* Arithmetic PSR */


//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------

alu
(
   .operation(tb_operation),         /* ALU operation */

   .a_i(tb_a_i)            ,         /* First operand */
   .b_i(tb_b_i)            ,         /* Second operand */
   .psr(tb_psr)            ,         /* Program Status Register */

   .result(tb_result)      ,         /* Result */
   .apsr(tb_apsr)                    /* Arithmetic PSR */
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
   tb_a_i = {`DATA_WIDTH{1'b0}};
   tb_b_i = {`DATA_WIDTH{1'b0}};
   tb_psr = {`PSR_WIDTH{1'b0}};
   tb_operation = `ALU_NOP;
end



//-----------------------------------------------------------------
// Periodic tasks
//-----------------------------------------------------------------

always
begin
   $display("Comienzo del testbench.");
   //$monitor("Clk: %b, Entrada: %b ; Salida: %b", tb_clk, tb_data_in, w_tick);

   #10;
   tb_a_i = {`DATA_WIDTH{8'hAE}};
   tb_b_i = {`DATA_WIDTH{8'hAE}};
   tb_psr[`APSR_CARRY] = 1'b0;

   #10;
   tb_operation = `ALU_NOP;

   #10;
   tb_operation = `ALU_ADD;

   #10;
   tb_operation = `ALU_SUB;

   #10;
   tb_operation = `ALU_ADDC;

   #10;
   tb_operation = `ALU_SUBC;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hAA}};
   tb_b_i = {`DATA_WIDTH{8'hAA}};
   tb_psr[`APSR_CARRY] = 1'b1;

   #10;
   tb_operation = `ALU_NOP;

   #10;
   tb_operation = `ALU_ADD;

   #10;
   tb_operation = `ALU_SUB;

   #10;
   tb_operation = `ALU_ADDC;

   #10;
   tb_operation = `ALU_SUBC;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hFF}};
   tb_b_i = {`DATA_WIDTH{8'h01}};
   tb_psr[`APSR_CARRY] = 1'b0;

   #10;
   tb_operation = `ALU_NOP;

   #10;
   tb_operation = `ALU_ADD;

   #10;
   tb_operation = `ALU_SUB;

   #10;
   tb_operation = `ALU_ADDC;

   #10;
   tb_operation = `ALU_SUBC;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hFF}};
   tb_b_i = {`DATA_WIDTH{8'hFF}};

   #10;
   tb_operation = `ALU_NAND;

   #10;
   tb_operation = `ALU_NOR;

   #10;
   tb_operation = `ALU_XOR;

   #10;
   tb_operation = `ALU_XNOR;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hFF}};
   tb_b_i = {`DATA_WIDTH{8'h00}};

   #10;
   tb_operation = `ALU_NAND;

   #10;
   tb_operation = `ALU_NOR;

   #10;
   tb_operation = `ALU_XOR;

   #10;
   tb_operation = `ALU_XNOR;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hAA}};
   tb_b_i = {`DATA_WIDTH{8'hAA}};

   #10;
   tb_operation = `ALU_XOR;

   #10;
   tb_operation = `ALU_XNOR;


   #10;
   tb_a_i = {`DATA_WIDTH{8'hA7}};
   tb_b_i = {`DATA_WIDTH{8'h7A}};

   #10;
   tb_operation = `ALU_XOR;

   #10;
   tb_operation = `ALU_XNOR;

   #10;
   #10;

   $finish;
end
   
endmodule