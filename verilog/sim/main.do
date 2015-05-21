vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/main.sdf work.micro_controller_1
# vsim work.micro_controller_1 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.micro_controller_1(main)
# Loading work.timer0(arch_timer0)
# Loading work.ndff(ndff_arch)
# Loading work.tsb(tsb_arch)
# Loading work.dff_bit(dff_arch)
# Loading work.timer1(arch_timer1)
# Loading work.ienableregister(ienableregister_arch)
# Loading work.pwm(pwm_arch)
# Loading work.gpio(gpio_arch)
# Loading work.mux2_bit(mux2_bit_arch)
# Loading work.tsb_bit(tsb_bit_arch)
add wave -position insertpoint  \
sim:/micro_controller_1/clk \
sim:/micro_controller_1/rst \
sim:/micro_controller_1/en \
sim:/micro_controller_1/rw \
sim:/micro_controller_1/ext_clk \
sim:/micro_controller_1/address_bus \
sim:/micro_controller_1/data_bus \
sim:/micro_controller_1/io_pins \
sim:/micro_controller_1/globalInt \
sim:/micro_controller_1/t0_out \
sim:/micro_controller_1/t1_out \
sim:/micro_controller_1/pwm_out
force -freeze sim:/micro_controller_1/rst 1 0
force -freeze sim:/micro_controller_1/en 1 0
force -freeze sim:/micro_controller_1/rw 1 0
force -freeze sim:/micro_controller_1/address_bus 41 0
force -freeze sim:/micro_controller_1/data_bus F8 0
force -freeze sim:/micro_controller_1/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/micro_controller_1/ext_clk 1 0, 0 {10 ns} -r 20 ns
run
force -freeze sim:/micro_controller_1/rst 0 0
run
run
force -freeze sim:/micro_controller_1/address_bus 40 0
force -freeze sim:/micro_controller_1/data_bus 12 0
run
force -freeze sim:/micro_controller_1/address_bus 45 0
force -freeze sim:/micro_controller_1/data_bus 05 0
run
force -freeze sim:/micro_controller_1/address_bus 46 0
force -freeze sim:/micro_controller_1/data_bus 0A 0
run
force -freeze sim:/micro_controller_1/address_bus 44 0
force -freeze sim:/micro_controller_1/data_bus 20 0
run
force -freeze sim:/micro_controller_1/address_bus 48 0
force -freeze sim:/micro_controller_1/data_bus 03 0
run
force -freeze sim:/micro_controller_1/address_bus 49 0
force -freeze sim:/micro_controller_1/data_bus 02 0
force -freeze sim:/micro_controller_1/address_bus 50 0
force -freeze sim:/micro_controller_1/address_bus 49 0
force -freeze sim:/micro_controller_1/data_bus 02 0
run
force -freeze sim:/micro_controller_1/address_bus 50 0
force -freeze sim:/micro_controller_1/data_bus 01 0
run
force -freeze sim:/micro_controller_1/address_bus 30 0
force -freeze sim:/micro_controller_1/data_bus 0F 0
run
force -freeze sim:/micro_controller_1/address_bus 66 0
force -freeze sim:/micro_controller_1/data_bus 07 0
run
force -freeze sim:/micro_controller_1/address_bus 65 0
force -freeze sim:/micro_controller_1/data_bus F0 0
run
force -freeze sim:/micro_controller_1/address_bus 64 0
force -freeze sim:/micro_controller_1/data_bus EE 0
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/address_bus 66 0
force -freeze sim:/micro_controller_1/data_bus 00 0
force -freeze sim:/micro_controller_1/address_bus 65 0
run
run
force -freeze sim:/micro_controller_1/address_bus 66 0
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/address_bus 41 0
force -freeze sim:/micro_controller_1/rw 0 0
noforce sim:/micro_controller_1/data_bus
run
force -freeze sim:/micro_controller_1/address_bus 40 0
run
force -freeze sim:/micro_controller_1/address_bus 30 0
run
force -freeze sim:/micro_controller_1/address_bus 67 0
run
force -freeze sim:/micro_controller_1/address_bus 50 0
run
force -freeze sim:/micro_controller_1/address_bus 49 0
run
force -freeze sim:/micro_controller_1/address_bus 48 0
run
force -freeze sim:/micro_controller_1/address_bus 65 0
force -freeze sim:/micro_controller_1/data_bus F0 0
force -freeze sim:/micro_controller_1/rw 1 0
run
force -freeze sim:/micro_controller_1/address_bus 67 0
noforce sim:/micro_controller_1/data_bus
force -freeze sim:/micro_controller_1/rw 0 0
force -freeze sim:/micro_controller_1/io_pins(7) 0 0
force -freeze sim:/micro_controller_1/io_pins(6) 0 0
force -freeze sim:/micro_controller_1/io_pins(5) 0 0
force -freeze sim:/micro_controller_1/io_pins(4) 0 0
run
force -freeze sim:/micro_controller_1/io_pins(7) 1 0
force -freeze sim:/micro_controller_1/io_pins(6) 1 0
force -freeze sim:/micro_controller_1/io_pins(5) 1 0
force -freeze sim:/micro_controller_1/io_pins(4) 1 0
run
force -freeze sim:/micro_controller_1/rw 1 0
noforce sim:/micro_controller_1/io_pins
noforce sim:/micro_controller_1/data_bus
force -freeze sim:/micro_controller_1/data_bus 00 0
force -freeze sim:/micro_controller_1/address_bus 65 0
run
force -freeze sim:/micro_controller_1/address_bus 50 0
force -freeze sim:/micro_controller_1/data_bus 00 0
run
run
run
force -freeze sim:/micro_controller_1/address_bus 48 0
force -freeze sim:/micro_controller_1/data_bus 05 0
run
force -freeze sim:/micro_controller_1/address_bus 49 0
force -freeze sim:/micro_controller_1/data_bus 01 0
run
force -freeze sim:/micro_controller_1/address_bus 50 0
force -freeze sim:/micro_controller_1/data_bus 01 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/address_bus 40 0
force -freeze sim:/micro_controller_1/data_bus 06 0
run -continue
run
force -freeze sim:/micro_controller_1/address_bus 41 0
force -freeze sim:/micro_controller_1/data_bus FA 0
run
run 
run
force -freeze sim:/micro_controller_1/address_bus 40 0
force -freeze sim:/micro_controller_1/data_bus 16 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/data_bus 01 0
run
force -freeze sim:/micro_controller_1/address_bus 41 0
force -freeze sim:/micro_controller_1/data_bus f7 0
run
force -freeze sim:/micro_controller_1/data_bus 11 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/data_bus 06 0
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/address_bus 41 0
force -freeze sim:/micro_controller_1/data_bus FC 0
run
force -freeze sim:/micro_controller_1/address_bus 40 0
force -freeze sim:/micro_controller_1/data_bus 12 0
run
run
run
run
run
run
run
run
run
run
run
run 
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/data_bus 15 0
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/address_bus 66 0
force -freeze sim:/micro_controller_1/data_bus 07 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
force -freeze sim:/micro_controller_1/rst 1 0
run
run
run
run
run
