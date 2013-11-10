####################################################################################################################################
# Institución:                          Facultad de Ingeniería - Universidad de Buenos Aires
#
# Herramienta:        Design Compiler Version E-2010.12-SP3 for linux -- Apr 18, 2011
#
# Fecha de creación:  10 Noviembre 2012
#
####################################################################################################################################

source ../../backend/scripts/common/global_vars.tcl

# Eliminar diseños previos
remove_design -designs

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#  Library Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
set_app_var search_path         "$search_path $PROJ_DIR/rtl $SAED_PATH/Digital_Standard_cell_Library/synopsys/models $SAED_PATH/Digital_Standard_cell_Library/synopsys/icons"
set_app_var target_library      "saed90nm_max.db"
set_app_var synthetic_library   dw_foundation.sldb
set_app_var link_library        [concat "* saed90nm_max.db saed90nm_min.db saed90nm_typ.db" $target_library $synthetic_library]
#set_app_var symbol_library      "saed90nm.sdb"

#Work Library Location
define_design_lib WORK -path "$PROJ_DIR/work"; #ver comentario en linea siguiente
#para comentar al final de una linea es necesario utilizar ; y luego #.

# Primero se analiza el módulo principal
analyze -library WORK -format verilog $verilog_files_list

#Elaboramos el módulo principal
elaborate $my_toplevel -architecture verilog -library WORK

#Seleccionamos el módulo principal
current_design $my_toplevel

#Enlazar los demás módulos al módulo principal
link

#Escribir el archivo *.ddc (base de datos sin sintetizar)
write -hierarchy -format ddc -output "$PROJ_DIR/backend/dgen/syn/designs/${my_toplevel}_unmapped.ddc"

#Aplicar especificaciones de diseño (constraints)
source $PROJ_DIR/backend/scripts/syn/syn_cons.tcl

#Revisar el diseño
check_design

#Compilar el diseño
compile_ultra -no_autoungroup -gate_clock

#Escribir la lista de nodos a nivel de compuertas (Gate Level Netlist) que se utiliza para:
#- Verificar el funcionamiento lógico del sistema digital después de la Síntesis RTL.
#- Como una de las entradas para el sintetizador físico (IC Compiler).
set verilogout_no_tri true
change_names -hierarchy -rules verilog
write -hierarchy -format verilog -output "$PROJ_DIR/backend/dgen/syn/designs/${my_toplevel}_syn.v"

#Generar los reportes
report_clock_gating                     > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_clock_gating.txt"
report_power -analysis_effort high      > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_power.txt"
report_area -hierarchy                  > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_area.txt"
report_cell                             > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_cell.txt"
report_timing -max_paths 1000           > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_timing.txt"
report_port                             > "$PROJ_DIR/backend/dgen/syn/reports/${my_toplevel}_syn_port.txt"

#Escribir el archivo *.ddc (base de datos sintetizada)
write -hierarchy -format ddc -output "$PROJ_DIR/backend/dgen/syn/designs/${my_toplevel}_syn_mapped.ddc"

#Escribir el archivo *.sdc (Synopsys Design Constraints), utilizado como una de las entradas 
#para el sintetizador físico (IC Compiler)
write_sdc "$PROJ_DIR/backend/dgen/syn/cons/${my_toplevel}_syn.sdc"

#Revisar la configuración de temporizado
check_timing
