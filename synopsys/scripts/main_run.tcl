# gpio

#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/tsb.vhd}
read_file -format vhdl {../../vhdl/vlsi/mux2.vhd}
read_file -format vhdl {../../vhdl/vlsi/mux2_bit.vhd}
read_file -format vhdl {../../vhdl/vlsi/tsb_bit.vhd}
read_file -format vhdl {../../vhdl/vlsi/dff.vhd}
read_file -format vhdl {../../vhdl/vlsi/mux4.vhd}
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../vhdl/vlsi/gpio.vhd}
read_file -format vhdl {../../vhdl/vlsi/timer_1.vhd}
read_file -format vhdl {../../vhdl/vlsi/timer_0.vhd}
read_file -format vhdl {../../vhdl/vlsi/pwm.vhd}
read_file -format vhdl {../../vhdl/vlsi/iEnableRegister.vhd}
read_file -format vhdl {../../vhdl/vlsi/main.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/dff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb_bit.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/mux2_bit.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/mux2.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/mux4.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/gpio.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/timer_1.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/timer_0.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/pwm.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/iEnableRegister.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/main.vhd}

#elaborate
elaborate MICRO_CONTROLLER -architecture MAIN -library DEFAULT

#link
link

#check design
check_design

#add constrain file
source const_main.sdc
compile

#reports
report_timing > ../report/main/time.txt
report_area > ../report/main/area.txt
report_constraints  > ../report/main/const.txt
report_constraint -all_violators > ../report/main/vio.txt
write -hierarchy -format verilog -output ../../verilog/main.vo
write_sdf ../../verilog/main.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/main/minmain.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/main/maxmain.sdf
