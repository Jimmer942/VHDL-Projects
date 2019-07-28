library IEEE;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_1164.ALL;

entity Vending_machine is
	PORT(
	    clk      : IN  STD_LOGIC; 
		reset    : IN  STD_LOGIC;
		pulso2   : IN  STD_LOGIC;
		selector : IN STD_LOGIC_VECTOR(3 downto 0);
		product  : OUT STD_LOGIC_VECTOR(3 downto 0);
		coins    : OUT STD_LOGIC_VECTOR(3 downto 0);
		unit     : OUT STD_LOGIC_VECTOR(4 downto 0);
		tens     : OUT STD_LOGIC_VECTOR(4 downto 0)
	);
end Vending_machine;

architecture Behavioral of Vending_machine is

	signal dproduct : UNSIGNED(3 downto 0);
	signal dcoin    : UNSIGNED(3 downto 0);
	signal un       : UNSIGNED(4 downto 0);
	signal dcount    : UNSIGNED(4 downto 0):= "00000";
	signal count    : UNSIGNED(4 downto 0);
	signal dec      : UNSIGNED(4 downto 0);
	signal entrega : UNSIGNED(3 downto 0);

begin

process(pulso2)
begin
if reset = '1' then
                  count<="00000"; 
                  dec <= count / 10;
                  un <= count mod 10;
    elsif (pulso2'event and pulso2='0') then
                     count<=dcount; 
                  dec <= count / 10;
                  un <= count mod 10;                 
     end if;
end process;

dcount    <= count + 1 when selector ="0100"  else --0
             count + 3 when selector ="0101"  else --d
             count + 5 when selector ="0110"  else --#
             count - 2 when selector ="0001"  else --0
             count - 5 when selector ="0010"  else --d
             count - 7 when selector ="0011"  else --#
             count;--variable
            



dcoin    <= "0001" when selector ="0100"  else --0
            "0011" when selector ="0101"  else --d
            "0101" when selector ="0110"  else --#
            "0000";--variable
            
dproduct <= "0001" when selector ="0001"  else --0
            "0010" when selector ="0010"  else --d
            "0011" when selector ="0011"  else --#
            "0000";--variable



	--Asignación de señales.
	tens <= STD_LOGIC_VECTOR(dec);
	unit <= STD_LOGIC_VECTOR(un);
	coins <= STD_LOGIC_VECTOR(dcoin);
	product <= STD_LOGIC_VECTOR(dproduct);
end Behavioral;