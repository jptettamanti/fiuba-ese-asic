set PROJ_DIR            ../..
set SAED_PATH           /usr/synopsys/SAED_EDK90nm

# All verilog files, separated by spaces
set verilog_files_list  [list acumulator_reg.v alu.v control.v flags_register.v micro.v operand_reg.v program_counter.v]

# Top-level Module
set my_toplevel         micro
