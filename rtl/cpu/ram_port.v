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
// Module - Port interface
//-----------------------------------------------------------------
module ram_port
(
   input  wire                     drive_enable ,            /* DMEM write signal */
   output wire                     port_write   ,            /* DMEM port write signal */

   input  wire [`DATA_WIDTH-1:0]   drive_value  ,            /* DMEM output value */
   output wire [`DATA_WIDTH-1:0]   current_value,            /* DMEM current value */
   inout  wire [`DATA_WIDTH-1:0]   port_value   ,            /* DMEM port value */

   input  wire [`DATA_DEPTH-1:0]   current_addr ,            /* DMEM current address */
   output wire [`DATA_DEPTH-1:0]   port_addr                 /* DMEM port address */
);

//-----------------------------------------------------------------
// Tri-state port interface
//-----------------------------------------------------------------
assign port_write    = drive_enable;

assign port_value    = drive_enable ? drive_value : 1'bz;
assign current_value = port_value;

assign port_addr     = current_addr;

endmodule