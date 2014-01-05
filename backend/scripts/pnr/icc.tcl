####################################################################################################################################
# Institución:                          Facultad de Ingeniería - Universidad de Buenos Aires
#
# Herramienta:        IC Compiler Version E-2010.12-ICC-SP3 for linux -- Apr 13, 2011
#
# Fecha de creación:  29 Noviembre 2012
#
####################################################################################################################################
#source ../../backend/scripts/pnr/icc.tcl
source ../../backend/scripts/common/global_vars.tcl

set techfile    "$SAED_PATH/Technology_Kit/techfile/saed90nm_1p9m.tf"
set ref_lib     "$SAED_PATH/Digital_Standard_cell_Library/process/astro/fram/saed90nm"
set lib_name    "$PROJ_DIR/backend/dgen/pnr/mw_orca_lib"
set tlupmax     "$SAED_PATH/Digital_Standard_cell_Library/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmax.tluplus"
set tlupmin     "$SAED_PATH/Digital_Standard_cell_Library/process/star_rcxt/tluplus/saed90nm_1p9m_1t_Cmin.tluplus"
set tech2itf    "$SAED_PATH/Digital_Standard_cell_Library/process/star_rcxt/saed90nm.map"

#------------------------------------------
#  Library Setup
#------------------------------------------
set_app_var search_path         "$search_path $PROJ_DIR/rtl $SAED_PATH/Digital_Standard_cell_Library/synopsys/models $SAED_PATH/Digital_Standard_cell_Library/synopsys/icons"
set_app_var target_library      "saed90nm_max.db"
set_app_var synthetic_library   dw_foundation.sldb
set_app_var link_library        [concat "* saed90nm_max.db saed90nm_min.db saed90nm_typ.db" $target_library $synthetic_library]


# If a Milkyway library does not already exist for your design, you need to create one and open it.
# If you already have a Milkyway design library, you must open it before working on your design.

# Borrar la biblioteca creada anteriormente
sh rm -rf $lib_name

# Crearla nuevamente vacia
create_mw_lib  -technology $techfile  -mw_reference_library $ref_lib $lib_name

set_tlu_plus_files \
        -max_tluplus $tlupmax   \
        -min_tluplus $tlupmin   \
        -tech2itf_map  $tech2itf

open_mw_lib $lib_name

import_designs  -format ddc  -top $my_toplevel  -cel $my_toplevel "$PROJ_DIR/backend/dgen/syn/designs/${my_toplevel}_syn_mapped.ddc"

# Cargar las constraints generadas por el sintetizador
read_sdc "$PROJ_DIR/backend/dgen/syn/cons/${my_toplevel}_syn.sdc"

save_mw_cel  -design "${my_toplevel}.CEL;1"

close_mw_cel

close_mw_lib


#------------------------------------------
# FLOORPLANNING
#------------------------------------------

open_mw_lib $lib_name

copy_mw_cel     \
        -from_library $lib_name \
        -from $my_toplevel \
        -to_library $lib_name \
        -to "${my_toplevel}_floorplan"

set ::auto_restore_mw_cel_lib_setup false
open_mw_cel  "${my_toplevel}_floorplan"
current_mw_cel "${my_toplevel}_floorplan"

create_floorplan -core_utilization 0.85 -core_aspect_ratio 0.4 -left_io2core 7 -bottom_io2core 7 -right_io2core 7 -top_io2core 7

# Save the floorplan
save_mw_cel -as "${my_toplevel}_floorplan"

#------------------------------------------
# POWER PLANNING
#------------------------------------------

derive_pg_connection -power_net {vdd} -ground_net {gnd} -create_ports top
derive_pg_connection -power_net {vdd} -ground_net {gnd} -tie

create_rectangular_rings -nets {gnd vdd} \
-left_segment_layer M4 -left_segment_width 0.9 \
-right_segment_layer M4 -right_segment_width 0.9 \
-bottom_segment_layer M5 -bottom_segment_width 0.9 \
-top_segment_layer M5 -top_segment_width 0.9

