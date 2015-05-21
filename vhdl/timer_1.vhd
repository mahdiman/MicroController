LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY timer1 IS
	PORT( clk, rst, en, rd_wr  : IN STD_LOGIC;
		add_bus: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_bus: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		timer1_out: OUT STD_LOGIC
 	);
END ENTITY ;

ARCHITECTURE arch_timer1 of timer1 is

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

	SIGNAL start_counter, end_counter, options: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL inner_clk, options_rd, options_wr, start_counter_rd, start_counter_wr, end_counter_rd, end_counter_wr, pre_scalar_turn_on : STD_LOGIC;
	SIGNAL pre_scalar, post_scalar : STD_LOGIC_VECTOR(3 DOWNTO 0);

	-- Testing Signals
	--SIGNAL timer1_counter_test : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	BEGIN

	options_rd 			<= en WHEN rd_wr = '1' AND add_bus = x"44" ELSE '0'; 
	options_wr 			<= en WHEN rd_wr = '0' AND add_bus = x"44" ELSE '0';

	start_counter_rd 	<= en WHEN rd_wr = '1' AND add_bus = x"45" ELSE '0'; 
	start_counter_wr 	<= en WHEN rd_wr = '0' AND add_bus = x"45" ELSE '0'; 

	end_counter_rd 		<= en WHEN rd_wr = '1' AND add_bus = x"46" ELSE '0';
	end_counter_wr 		<= en WHEN rd_wr = '0' AND add_bus = x"46" ELSE '0'; 

	u1: ndff generic map (8) port map (clk, rst, options_rd, data_bus, options);
	u2: ndff generic map (8) port map (clk, rst, start_counter_rd, data_bus, start_counter);
	u3: ndff generic map (8) port map (clk, rst, end_counter_rd, data_bus, end_counter);

	u4: tsb generic map (8) port map(start_counter_wr, start_counter, data_bus);
	u5: tsb generic map (8) port map(end_counter_wr, end_counter, data_bus);
	u6: tsb generic map (8) port map(options_wr, options, data_bus);

	-- |         |   	bit (4)       |   bit(3 => 2)   |    bit(1 => 0)   |
	-- |--------------------------------------------------------------------
	-- |  xxxxxx | pre_scalar_turn_on | pre_scalar_mode | post_scalar_mode |
	-- |--------------------------------------------------------------------
	-- post_scalar_mode : 	00 => 1:1
	-- post_scalar_mode : 	01 => 1:2
	-- post_scalar_mode : 	10 => 1:4
	-- post_scalar_mode : 	11 => 1:8
	--
	-- pre_scalar_mode : 	00 => 1:2
	-- pre_scalar_mode : 	01 => 1:4
	-- pre_scalar_mode : 	10 => 1:8
	-- pre_scalar_mode : 	11 => 1:16
	--
	-- pre_scalar_turn_on:	1 => turn on pre scalar
	-- pre_scalar_turn_on:	0 => turn off pre scalar

	pre_scalar <= "0001" WHEN options(3 DOWNTO 2) = "00"
		ELSE "0010" WHEN options(3 DOWNTO 2) = "01"
		ELSE "0100" WHEN options(3 DOWNTO 2) = "10"
		ELSE "1000";

	pre_scalar_turn_on <= options(4);

	post_scalar <= "0001" WHEN options(1 DOWNTO 0) = "00"
		ELSE "0010" WHEN options(1 DOWNTO 0) = "01"
		ELSE "0100" WHEN options(1 DOWNTO 0) = "10"
		ELSE "1000";

	-- pre scalar
	PROCESS(clk, rst, options(5), pre_scalar_turn_on)
		VARIABLE clk_counter : STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
		if( rst = '1' ) then
			inner_clk <= '0';
			clk_counter := (3 DOWNTO 1 => '0') & '1';
		elsif(options(5) = '1') then
			if ( pre_scalar_turn_on = '0' ) then
				inner_clk <= clk;
			elsif( falling_edge( clk ) ) then
				if( clk_counter = pre_scalar ) then
					inner_clk <= not( inner_clk );
					clk_counter := (3 DOWNTO 1 => '0') & '1';
				else
					clk_counter := STD_LOGIC_VECTOR( UNSIGNED( clk_counter ) + 1 );	
				end if;
			end if; 
		end if; 
	END PROCESS;

	-- post scalar
	PROCESS(inner_clk, rst, start_counter, options(5))
		VARIABLE counter: STD_LOGIC_VECTOR(7 DOWNTO 0);
		VARIABLE overflow: STD_LOGIC_VECTOR(3 DOWNTO 0);		 
	BEGIN
		if(rst = '1') then
			counter := (others => '0');
			overflow := (others => '0');
			timer1_out <= '0';
		elsif(options(5) = '1') then
			if( rising_edge( inner_clk ) ) then
				if( counter = end_counter ) then
					counter := (7 DOWNTO 1 => '0') & '1';
					overflow := STD_LOGIC_VECTOR( UNSIGNED(overflow) + 1 );
				else
					counter := STD_LOGIC_VECTOR( UNSIGNED(counter) + 1 );
				end if;

				if(overflow = post_scalar) then
					overflow := (others => '0');
					timer1_out <= '1';
				else
					timer1_out <= '0'; 
				end if;
			end if;
		else 
			counter := start_counter;
			timer1_out <= '0';
			overflow := (others => '0');
		end if;
		--timer1_counter_test <= counter;
	END PROCESS;	

END arch_timer1;