library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity gpio
-- Represents a general purpose input/output port
-- E: enable bit
-- Clk: System clock
-- R_W: read/write enable
-- Rst: reset
-- t0/t1/pwm: timer0/timer1/PWM
-- 
entity gpio is
	generic ( n : integer := 8);
     port ( E, clk, RW, rst, t0, t1, pwm : in  STD_LOGIC; 
            addressBus : in  STD_LOGIC_VECTOR (n-1 downto 0);
            dataBus, IOPINS : inout STD_LOGIC_VECTOR (n-1 downto 0));
end gpio;

-- Architecture: gpio_arch
-- Describes the functionality of the GPIO
architecture gpio_arch of gpio is
  
  -- n-bits generic register
  component ndff is  
    generic ( n : integer := 8);
        port( Clk, Rst, E : in STD_LOGIC;
              d : in STD_LOGIC_VECTOR(n-1 downto 0);
              output : out STD_LOGIC_VECTOR(n-1 downto 0));
  end component ndff;
  
  -- 1-bit register
  COMPONENT dff_bit IS
  
    PORT( d,clk,rst,E : IN STD_LOGIC;
    output : OUT STD_LOGIC);

  END COMPONENT;
  
  
  COMPONENT mux2_bit IS
   PORT (a, b : in STD_LOGIC;
	   s0 : IN STD_LOGIC ; 
    	x :  OUT STD_LOGIC);    
  END COMPONENT;
  
  COMPONENT tsb_bit IS
	
    PORT ( E   : IN  STD_LOGIC; 
         Input  : IN  STD_LOGIC;
         Output : OUT STD_LOGIC);
  END COMPONENT;
  
  
  
  
  signal configOut, fromBus, wrBusEn, wrPinsEn, dataOut, pinsOut : STD_LOGIC_VECTOR(n-1 downto 0);
  signal dataEN, contEN, dataOutEn, dataOrModEn, invRW : STD_LOGIC;
  signal dataOrMod : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin	
  
  -- RW = 0 then read from databus(data/config/multiplex)
  -- RW = 1 then read from IO/PINS
  
  -- 1 Register for holding direction for each pin
  -- 1 Register for holding selection lines
  -- 1 Register for holding data from databus
  -- 1 Register for golding data from iopins
  
  
  -- Check if data/control/neither    
  dataEn <= (E AND RW) WHEN addressBus = x"64" -- address x64
  ELSE '0';
  
  contEn <= (E AND RW) WHEN addressBus = x"65" -- address x65
  ELSE '0' ;
    
  dataOrModEn <= (E AND RW) WHEN addressBus = x"66"
  ELSE '0';
   
    
  -- Configuration register(from Right to Left):
  -- Direction of pins (1 bit for each).
  configReg: ndff GENERIC MAP(8) PORT MAP(clk, rst, contEn, dataBus, configOut);
  data_modu: ndff GENERIC MAP(3) PORT MAP(clk, rst, dataOrModEn, dataBus(2 DOWNTO 0), dataOrMod);
    
  
  
  -- multiplexing modules output with databus output
  dataReg0: ndff GENERIC MAP(8) PORT MAP(clk, rst, dataEn, dataBus, dataOut);
  mod0OrBus: mux2_bit PORT MAP(dataOut(0), t0, dataOrMod(0), fromBus(0));
  mod1OrBus: mux2_bit PORT MAP(dataOut(1), t1, dataOrMod(1), fromBus(1));
  mod2OrBus: mux2_bit PORT MAP(dataOut(2), pwm, dataOrMod(2), fromBus(2));
  fromBus(7 DOWNTO 3) <= dataOut(7 DOWNTO 3);
  
  -- Writing To Pins
  
    
  wrPinsEn(0) <= (NOT ConfigOut(0)) AND E;
  wrPinsEn(1) <= (NOT ConfigOut(1)) AND E;
  wrPinsEn(2) <= (NOT ConfigOut(2)) AND E;
  wrPinsEn(3) <= (NOT ConfigOut(3)) AND E;
  wrPinsEn(4) <= (NOT ConfigOut(4)) AND E;
  wrPinsEn(5) <= (NOT ConfigOut(5)) AND E;
  wrPinsEn(6) <= (NOT ConfigOut(6)) AND E;
  wrPinsEn(7) <= (NOT ConfigOut(7)) AND E;
  
  dataTsb0: tsb_bit PORT MAP(wrPinsEn(0), fromBus(0), IOPINS(0));
  dataTsb1: tsb_bit PORT MAP(wrPinsEn(1), fromBus(1), IOPINS(1));
  dataTsb2: tsb_bit PORT MAP(wrPinsEn(2), fromBus(2), IOPINS(2));
  dataTsb3: tsb_bit PORT MAP(wrPinsEn(3), fromBus(3), IOPINS(3));
  dataTsb4: tsb_bit PORT MAP(wrPinsEn(4), fromBus(4), IOPINS(4));
  dataTsb5: tsb_bit PORT MAP(wrPinsEn(5), fromBus(5), IOPINS(5));
  dataTsb6: tsb_bit PORT MAP(wrPinsEn(6), fromBus(6), IOPINS(6));
  dataTsb7: tsb_bit PORT MAP(wrPinsEn(7), fromBus(7), IOPINS(7));
       
  -- Writing to databus
  
  
  dataOutEn <= E AND (NOT RW) WHEN addressBus = x"67"
  ELSE '0' ;
  pinsReg: ndff GENERIC MAP(8) PORT MAP(Clk, Rst, dataOutEn, IOPINS, pinsOut);

  wrBusEn(0) <= ConfigOut(0) AND dataOutEn;
  wrBusEn(1) <= ConfigOut(1) AND dataOutEn;
  wrBusEn(2) <= ConfigOut(2) AND dataOutEn;
  wrBusEn(3) <= ConfigOut(3) AND dataOutEn;
  wrBusEn(4) <= ConfigOut(4) AND dataOutEn;
  wrBusEn(5) <= ConfigOut(5) AND dataOutEn;
  wrBusEn(6) <= ConfigOut(6) AND dataOutEn;
  wrBusEn(7) <= ConfigOut(7) AND dataOutEn;
  
  
  dataTsbPin0: tsb_bit PORT MAP(wrBusEn(0),pinsOut(0), dataBus(0));
  dataTsbPin1: tsb_bit PORT MAP(wrBusEn(1),pinsOut(1), dataBus(1));
  dataTsbPin2: tsb_bit PORT MAP(wrBusEn(2),pinsOut(2), dataBus(2));
  dataTsbPin3: tsb_bit PORT MAP(wrBusEn(3),pinsOut(3), dataBus(3));
  dataTsbPin4: tsb_bit PORT MAP(wrBusEn(4),pinsOut(4), dataBus(4));
  dataTsbPin5: tsb_bit PORT MAP(wrBusEn(5),pinsOut(5), dataBus(5));
  dataTsbPin6: tsb_bit PORT MAP(wrBusEn(6),pinsOut(6), dataBus(6));
  dataTsbPin7: tsb_bit PORT MAP(wrBusEn(7),pinsOut(7), dataBus(7));
END gpio_arch;


