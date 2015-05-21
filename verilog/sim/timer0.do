vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/timer0.sdf work.timer0_1
# vsim -gui work.timer0_1 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.timer0_1(arch_timer0_1)
# Loading work.ndff(ndff_arch)
# Loading work.tsb(tsb_arch)
add wave -position insertpoint  \
sim:/timer0_1/clk \
sim:/timer0_1/rst \
sim:/timer0_1/en \
sim:/timer0_1/rd_wr \
sim:/timer0_1/ext_clk \
sim:/timer0_1/add_bus \
sim:/timer0_1/data_bus \
sim:/timer0_1/timer0_out \
sim:/timer0_1/t0_options \
sim:/timer0_1/t0_count \
sim:/timer0_1/t0_options_rd \
sim:/timer0_1/t0_options_wr \
sim:/timer0_1/int_ext_clk \
sim:/timer0_1/t_clk 
force -freeze sim:/timer0_1/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/timer0_1/ext_clk 1 0, 0 {10 ns} -r 20 ns
force -freeze sim:/timer0_1/rst 1 0
force -freeze sim:/timer0_1/en 1 0
force -freeze sim:/timer0_1/rd_wr 1 0
force -freeze sim:/timer0_1/add_bus 41 0
force -freeze sim:/timer0_1/data_bus FA 0
run
run
force -freeze sim:/timer0_1/rst 0 0
run
run
force -freeze sim:/timer0_1/add_bus 40 0
force -freeze sim:/timer0_1/data_bus 11 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer0_1/data_bus 14 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer0_1/data_bus 02 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer0_1/data_bus 16 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer0_1/data_bus 14 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
