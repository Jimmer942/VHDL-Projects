library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk500Hz is
    Port (
        clk_1M: in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_500 : out STD_LOGIC
    );
end clk500Hz;

architecture Behavioral of clk500Hz is
    signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 49999 := 0;
begin
    divisor_frecuencia: process (reset, clk_1M) begin
        if (reset = '1') then
            temporal <= '0';
            contador <= 0;
        elsif rising_edge(clk_1M) then
            if (contador = 49999) then
                temporal <= NOT(temporal);
                contador <= 0;
            else
                contador <= contador+1;
            end if;
        end if;
    end process;
 
    clk_500 <= temporal;
end Behavioral;
