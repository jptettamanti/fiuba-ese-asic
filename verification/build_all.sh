cd ./"alu testbench"
vcs alu_tb.v alu.v defs.v
./simv
cd ..

cd ./"pc testbench"
vcs pc_tb.v defs.v pc.v
./simv
cd ..

cd ./"mcu testbench"
vcs mcu_tb.v defs.v mcu.v regs.v
./simv
cd ..

cd ./"cpu testbench 1"
vcs cpu_tb_1.v defs.v mcu.v pc.v regs.v
./simv
cd ..

cd ./"cpu testbench 2"
vcs cpu_tb_2.v alu.v defs.v mcu.v pc.v regs.v
./simv
cd ..

dve