vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/timer1.sdf work.timer1_1
add wave -position insertpoint  \
sim:/timer1_1/add_bus \
sim:/timer1_1/data_bus \
sim:/timer1_1/clk \
sim:/timer1_1/rst \
sim:/timer1_1/en \
sim:/timer1_1/rd_wr \
sim:/timer1_1/timer1_out \
sim:/timer1_1/options_rd \
sim:/timer1_1/options_wr \
sim:/timer1_1/start_counter_rd \
sim:/timer1_1/start_counter_wr \
sim:/timer1_1/end_counter_rd \
sim:/timer1_1/end_counter_wr \
sim:/timer1_1/inner_clk \
sim:/timer1_1/options \
sim:/timer1_1/start_counter \
sim:/timer1_1/end_counter \
sim:/timer1_1/clk_counter \
sim:/timer1_1/counter \
sim:/timer1_1/overflow
force -freeze sim:/timer1_1/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/timer1_1/rst 1 0
force -freeze sim:/timer1_1/en 1 0
run
force -freeze sim:/timer1_1/rst 0 0
force -freeze sim:/timer1_1/rd_wr 1 0
force -freeze sim:/timer1_1/add_bus 8'h44 0
force -freeze sim:/timer1_1/data_bus 8'h00 0
run
force -freeze sim:/timer1_1/add_bus 8'h45 0
force -freeze sim:/timer1_1/data_bus 8'h05 0
run
force -freeze sim:/timer1_1/add_bus 8'h46 0
force -freeze sim:/timer1_1/data_bus 8'h0A 0
run
force -freeze sim:/timer1_1/add_bus 8'h44 0
force -freeze sim:/timer1_1/data_bus 8'h20 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer1_1/data_bus 00 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer1_1/data_bus 20 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
noforce sim:/timer1_1/rd_wr
force -freeze sim:/timer1_1/add_bus 44 0
force -freeze sim:/timer1_1/rd_wr 0 0
noforce sim:/timer1_1/data_bus
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer1_1/en 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/timer1_1/en 1 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run


