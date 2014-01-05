set PROJ_DIR            ../..
set SAED_PATH           /opt/pdks/SAED_EDK90nm

# All verilog files, separated by spaces
set verilog_files_list  [list	\
cpu/alu.v			\
cpu/cpu.v 			\
cpu/defs.v 			\
cpu/mcu.v 			\
cpu/pc.v			\
cpu/ram_port.v			\
cpu/regs.v			\
]

# Top-level Module
set my_toplevel         cpu
