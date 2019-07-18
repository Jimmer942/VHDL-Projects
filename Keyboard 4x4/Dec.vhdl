library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec is
port(  anodo  : out std_logic_vector (3 downto 0);
       led    : out std_logic_vector (7 downto 0);
	   control: in std_logic_vector (3 downto 0)
		);
end Dec;

architecture Behavioral of Dec is

begin


 anodo <= "1110";
process (control)
begin
	case  control is

 when "0000" => led <= "01000000" ; --0
 when "0001" => led <= "01111001" ; --1
 when "0010" => led <= "00100100"; --2
 when "0011" => led <= "00110000"; --3
 when "0100" => led <= "00011001"; --4
 when "0101" => led <= "00010010" ;--5
 when "0110" => led <= "00000010" ;--6
 when "0111" => led <= "01111000";--7
 when "1000" => led <= "00000000";--8
 when "1001" => led <= "00010000" ; --9
 when "1010" => led <= "00001000" ; --a
 when "1011" => led <= "00000011" ; --b
 when "1100" => led <= "01000110" ; --c
 when "1101" => led <= "00100001" ; --d
 when "1110" => led <= "00001001" ; --#
 when "1111" => led <= "00101010" ; --*
 when others => led <= "00000" ;--validar
end case;
end process;


end Behavioral;
