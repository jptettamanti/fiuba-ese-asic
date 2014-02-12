###################################################################

# Created by write_sdc on Sun Jan 26 17:21:38 2014

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_max_capacitance 150 [current_design]
set_max_fanout 20 [current_design]
set_max_transition 5 [current_design]
create_clock [get_ports clk]  -name clock  -period 10  -waveform {0 5}
set_clock_gating_check -rise -setup 0 [get_cells                               \
pc/clk_gate_addr_out_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
pc/clk_gate_addr_out_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
pc/clk_gate_addr_out_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
pc/clk_gate_addr_out_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
regs/clk_gate_acc_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
regs/clk_gate_acc_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells regs/clk_gate_acc_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells regs/clk_gate_acc_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
regs/clk_gate_imem_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
regs/clk_gate_imem_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
regs/clk_gate_imem_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
regs/clk_gate_imem_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
regs/clk_gate_psr_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
regs/clk_gate_psr_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells regs/clk_gate_psr_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells regs/clk_gate_psr_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
regs/clk_gate_opcode_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
regs/clk_gate_opcode_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
regs/clk_gate_opcode_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
regs/clk_gate_opcode_reg/main_gate]
