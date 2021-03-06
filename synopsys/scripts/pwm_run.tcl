# gpio

#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/tsb.vhd}
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../vhdl/vlsi/pwm.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/pwm.vhd}

#elaborate
elaborate PWM -architecture PWM_ARCH -library DEFAULT -parameters "n = 8"

#link
link

#check design

#add constrain file
source const_pwm.sdc

check_design
compile

#reports
report_timing > ../report/pwm/time.txt
report_area > ../report/pwm/area.txt
report_constraints  > ../report/pwm/const.txt
report_constraint -all_violators > ../report/pwm/vio.txt
write -hierarchy -format verilog -output ../../verilog/pwm.vo
write_sdf ../../verilog/pwm.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/pwm/minpwm.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/pwm/maxpwm.sdf
