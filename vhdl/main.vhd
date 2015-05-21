library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity micro_controller is
port( clk, rst, en, rw, ext_clk : in STD_LOGIC;
	address_bus : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_bus, io_pins : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	globalInt : OUT STD_LOGIC
	);

end micro_controller;

architecture main of micro_controller is
	
	component tsb is	
		generic ( n : integer := 8);
 	   	port ( E : in  STD_LOGIC;
            	Input : in STD_LOGIC_VECTOR (n-1 downto 0);
            	Output : out STD_LOGIC_VECTOR (n-1 downto 0));
	end component;
	
	component ndff is
		generic ( n : integer := 8);
		port ( Clk, Rst, E : in STD_LOGIC;
				d : in STD_LOGIC_VECTOR(n-1 downto 0);
			  	output : out STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
	
	component mux2 is
		generic ( n : integer := 8 );
		port ( a, b : in STD_LOGIC_VECTOR(n-1 downto 0);
				s0 : in STD_LOGIC;
			  	x :  out STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
	
	component mux4 is
  		generic ( n : integer := 8 );
		port ( a, b, c, d : in STD_LOGIC_VECTOR(n-1 downto 0);
	       		s0, s1 : in STD_LOGIC;
			   	y	: out STD_LOGIC_VECTOR(n-1 downto 0));
  	end component;
 
	component gpio is
	generic ( n : integer := 8);
     port ( E, clk, RW, rst, t0, t1, pwm : in  STD_LOGIC; 
            addressBus : in  STD_LOGIC_VECTOR (n-1 downto 0);
            dataBus, IOPINS : inout STD_LOGIC_VECTOR (n-1 downto 0));
  end component;
 
	component pwm is
	  	GENERIC (n : integer := 8);
		 PORT( clk, rst, en, rd_wr  : IN STD_LOGIC;
			add_bus: IN STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			data_bus: INOUT STD_LOGIC_VECTOR(n-1 DOWNTO 0);
			pwm_out: OUT STD_LOGIC );
	end component;
	
	component timer0 is 
		PORT( clk, rst, en, rd_wr, ext_clk  : IN STD_LOGIC;
			add_bus: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_bus: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			timer0_out: OUT STD_LOGIC);
	END component;

	component timer1 is
		PORT( clk, rst, en, rd_wr  : IN STD_LOGIC;
			add_bus: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			data_bus: INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			timer1_out: OUT STD_LOGIC);
	end component;
	
component iEnableRegister is
	generic ( n : integer := 8);
     port ( E, Clk, Rst, t0, t1, rd_wr : in  STD_LOGIC; 
            addressBus : in  STD_LOGIC_VECTOR (n-1 downto 0);
            dataBus : inout STD_LOGIC_VECTOR (n-1 downto 0);
            globalInt : out STD_LOGIC);
end component;

  -- Wires
  signal t0_out, t1_out, pwm_out: STD_LOGIC;

begin

	-- Mapping to timer 0
	c5: timer0 PORT MAP(clk, rst, en, rw, ext_clk, address_bus, data_bus, t0_out);

	-- Mapping to timer 1
	c6: timer1 PORT MAP(clk, rst, en, rw, address_bus, data_bus, t1_out);

	-- Mapping to Interrupt Enable Register
	c10: iEnableRegister generic map (8) port map (en, clk, rst, t0_out, t1_out, rw, address_bus, data_bus, globalInt);

	-- Mapping to PMW
	c7: pwm generic map (8) port map (clk, rst, en, rw, address_bus, data_bus, pwm_out);

	-- Mapping to gpio unit.
	c9: gpio port map (en, clk, rw, rst, t0_out, t1_out, pwm_out, address_bus, data_bus, io_pins);
end main;