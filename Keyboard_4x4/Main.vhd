library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Main is
  Port (
      clk_1M       : in  STD_LOGIC;--
      reset        : in  STD_LOGIC;--
      anodo  : out std_logic_vector (3 downto 0);
      filas        : out std_logic_vector (3 downto 0);--
      columnas     : in std_logic_vector  (3 downto 0);--
      led    : out std_logic_vector (7 downto 0);
      pulso    : out std_logic
  );
end Main;

architecture Behavioral of Main is



component clk_500HZ is
    Port (
        clk_1M: in  STD_LOGIC;
        reset  : in std_logic;
        clk_500 : out std_logic
       
    );
end component;


component Keyboard is
Port ( columnas : in std_logic_vector(3 downto 0);
       ck : in std_logic;
       filas : out std_logic_vector(3 downto 0);
       dato : out std_logic_vector(3 downto 0);
       pulso : out std_logic);
end component;

COMPONENT Dec
		PORT(
		control : IN std_logic_vector(3 downto 0);          
		anodo : OUT std_logic_vector(3 downto 0);
		led : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

signal clk_500 :  std_logic;
signal control :  std_logic_vector(3 downto 0); 



begin




	Divisor_teclado: clk_500Hz PORT MAP(
		clk_1M => clk_1M,
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
     
  Seg_Teclado : Dec PORT MAP(
             anodo => anodo,
             led => led,
             control => control
         ); 
                
end Behavioral;
