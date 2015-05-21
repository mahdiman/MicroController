LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY pwm IS
  	GENERIC (n : integer := 8);
	PORT( clk, rst, en, rd_wr  : IN STD_LOGIC;
		add_bus: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		data_bus: INOUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
		pwm_out: OUT STD_LOGIC;
		counter_test : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0) );
END pwm;

ARCHITECTURE pwm_arch OF pwm IS

	COMPONENT ndff IS
	  GENERIC ( n : integer := 8);
	  PORT( Clk,Rst,E : in STD_LOGIC;
	        d : IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	        output : OUT STD_LOGIC_VECTOR(n-1 DOWNTO 0));
	END COMPONENT;

	COMPONENT tsb IS
		GENERIC ( n : integer := 8);
	  	PORT ( E   : IN  STD_LOGIC; 
	         Input  : IN  STD_LOGIC_VECTOR (n-1 DOWNTO 0);
	         Output : OUT STD_LOGIC_VECTOR (n-1 DOWNTO 0));
	END COMPONENT;

	SIGNAL duration, duty_cycle, options : STD_LOGIC_VECTOR(n-1 DOWNTO 0); 
	SIGNAL duration_rd, duration_wr, duty_cycle_rd, duty_cycle_wr, options_rd, options_wr : STD_LOGIC;

BEGIN

	duration_rd  <= en WHEN rd_wr = '1' and add_bus = x"48" ELSE '0';
	duration_wr  <= en WHEN rd_wr = '0' and add_bus = x"48" ELSE '0';
	duty_cycle_rd <= en WHEN rd_wr = '1' and add_bus = x"49" ELSE '0';
 	duty_cycle_wr <= en WHEN rd_wr = '0' and add_bus = x"49" ELSE '0';
  options_rd <= en WHEN rd_wr = '1' and add_bus = x"50" ELSE '0';
 	options_wr <= en WHEN rd_wr = '0' and add_bus = x"50" ELSE '0';
 	
	u1: ndff generic map (n) port map (clk, rst, duration_rd, data_bus, duration);
	u2: tsb generic map (n) port map(duration_wr, duration, data_bus);
	u3: ndff generic map (n) port map (clk, rst, duty_cycle_rd, data_bus, duty_cycle);
	u4: tsb generic map (n) port map(duty_cycle_wr, duty_cycle, data_bus);
	u5: ndff generic map(n) port map(clk, rst, options_rd, data_bus, options);
	u6: tsb generic map(n) port map(options_wr, options, data_bus);

	process( clk, rst, options(0) ) 
	  VARIABLE counter : STD_LOGIC_VECTOR(n-1 DOWNTO 0);
	BEGIN
		if(rst = '1') then
			counter := (others => '0');
			pwm_out <= '0';
		elsif( options(0) = '1' ) then
			if ( falling_edge(clk) ) then
				if( counter = duration ) then
					counter := (n-1 DOWNTO 1 => '0') & '1';
				else 
					counter := STD_LOGIC_VECTOR(unsigned( counter ) + 1);
				end if;
				if( counter > duty_cycle ) then
					pwm_out <= '0';
				else
					pwm_out <= '1';
				end if;
			end if;
		else 
			counter := (others => '0');
			pwm_out <= '0';
		end if;
		counter_test <= counter;
	end process; 
END pwm_arch;
