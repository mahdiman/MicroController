###################################################################################
echo "================ Start Constrains ============="

set INTERNAL_PERIOD 10.0
set EXTERNAL_PERIOD  20.0
set MAXIMUM_AREA 13000.0
set RESET_DELAY  0.85
set INPUT_DELAY  1.0
set OUTPUT_DELAY  1.0
set CLOCK_LATENCY 0.4
set MIN_IO_DELAY 1.5
set MAX_TRANSITION 0.5

#reference library cells
set REFLIB saed90nm_typ_ht_pg
set SLIB saed90nm_typ_ht
set BUFFER "NBUFFX16"
set SDFF  "SDFFARX1"
set BUF_IN_PIN "IN"
set BUF_OUT_PIN "Q"
#set WIRE_LOAD_LIB "/home/ahmad/Desktop/vlsi-project/synopsys/ref/models/saed90nm_min_pg"
echo "===============Initials Finishes ==============="

###################################################################################

#set sdc_version 1.8
#set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA


###################################################################################

#Internal Clock Constarains

create_clock -name "internal_clock" -period $INTERNAL_PERIOD [get_ports clk]
set_clock_latency $CLOCK_LATENCY  [get_clocks internal_clock]
set_clock_uncertainty 0.3 [get_clocks internal_clock ]
set_clock_transition 0.4 [get_clocks internal_clock ]
set_input_delay -clock internal_clock  $RESET_DELAY  [get_ports rst]

set_fix_hold internal_clock

set_driving_cell -no_design_rule -lib_cell NBUFFX16 -pin Q [get_ports clk]
set_driving_cell -no_design_rule -lib_cell SDFFARX1 -pin Q [get_ports rst]

echo "========================== Inernal Clock Finished =================="
###################################################################################
																																						
###################################################################################

#GROUPING

group_path  -name CLOCK\
            -from internal_clock\
            -weight 1

group_path  -name INPUTS\
            -through [all_inputs]\
            -weight 1

group_path  -name OUTPUTS\
            -to [all_outputs]\
            -weight 1
###################################################################################

# IN/OUT
set INPUTPORTS [remove_from_collection [all_inputs] [get_ports {clk rst} ]]
set OUTPUTPORTS [all_outputs]

#set_load -pin_load 5.0 $OUTPUTPORTS

set_load -pin_load [expr 5 * [load_of $REFLIB/$BUFFER/$BUF_IN_PIN]] [all_outputs]
set_wire_load_model -lib $SLIB -name "ForQA"

#Internal Clock

set_input_delay -clock "internal_clock" -max $INPUT_DELAY $INPUTPORTS
set_output_delay -clock "internal_clock" -max $OUTPUT_DELAY $OUTPUTPORTS
set_input_delay -clock "internal_clock" -min $MIN_IO_DELAY $INPUTPORTS
set_output_delay -clock "internal_clock" -min $MIN_IO_DELAY $OUTPUTPORTS

echo "===============IO finishes============"

###################################################################################

#Area Constrains
set_max_area $MAXIMUM_AREA
echo "===============Area finishes============"

###################################################################################

# DRC

#set_max_transition $MAX_TRANSITION [current_design]
#set_max_capacitance 1.0 [current_design]
#set_max_fanout 20 [current_design]
echo "===============All finishes============"
													
###################################################################################
