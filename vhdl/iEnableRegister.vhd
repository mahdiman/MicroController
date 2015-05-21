library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Interrupt Enable Register
-- Represents a general purpose input/output port
-- E: enable bit
-- Clk: System clock
-- R_W: read/write enable 1 read, 0 write
-- Rst: reset
-- t0/t1: timer0/timer1

entity iEnableRegister is
	generic ( n : integer := 8);
     port ( E, Clk, Rst, t0, t1, rd_wr : in  STD_LOGIC; 
            addressBus : in  STD_LOGIC_VECTOR (n-1 downto 0);
            dataBus : inout STD_LOGIC_VECTOR (n-1 downto 0);
            globalInt : out STD_LOGIC);
end iEnableRegister;

-- Architecture: iEnableRegister_arch
-- Describes the functionality of the Interrupt Enable Register
architecture iEnableRegister_arch of iEnableRegister is

  -- tristate buffer component
  component tsb is
  	generic ( n : integer := 8);
       port ( E : in  STD_LOGIC; 
              Input  : in  STD_LOGIC_VECTOR (n-1 downto 0);
              Output : out STD_LOGIC_VECTOR (n-1 downto 0));
  end component tsb;
  

  -- n-bits generic register
  component ndff is  
    generic ( n : integer := 8);
        port( Clk, Rst, E : in STD_LOGIC;
              d : in STD_LOGIC_VECTOR(n-1 downto 0);
              output : out STD_LOGIC_VECTOR(n-1 downto 0));
  end component ndff;
  
  signal dataIn : STD_LOGIC_VECTOR(7 downto 0);
  signal t0_out, t1_out, data_rd, data_wr : STD_LOGIC;

begin	
	-- Interrupt Enable Register format (LSB ---> MSB)
	-- bit #0 Timer 0.
	-- bit #1 Timer 1.
	
  -- Check if data read.  
  data_rd <= E WHEN rd_wr = '1' AND addressBus = x"30" ELSE '0';
  data_wr <= E WHEN rd_wr = '0' AND addressBus = x"30" ELSE '0';
  
  -- register holding input
  in_reg : ndff generic map(n) port map(Clk, Rst, data_rd, dataBus, dataIn);
  dataout: tsb generic map(n) port map(data_wr, dataIn, dataBus);
  -- Masking enable bits
  t0_out <= dataIn(0) AND t0;
  t1_out <= dataIn(1) AND t1;
  globalInt <=  t0_out AND t1_out;

end iEnableRegister_arch;