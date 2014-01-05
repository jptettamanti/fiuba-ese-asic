set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

# #CLOCK, se genera el clock del sistema 
 create_clock -name clock \
              -period 10 \
              [get_ports clk] 
# 
# #Set Data input delay
# No es necesario indicar ninguna restriccion
# set_input_delay -clock clock -max 4 [get_port rst_i]
# set_input_delay -clock clock -min 4 [get_port rst_i]
# 
 set_driving_cell -lib_cell INVX0 -library saed90nm_max [get_port rst_i]
# 

# #Set Output delay
# No es necesario indicar ninguna restriccion
# set_max_delay -from clock -to [get_port fault_o] 4.5 
# set_min_delay -from clock -to [get_port fault_o] 4 
 
# set_max_delay -from clock -to [get_port break_o] 7
# set_min_delay -from clock -to [get_port break_o] 7  
# 

# #Set Load capacitances
# set_load 100 [get_port count]
# 

# #Design Rule Checks
set_max_capacitance 150 [current_design]
set_max_fanout 20 [current_design]
set_max_transition 5 [current_design]
#