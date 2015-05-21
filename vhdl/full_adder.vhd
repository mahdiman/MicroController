LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;



ENTITY full_adder IS
	  PORT(a, b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	           cin : IN STD_LOGIC;
	           s: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	           cout: OUT STD_LOGIC
	           );
END ENTITY;


ARCHITECTURE full_adder_arch OF full_adder IS

COMPONENT bit_adder IS 
	PORT( a, b, cin  : IN STD_LOGIC;
		s, cout: OUT STD_LOGIC
 	);
END COMPONENT;

signal tempCout : STD_LOGIC_VECTOR(6 DOWNTO 0);


BEGIN
  adder0: bit_adder PORT MAP(a(0), b(0), cin, s(0), tempCout(0));
  adder1: bit_adder PORT MAP(a(1), b(1), tempCout(0), s(1), tempCout(1));
  adder2: bit_adder PORT MAP(a(2), b(2), tempCout(1), s(2), tempCout(2));
  adder3: bit_adder PORT MAP(a(3), b(3), tempCout(2), s(3), tempCout(3));
  adder4: bit_adder PORT MAP(a(4), b(4), tempCout(3), s(4), tempCout(4));
  adder5: bit_adder PORT MAP(a(5), b(5), tempCout(4), s(5), tempCout(5));
  adder6: bit_adder PORT MAP(a(6), b(6), tempCout(5), s(6), tempCout(6));
  adder7: bit_adder PORT MAP(a(7), b(7), tempCout(6), s(7), cout);
END;