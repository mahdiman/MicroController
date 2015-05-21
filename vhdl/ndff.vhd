LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- ENTITY ndff
-- Describes a n-bits D-FlipFlop
-- Clk: Clock
-- Rst: Reset
-- E: Enable
-- d: Input stream
-- output: Output stream

ENTITY ndff IS
  GENERIC ( n : integer := 8);
  PORT( Clk,Rst,E : in STD_LOGIC;
        d : IN STD_LOGIC_VECTOR(n-1 dOWNTO 0);
        output : OUT STD_LOGIC_VECTOR(n-1 dOWNTO 0));
END ndff;

-- Architecture ndff_arch
-- describes the D-FilpFlop Functionality

ARCHITECTURE ndff_arch OF ndff IS

BEGIN
  process(Clk,Rst, E)
  begin
    if(Rst = '1') then
	output <= (others => '0');
    elsif rising_edge( Clk ) then
      if E = '1' then
	output <= d;
      end if;
    end if;
  end process;
END ndff_arch;
