LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
ENTITY timer0 IS 
	PORT( clk, rst, en, rd_wr, ext_clk  : IN STD_LOGIC;
		add_bus: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_bus: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		timer0_out: OUT STD_LOGIC
 	);
END ENTITY;

ARCHITECTURE arch_timer0 of timer0 is

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
	
	COMPONENT dff_bit IS

  PORT( d,clk,rst,E : IN STD_LOGIC;
  output : OUT STD_LOGIC);

  END COMPONENT;

	SIGNAL t0_options, t0_count : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL t0_options_rd, t0_options_wr, int_ext_clk, t_clk : STD_LOGIC;
	
	-- signals temp
	SIGNAL t0_out0, t0_out1, rising_falling, t0_count_rd, t0_count_wr : STD_LOGIC;
	
	-- Testing Signals
	--SIGNAL timer0_counter_test : STD_LOGIC_VECTOR(7 DOWNTO 0);

	BEGIN

	t0_options_rd <= en WHEN rd_wr = '1' AND add_bus = x"40" ELSE '0'; 
	t0_options_wr <= en WHEN rd_wr = '0' AND add_bus = x"40" ELSE '0';
	t0_count_rd <= en WHEN rd_wr = '1' AND add_bus = x"41" ELSE '0';
	t0_count_wr <= en WHEN rd_wr = '0' AND add_bus = x"41" ELSE '0';
	
	u1: ndff generic map (8) port map (clk, rst, t0_options_rd, data_bus, t0_options);
	u2: tsb generic map (8) port map(t0_options_wr, t0_options, data_bus);
	u3: ndff generic map(8) port map(clk, rst, t0_count_rd, data_bus, t0_count);
	u4: tsb generic map (8) port map(t0_count_wr, t0_count, data_bus);
	u5: dff_bit port map(ext_clk, clk, '0', '1', int_ext_clk); 

	-- |         |  bit(2)  |   bit(1 => 0)  |
	-- |--------------------+----------------+
	-- |  xxxxxx | edge clk | mode selection |
	-- |--------------------+----------------+
	-- mode selection    00 => internal clk
	-- mode selection    01 => external clk async
	-- mode selection    10 => external clk sync
	--
	-- edge clk 		1  => falling edgde
	-- edge clk 		0  => rising edgde
	--
	-- options = 00 => internal clk, rising edgde
	-- options = 04 => internal clk, falling edgde
	--
	-- options = 01 => external clk async, rising edgde
	-- options = 05 => external clk async, falling edgde
	--
	-- options = 02 => external clk sync, rising edgde
	-- options = 06 => external clk sync, falling edgde

	t_clk <= clk WHEN t0_options(1 DOWNTO 0) = "00"
	ELSe ext_clk WHEN t0_options(1 DOWNTO 0) = "01" AND t0_options(2) = '0'
	ELSE ext_clk WHEN t0_options(1 DOWNTO 0) = "01" AND t0_options(2) = '1'
	ELSE int_ext_clk WHEN t0_options(1 DOWNTO 0) = "10" AND t0_options(2) = '0'
	ELSE int_ext_clk WHEN t0_options(1 DOWNTO 0) = "10" AND t0_options(2) = '1'
	ELSE '0';
	
	
	rising_falling <= '1' WHEN t0_options(2) = '1' OR (t0_options(1 DOWNTO 0) = "00") ELSE '0';
	
	
	PROCESS(t_clk, rst, t0_options(4), add_bus, t0_count) 
		VARIABLE counter1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		if(rst = '1') then
			t0_out0 <= '0';
		elsif (add_bus = x"41") then
		  counter1 := t0_count;
		elsif (t0_options(4) = '1') then 
			if( rising_edge(t_clk) ) then
				if(counter1 = x"FF") then
					counter1 := t0_count;
					t0_out0 <= '1';
				else 
					counter1 := STD_LOGIC_VECTOR( UNSIGNED( counter1 ) + 1 );
					t0_out0 <= '0';
				end if;
			end if;
		end if;
	END PROCESS;
	
	
	PROCESS(t_clk, rst, t0_options(4), add_bus, t0_count)
		VARIABLE counter2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	BEGIN
		if(rst = '1') then
			t0_out1 <= '0';
		elsif (add_bus = x"41") then
		  counter2 := t0_count;
		elsif (t0_options(4) = '1') then 
			if( falling_edge(t_clk) ) then
				if(counter2 = x"FF") then
					counter2 := t0_count;
					t0_out1 <= '1';
				else 
					counter2 := STD_LOGIC_VECTOR( UNSIGNED( counter2 ) + 1 );
					t0_out1 <= '0';
				end if;
			end if;
		end if;
	END PROCESS;
	
	timer0_out <= t0_out0 WHEN rising_falling = '1' AND t0_options(4) = '1'
	ELSE t0_out1 WHEN rising_falling = '0' AND t0_options(4) = '1'
	ELSE '0';
END arch_timer0;