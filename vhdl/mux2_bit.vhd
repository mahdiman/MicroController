Library ieee;
use ieee.std_logic_1164.all;

ENTITY mux2_bit IS
  PORT (a, b : in STD_LOGIC;
	s0 : IN STD_LOGIC ; 
	x :  OUT STD_LOGIC);    
END ENTITY mux2_bit ;


-- take care of the usage of when else 
ARCHITECTURE  mux2_bit_arch OF mux2_bit IS
BEGIN
  x <= a WHEN s0 = '0'
  ELSE b ;
END mux2_bit_arch;