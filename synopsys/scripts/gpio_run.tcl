# gpio

#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/tsb_bit.vhd}
read_file -format vhdl {../../vhdl/vlsi/dff.vhd}
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../vhdl/vlsi/mux2_bit.vhd}
read_file -format vhdl {../../vhdl/vlsi/gpio.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/tsb_bit.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/dff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/mux2_bit.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/gpio.vhd}

#elaborate
elaborate GPIO -architecture GPIO_ARCH -library DEFAULT -parameters "n = 8"

#link
link

#check design
check_design

#add constrain file
source const_gpio.sdc
compile

#reports
report_timing > ../report/gpio/time.txt
report_area > ../report/gpio/area.txt
report_constraints  > ../report/gpio/const.txt
report_constraint -all_violators > ../report/gpio/vio.txt
write -hierarchy -format verilog -output ../../verilog/gpio.vo
write_sdf ../../verilog/gpio.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/gpio/mingpio.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/gpio/maxgpio.sdf
