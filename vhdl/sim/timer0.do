vsim -gui work.timer0
# vsim -gui work.timer0 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.timer0(arch_timer0)
# Loading work.ndff(ndff_arch)
# Loading work.tsb(tsb_arch)
add wave -position insertpoint  \
sim:/timer0/clk \
sim:/timer0/rst \
sim:/timer0/en \
sim:/timer0/rd_wr \
sim:/timer0/ext_clk \
sim:/timer0/add_bus \
sim:/timer0/data_bus \
sim:/timer0/timer0_out \
sim:/timer0/t0_options \
sim:/timer0/t0_count \
sim:/timer0/t0_options_rd \
sim:/timer0/t0_options_wr \
sim:/timer0/int_ext_clk \
sim:/timer0/t_clk \
sim:/timer0/t0_out0 \
sim:/timer0/t0_out1 \
sim:/timer0/rising_falling \
sim:/timer0/t0_count_rd \
sim:/timer0/t0_count_wr

force -freeze sim:/timer0/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/timer0/ext_clk 1 0, 0 {10 ns} -r 20 ns
force -freeze sim:/timer0/rst 1 0
force -freeze sim:/timer0/en 1 0
force -freeze sim:/timer0/rd_wr 1 0
force -freeze sim:/timer0/add_bus 41 0
force -freeze sim:/timer0/data_bus FA 0
run
run
force -freeze sim:/timer0/rst 0 0
run
run
force -freeze sim:/timer0/add_bus 40 0
force -freeze sim:/timer0/data_bus 16 0
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
force -freeze sim:/timer0/data_bus 11 0
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
force -freeze sim:/timer0/data_bus 02 0
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
force -freeze sim:/timer0/data_bus 14 0
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
force -freeze sim:/timer0/data_bus 16 0
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
