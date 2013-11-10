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
// Module - Data memory interface
//-----------------------------------------------------------------
module dmem_interface
(
   input  wire           rst          ,          /* Reset signal */
   input  wire           clk          ,          /* Clock signal */

   input  wire           dmem_write   ,          /* Data memory write signal */

   input  wire           dmem_addr_sel,          /* Data memory address selection signal */
   input  wire           dmem_addr_imm,          /* Data memory address value (direct access mode) */
   input  wire           dmem_addr_reg,          /* Data memory address value (register indirect access mode) */
   output wire           dmem_addr    ,          /* Data memory address port value */

   input  wire           mcu_dmem_data,          /* Data value (MCU -> DMEM) */
   output reg            dmem_mcu_data,          /* Data value (DMEM -> MCU) */
   inout  wire           dmem_data    ,          /* Data port value */
);

//-----------------------------------------------------------------
// Tri-state data memory interface
//-----------------------------------------------------------------
always @(posedge clk) begin
   //----------------------------------------------
   // Address selection
   //----------------------------------------------
   case (dmem_address_select)
   `DMEM_IMM_ADDRESS : begin
      dmem_address <= dmem_address_imm;
   end
   `DMEM_REG_ADDRESS : begin
      dmem_address <= dmem_address_reg;
   end

   //----------------------------------------------
   // Data R/W
   //----------------------------------------------
   /* If write is enabled, assign mcu data to dmem */
   if (dmem_write) begin
      dmem_data <= mcu_dmem_data;
   end
   /* Else, set port output to high impedance, which alows dmem to mcu data read */
   else begin
      dmem_data <= 1'bz;
   end

   /* Read data afterwards */
   dmem_mcu_data <= dmem_data;
end

endmodule