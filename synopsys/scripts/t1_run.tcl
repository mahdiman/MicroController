# gpio

#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/tsb.vhd}
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../modelsim/timer_1.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/timer_1.vhd}

#elaborate
elaborate TIMER1 -architecture ARCH_TIMER1 -library DEFAULT

#link
link

#check design
check_design

#add constrain file
source const_t1.sdc
compile

#reports
report_timing > ../report/timer1/time.txt
report_area > ../report/timer1/area.txt
report_constraints  > ../report/timer1/const.txt
report_constraint -all_violators > ../report/timer1/vio.txt
write -hierarchy -format verilog -output ../../verilog/timer1.vo
write_sdf ../../verilog/timer1.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/timer1/mint1.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/timer1/maxt1.sdf
