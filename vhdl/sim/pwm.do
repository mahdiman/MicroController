vsim -gui work.pwm
add wave -position insertpoint  \
sim:/pwm/*
force -freeze sim:/pwm/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/pwm/rst 1 0
force -freeze sim:/pwm/en 1 0
force -freeze sim:/pwm/rd_wr 1 0
run
force -freeze sim:/pwm/rst 0 0
force -freeze sim:/pwm/add_bus 8'h48 0
force -freeze sim:/pwm/data_bus 8'h03 0
run
force -freeze sim:/pwm/add_bus 8'h49 0
force -freeze sim:/pwm/data_bus 8'h02 0
run
run
run
run
run
run
run
run
force -freeze sim:/pwm/add_bus 8'h50 0
force -freeze sim:/pwm/data_bus 8'h01 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/pwm/rd_wr 0 0
force -freeze sim:/pwm/add_bus 49 0
noforce sim:/pwm/data_bus
run
run
run
run
force -freeze sim:/pwm/add_bus 50 0
run
run
run
run
run
run
run
force -freeze sim:/pwm/add_bus 48 0
run
run
run
run
run
run
run