# Save the design
save_mw_cel -as "${my_toplevel}_power"


#------------------------------------------
# PLACEMENT
#------------------------------------------
check_physical_design -stage pre_place_opt

if {[place_opt -area_recovery] == 0} {
        echo "Placement Error"
        #exit; # Exits ICC if a serious linking problem is encontered
}

derive_pg_connection -power_net {vdd} -ground_net {gnd}
derive_pg_connection -power_net {vdd} -ground_net {gnd} -tie


#Analyze congestion after placement
report_congestion

preroute_standard_cells -connect horizontal  -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn}
#------------------------------------------

# Save placement
save_mw_cel -as "${my_toplevel}_placed"


#------------------------------------------
# CTS
#------------------------------------------
check_physical_design -stage pre_clock_opt

clock_opt -area_recovery

derive_pg_connection -power_net {vdd} -ground_net {gnd}
derive_pg_connection -power_net {vdd} -ground_net {gnd} -tie

# Save post-CTS
save_mw_cel -as "${my_toplevel}_postCTS"


#------------------------------------------
# ROUTING
#------------------------------------------
check_physical_design -stage pre_route_opt

route_opt -area_recovery

# Save the routing
save_mw_cel -as "${my_toplevel}_routed"

# Add Stdcell fillers
insert_stdcell_filler \
-cell_with_metal {SHFILL1} \
-connect_to_power vdd \
-connect_to_ground gnd


derive_pg_connection -power_net {vdd} -ground_net {gnd}
derive_pg_connection -power_net {vdd} -ground_net {gnd} -tie


if {[verify_lvs -ignore_floating_port] == 0} {
        echo "LVS error"
        exit; # Exits ICC if a serious linking problem is encontered
}


#------------------------------------------
# POST-ROUTE OPTIMIZATIONS
#------------------------------------------
insert_zrt_redundant_vias


#------------------------------------------
# REPORTS
#------------------------------------------
report_timing -max_paths 1000           > "$PROJ_DIR/backend/dgen/pnr/reports/${my_toplevel}_pnr_timing.txt"


#------------------------------------------
# SIGNOFF
#------------------------------------------

# Save design in Milkyway format
#------------------------------------------
save_mw_cel -as "${my_toplevel}_signoff"


# Saving the Design in ASCII Format
#------------------------------------------
# Before you run the write_verilog command, use the check_database
check_database
# 1. Update the power and ground connections
# 2. Ensure that the object names in the design are Verilog-compliant
change_names -hierarchy -rules verilog
# 3. Write the Verilog data for the design
# By default, the generated Verilog netlist does not include the power and ground nets.
# To include the power and ground nets, use the -pg and -output_net_name_for_tie options
write_verilog $PROJ_DIR/backend/dgen/pnr/signoff/[format "%s%s" $my_toplevel "_signoff.v"] \
    -no_physical_only_cells -pg
# 4. Write the floorplan information to a DEF file
write_def -output $PROJ_DIR/backend/dgen/pnr/signoff/[format "%s%s" $my_toplevel "_signoff.def"]
# 5. Write the design constraints to SDC files
write_sdc $PROJ_DIR/backend/dgen/pnr/signoff/[format "%s%s" $my_toplevel "_signoff.sdc"]
# 6. Write the RC extraction data to the parasitic netlist
write_parasitics -format SPEF -output $PROJ_DIR/backend/dgen/pnr/signoff/[format "%s%s" $my_toplevel "_signoff.spef"]


# Writing GDSII
#------------------------------------------
# Configure GDS options
set_write_stream_options \
        -map_layer "$SAED_PATH/Technology_Kit/milkyway/saed90nm.gdsout.map" \
        -child_depth 20 \
        -keep_data_type \
        -flatten_via \
        -output_filling {fill} \
        -output_outdated_fill \
        -output_geometry_property

# Save as GDS
write_stream -format gds "$PROJ_DIR/backend/dgen/pnr/signoff/${my_toplevel}.gds"
