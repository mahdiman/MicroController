vsim -gui -sdfnoerror -sdfnowarn -sdftyp /=C:/verilog2/gpio.sdf work.gpio_n8
add wave -position insertpoint  \
sim:/gpio_n8/E \
sim:/gpio_n8/clk \
sim:/gpio_n8/RW \
sim:/gpio_n8/rst \
sim:/gpio_n8/t0 \
sim:/gpio_n8/t1 \
sim:/gpio_n8/pwm \
sim:/gpio_n8/addressBus \
sim:/gpio_n8/dataBus \
sim:/gpio_n8/IOPINS \
sim:/gpio_n8/configOut \
sim:/gpio_n8/fromBus \
sim:/gpio_n8/wrBusEn \
sim:/gpio_n8/wrPinsEn \
sim:/gpio_n8/dataOut \
sim:/gpio_n8/pinsOut \
sim:/gpio_n8/dataEN \
sim:/gpio_n8/contEN \
sim:/gpio_n8/dataOutEn \
sim:/gpio_n8/dataOrModEn \
sim:/gpio_n8/dataOrMod
force -freeze sim:/gpio_n8/E 1 0
force -freeze sim:/gpio_n8/clk 0 0, 1 {5 ns} -r 10 ns
force -freeze sim:/gpio_n8/RW 1 0
force -freeze sim:/gpio_n8/rst 1 0
force -freeze sim:/gpio_n8/t0 1 0
force -freeze sim:/gpio_n8/t1 1 0
force -freeze sim:/gpio_n8/pwm 1 0
force -freeze sim:/gpio_n8/addressBus 65 0
force -freeze sim:/gpio_n8/dataBus F0 0
run
force -freeze sim:/gpio_n8/rst 0 0
run
run
force -freeze sim:/gpio_n8/addressBus 66 0
force -freeze sim:/gpio_n8/dataBus F7 0
run
run
force -freeze sim:/gpio_n8/t1 0 0
run
force -freeze sim:/gpio_n8/addressBus 64 0
force -freeze sim:/gpio_n8/dataBus FF 0
run
run
force -freeze sim:/gpio_n8/addressBus 66 0
force -freeze sim:/gpio_n8/dataBus F0 0
run
run
force -freeze sim:/gpio_n8/addressBus 65 0
force -freeze sim:/gpio_n8/dataBus 00 0
run
run
force -freeze sim:/gpio_n8/addressBus 64 0
run
run
force -freeze sim:/gpio_n8/addressBus 65 0
force -freeze sim:/gpio_n8/dataBus F0 0
noforce sim:/gpio_n8/IOPINS
run
run
force -freeze sim:/gpio_n8/RW 0 0
noforce sim:/gpio_n8/dataBus
force -freeze sim:/gpio_n8/IOPINS(7) 1 0
force -freeze sim:/gpio_n8/IOPINS(6) 1 0
force -freeze sim:/gpio_n8/IOPINS(5) 0 0
force -freeze sim:/gpio_n8/IOPINS(4) 0 0
force -freeze sim:/gpio_n8/addressBus 67 0
run
run
force -freeze sim:/gpio_n8/RW 1 0
noforce sim:/gpio_n8/IOPINS
force -freeze sim:/gpio_n8/dataBus CF 0
force -freeze sim:/gpio_n8/addressBus 64 0
run
run
force -freeze sim:/gpio_n8/RW 0 0
noforce sim:/gpio_n8/IOPINS
force -freeze sim:/gpio_n8/RW 0 0
force -freeze sim:/gpio_n8/addressBus 30 0
run
force -freeze sim:/gpio_n8/dataBus 00 0
run
force -freeze sim:/gpio_n8/RW 0 0
noforce sim:/gpio_n8/dataBus
force -freeze sim:/gpio_n8/addressBus 67 0 
force -freeze sim:/gpio_n8/IOPINS(7) 1 0
force -freeze sim:/gpio_n8/IOPINS(6) 0 0
force -freeze sim:/gpio_n8/IOPINS(5) 1 0
force -freeze sim:/gpio_n8/IOPINS(4) 0 0
run
run



