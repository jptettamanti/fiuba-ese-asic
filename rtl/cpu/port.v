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
module port
(
   input  wire           drive_enable ,          /* Port direction signal */
   input  wire           drive_value  ,          /* Port output value */
   output wire           port_value   ,          /* Port current value */

   inout  wire           port         ,          /* Port */
);

//-----------------------------------------------------------------
// Tri-state port interface
//-----------------------------------------------------------------
assign port       = drive_enable ? drive_value : 1'bz;
assign port_value = port;

endmodule