library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
	PORT(
		clk          : IN  STD_LOGIC;
		reset        : IN  STD_LOGIC;
		salida       : OUT STD_LOGIC_VECTOR(7 downto 0);
		MUX          : OUT STD_LOGIC_VECTOR(3 downto 0);
		filas        : out std_logic_vector (3 downto 0);
        columnas     : in std_logic_vector  (3 downto 0);
        pulso        : inout std_logic
	);
end Main;

architecture Behavioral of Main is

COMPONENT siete_segmentos_completo is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        D0    : IN  STD_LOGIC_VECTOR(5 downto 0);
        D1    : IN  STD_LOGIC_VECTOR(5 downto 0);
        D2    : IN  STD_LOGIC_VECTOR(5 downto 0);
        D3    : IN  STD_LOGIC_VECTOR(5 downto 0);
        salida: OUT STD_LOGIC_VECTOR(7 downto 0);
        MUX   : OUT STD_LOGIC_VECTOR(3 downto 0)
    );
end COMPONENT;

COMPONENT Vending_machine is
	PORT(
		reset    : IN  STD_LOGIC;
		pulso2    : IN  STD_LOGIC;
		selector : IN  STD_LOGIC_VECTOR(3 downto 0);
		product  : OUT STD_LOGIC_VECTOR(3 downto 0);
		coins    : OUT STD_LOGIC_VECTOR(3 downto 0);
		unit     : OUT STD_LOGIC_VECTOR(4 downto 0);
		tens     : OUT STD_LOGIC_VECTOR(4 downto 0)
	);
end COMPONENT;

component clk500Hz is
    Port (
        clk     : in  STD_LOGIC;
        reset   : in std_logic;
        clk_500 : out std_logic
       
    );
end component;





component Keyboard is
Port ( columnas : in std_logic_vector(3 downto 0);
       ck       : in std_logic;
       filas    : out std_logic_vector(3 downto 0);
       dato     : out std_logic_vector(3 downto 0);
       pulso    : out std_logic);
end component;

signal unit,tens      : STD_LOGIC_VECTOR(4 downto 0);
signal product, coins : STD_LOGIC_VECTOR(3 downto 0);
signal pHH1, pHH0, pMM1, pMM0: STD_LOGIC_VECTOR(5 downto 0);
signal clk_500 :  std_logic;
signal control :  std_logic_vector(3 downto 0);


begin

seg_i: siete_segmentos_completo PORT MAP(
            clk => clk, 
            reset => reset, 
            D0 => pMM0, 
            D1 => pMM1, 
            D2 => pHH0, 
            D3 => pHH1, 
            salida => salida, 
            MUX => MUX);

machine: Vending_machine PORT MAP(
	       reset => reset,
	       pulso2 => pulso, 
	       selector => control, 
	       coins => coins,
	       product => product,
	       unit => unit, 
	       tens => tens
	       );
 Divisor_teclado: clk500Hz PORT MAP(
		clk => clk,
		reset => reset,
		clk_500 => clk_500
	);

  
	Teclado: Keyboard PORT MAP(
           columnas => columnas,
           ck => clk_500,
           filas => filas,
           dato => control,
           pulso => pulso
    );
	
--Padding de las señales del contador para siete segmentos.
	pHH1 <= "00" &coins;
	pHH0 <= "00" &product;
	pMM1 <= "0" &tens;
	pMM0 <= "0" &unit;
end Behavioral;