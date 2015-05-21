# gpio

#loading files
remove_design -designs
read_file -format vhdl {../../vhdl/vlsi/ndff.vhd}
read_file -format vhdl {../../vhdl/vlsi/iEnableRegister.vhd}

#analyze designs
analyze -library WORK -format vhdl {../../vhdl/vlsi/ndff.vhd}
analyze -library WORK -format vhdl {../../vhdl/vlsi/iEnableRegister.vhd}

#elaborate
elaborate IENABLEREGISTER -architecture IENABLEREGISTER_ARCH -library DEFAULT -parameters "n = 8"

#link
link

#check design
check_design

#add constrain file
source const_ienreg.sdc
compile

#reports
report_timing > ../report/ienableregister/time.txt
report_area > ../report/ienableregister/area.txt
report_constraints  > ../report/ienableregister/const.txt
report_constraint -all_violators > ../report/ienableregister/vio.txt
write -hierarchy -format verilog -output ../../verilog/ienreg.vo
write_sdf ../../verilog/ienreg.sdf
report_timing -delay min -nworst 40 -significant_digits 4 > ../report/ienableregister/minienreg.sdf
report_timing -delay max -nworst 40 -significant_digits 4 > ../report/ienableregister/maxienreg.sdf
