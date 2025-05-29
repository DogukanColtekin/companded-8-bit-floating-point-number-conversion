library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mymultiply is
port(
m : in STD_LOGIC_VECTOR(3 downto 0);
expresult : in STD_LOGIC_VECTOR(7 downto 0);
mult : out STD_LOGIC_VECTOR(10 downto 0));
 
end mymultiply;

architecture dataflow of mymultiply is

signal intermediate : unsigned(11 downto 0);

begin

intermediate <= unsigned(m) * unsigned(expresult);

mult <= std_logic_vector(intermediate(10 downto 0));

end dataflow;