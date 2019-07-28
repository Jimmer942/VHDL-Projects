library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Keyboard is
Port ( 
       columnas : in std_logic_vector(3 downto 0);
       ck       : in std_logic;
       filas    : out std_logic_vector(3 downto 0);
       dato     : out std_logic_vector(3 downto 0);
       pulso    : out std_logic);
end Keyboard;

architecture Behavioral of Keyboard is

--declaraciópn de señales temporales
--cont: se utiliza para generar la secuencia 1, 2, 4, 8.
--dec_filas: decodificador de 2x4.
--dec_dato: circuito combinacional que muestra la tecla presionada
--c3, c2, c1, c0: flip flops que indican si una columna cn fue presionada
--pulsoT: señal temporal para el pulso de salida.

signal cont: std_logic_vector(1 downto 0); 
signal dec_filas: std_logic_vector(3 downto 0);
signal dec_dato: std_logic_vector(3 downto 0);
signal c3, c2, c1, c0: std_logic;
signal pulsoT: std_logic;
signal contador1: integer range 0 to 50 := 0;

begin
--Proceso para el contador cont.
Process(ck)
begin
     if (ck'event and ck='1') then
         cont<=cont+1;
     end if;
end process;

--proceso para generar el pulso que indica que se presiona una tecla
Process(ck)
begin
     if (ck'event and ck='1') then
          
  if (contador1 = 50) then
                  
          if (columnas="1000") then
               c3<='1';
               pulsoT <= '1';
          elsif(columnas="0100") then
               c2<='1';
               pulsoT <= '1';
          elsif(columnas="0010") then
               c1<='1';
               pulsoT <= '1';
          elsif (columnas="0001") then
               c0<='1';
               pulsoT <= '1';
          elsif(cont = "11" and(c3='1' or c2='1' or c1='1' or c0='1'))then
               c0<='0'; c1<='0'; c2<='0'; c3<='0';
          elsif(cont = "11" and c3='0' and c2='0' and c1='0' and c0='0')then
               pulsoT <= '0';
                end if;
          
 contador1 <= 0;
  else
   contador1 <= contador1+1;
  end if;
 end if;
end process;

--proceso para mostrar el dato por el puerto
process(ck)
begin
     if(ck'event and ck='0')then
 -- 

          if (pulsoT = '1' and columnas/="0000" and(c0='1' or c1='1' or c2='1' or c3='1'))    then
                     dato<=dec_dato;
         end if;
     end if;
end process;

--genera una secuencia de salida para las filas, utilizando el contador          cont
dec_filas <= "0001" when cont="00" else
         "0010" when cont="01" else
         "0100" when cont="10" else
         "1000" when cont="11" else
         "0000";
filas<= dec_filas;
pulso <= pulsoT;

--decodifica la tecla que estan presionando
--depende del dato que sale por filas y la entrada columnas

dec_dato <= "0000" when dec_filas="0001" and columnas="0100"  else --0
            "0001" when dec_filas="1000" and columnas="1000"  else --1
            "0010" when dec_filas="1000" and columnas="0100"  else --2
            "0011" when dec_filas="1000" and columnas="0010"  else --3
            "0100" when dec_filas="0100" and columnas="1000"  else --4
            "0101" when dec_filas="0100" and columnas="0100"  else --5
            "0110" when dec_filas="0100" and columnas="0010"  else --6
            "0111" when dec_filas="0010" and columnas="1000"  else --7
            "1000" when dec_filas="0010" and columnas="0100"  else --8
            "1001" when dec_filas="0010" and columnas="0010"  else --9
            "1010" when dec_filas="1000" and columnas="0001"  else --a
            "1011" when dec_filas="0100" and columnas="0001"  else --b
            "1100" when dec_filas="0010" and columnas="0001"  else --c
            "1101" when dec_filas="0001" and columnas="0001"  else --d
            "1110" when dec_filas="0001" and columnas="0010"  else --#
            "1111" when dec_filas="0001" and columnas="1000"  else --*
            "0000";--variable

         




end Behavioral;
