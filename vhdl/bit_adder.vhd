LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY bit_adder IS 
	PORT( a, b, cin  : IN STD_LOGIC;
		s, cout: OUT STD_LOGIC
 	);
END ENTITY;

ARCHITECTURE bit_adder_arch OF bit_adder IS

BEGIN
  s <= a XOR b XOR cin;
 cout <= ((a xor b) and cin) or (a and b);
  
END;
