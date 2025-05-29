library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity exponentoperator is
port ( e: in std_logic_vector (2 downto 0);
 expresult: out std_logic_vector ( 7 downto 0) );
end exponentoperator;

architecture dataflow of exponentoperator is
begin
with e select
expresult <="00000001" when "000",
"00000010" when "001",
"00000100" when "010",
"00001000" when "011",
"00010000" when "100",
"00100000" when "101",
"01000000" when "110",
"10000000" when "111";
end dataflow;