vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/pwm.sdf work.pwm_n8
add wave -position insertpoint  \
sim:/pwm_n8/add_bus \
sim:/pwm_n8/data_bus \
sim:/pwm_n8/counter_test \
sim:/pwm_n8/clk \
sim:/pwm_n8/rst \
sim:/pwm_n8/en \
sim:/pwm_n8/rd_wr \
sim:/pwm_n8/pwm_out \
sim:/pwm_n8/duration_rd \
sim:/pwm_n8/duration_wr \
sim:/pwm_n8/duty_cycle_rd \
sim:/pwm_n8/duty_cycle_wr \
sim:/pwm_n8/options_rd \
sim:/pwm_n8/options_wr \
sim:/pwm_n8/duration \
sim:/pwm_n8/duty_cycle \
sim:/pwm_n8/options
force -freeze sim:/pwm_n8/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/pwm_n8/rst 1 0
force -freeze sim:/pwm_n8/en 1 0
force -freeze sim:/pwm_n8/rd_wr 1 0
run
force -freeze sim:/pwm_n8/rst 0 0
force -freeze sim:/pwm_n8/add_bus 8'h48 0
force -freeze sim:/pwm_n8/data_bus 8'h03 0
run
force -freeze sim:/pwm_n8/add_bus 8'h49 0
force -freeze sim:/pwm_n8/data_bus 8'h02 0
run
run
run
run
run
run
run
run
force -freeze sim:/pwm_n8/add_bus 8'h50 0
force -freeze sim:/pwm_n8/data_bus 8'h01 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/pwm_n8/rd_wr 0 0
force -freeze sim:/pwm_n8/add_bus 49 0
noforce sim:/pwm_n8/data_bus
run
run
run
run
force -freeze sim:/pwm_n8/add_bus 50 0
run
run
run
run
run
run
run
force -freeze sim:/pwm_n8/add_bus 48 0
run
run
run
run
run
run
run

