
#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/tsb.vhd}
read_file -format vhdl {../../vhdl/vlsi/dff.vhd}
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../vhdl/vlsi/timer_0.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/dff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/timer_0.vhd}

#elaborate
elaborate TIMER0 -architecture ARCH_TIMER0 -library DEFAULT

#link
link

#check design
check_design

#add constrain file
source const_t0.sdc
compile

#reports
report_timing > ../report/timer0/time.txt
report_area > ../report/timer0/area.txt
report_constraints  > ../report/timer0/const.txt
report_constraint -all_violators > ../report/timer0/vio.txt
write -hierarchy -format verilog -output ../../verilog/timer0.vo
write_sdf ../../verilog/timer0.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/timer0/mint0.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/timer0/maxt0.sdf
