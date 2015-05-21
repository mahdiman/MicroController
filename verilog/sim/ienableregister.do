vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/ienreg.sdf work.iEnableRegister_n8
# vsim -gui work.iEnableRegister_n8 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.iEnableRegister_n8(iEnableRegister_n8_arch)
# Loading work.ndff(ndff_arch)
# Loading work.tsb(tsb_arch)
add wave -position insertpoint  \
sim:/iEnableRegister_n8/E \
sim:/iEnableRegister_n8/Clk \
sim:/iEnableRegister_n8/Rst \
sim:/iEnableRegister_n8/t0 \
sim:/iEnableRegister_n8/t1 \
sim:/iEnableRegister_n8/rd_wr \
sim:/iEnableRegister_n8/addressBus \
sim:/iEnableRegister_n8/dataBus \
sim:/iEnableRegister_n8/globalInt \
sim:/iEnableRegister_n8/dataIn 
force -freeze sim:/iEnableRegister_n8/E 1 0
force -freeze sim:/iEnableRegister_n8/Clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/iEnableRegister_n8/Rst 1 0
force -freeze sim:/iEnableRegister_n8/t0 1 0
force -freeze sim:/iEnableRegister_n8/t1 1 0
force -freeze sim:/iEnableRegister_n8/rd_wr 1 0
force -freeze sim:/iEnableRegister_n8/addressBus 30 0
force -freeze sim:/iEnableRegister_n8/dataBus 03 0
run
force -freeze sim:/iEnableRegister_n8/Rst 0 0
run
run
force -freeze sim:/iEnableRegister_n8/dataBus 00 0
run
run
force -freeze sim:/iEnableRegister_n8/dataBus 03 0
run
run
force -freeze sim:/iEnableRegister_n8/addressBus 31 0
force -freeze sim:/iEnableRegister_n8/dataBus 00 0
run
run
force -freeze sim:/iEnableRegister_n8/addressBus 30 0
force -freeze sim:/iEnableRegister_n8/rd_wr 0 0
noforce sim:/iEnableRegister_n8/dataBus
run
run


