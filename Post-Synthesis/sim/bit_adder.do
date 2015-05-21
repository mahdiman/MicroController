vsim work.bit_adder
# vsim work.bit_adder 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.bit_adder(bit_adder_arch)
add wave -position insertpoint  \
sim:/bit_adder/a \
sim:/bit_adder/b \
sim:/bit_adder/cin \
sim:/bit_adder/s \
sim:/bit_adder/cout
force -freeze sim:/bit_adder/a 0 0
force -freeze sim:/bit_adder/b 0 0
force -freeze sim:/bit_adder/cin 0 0
run
force -freeze sim:/bit_adder/cin 1 0
run
force -freeze sim:/bit_adder/cin 0 0
force -freeze sim:/bit_adder/b 1 0
run
force -freeze sim:/bit_adder/cin 1 0
run
force -freeze sim:/bit_adder/cin 0 0
force -freeze sim:/bit_adder/b 0 0
force -freeze sim:/bit_adder/a 1 0
run
force -freeze sim:/bit_adder/cin 1 0
run
force -freeze sim:/bit_adder/b 1 0
force -freeze sim:/bit_adder/cin 0 0
run
force -freeze sim:/bit_adder/cin 1 0
run

