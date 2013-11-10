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
// Module - Program Counter
//-----------------------------------------------------------------
module pc
(
   input  wire                     rst     ,                 /* Reset signal */
   input  wire                     clk     ,                 /* Clock signal */
   input  wire                     count   ,                 /* Count signal */
   input  wire                     load    ,                 /* New address load signal */
   input  wire [`INST_DEPTH-1:0]   addr_in ,                 /* New program address - after jump */
   output reg  [`INST_DEPTH-1:0]   addr_out                  /* Current program address */
);

//-----------------------------------------------------------------
// Program Counter
//-----------------------------------------------------------------
always @(posedge clk or posedge rst) begin
   if (rst) begin
      addr_out <= {`INST_DEPTH{1'b0}};
   end
   else if (load) begin
      addr_out <= addr_in;
   end
   else if (count) begin
      addr_out <= addr_out + {{(`INST_DEPTH-1){1'b0}},1'b1};
   end
   else begin
      addr_out <= addr_out;
   end
end

endmodule
