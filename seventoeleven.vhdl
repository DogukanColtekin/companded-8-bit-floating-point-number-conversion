library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity seventoeleven is
    Port (
        Q : in STD_LOGIC_VECTOR(6 downto 0);
        binarybits : out STD_LOGIC_VECTOR(10 downto 0)
    );
end seventoeleven;



architecture structural of seventoeleven is

component mymultiply is
port(
m : in STD_LOGIC_VECTOR(3 downto 0);
expresult : in STD_LOGIC_VECTOR(7 downto 0);
mult : out STD_LOGIC_VECTOR(10 downto 0));
end component;


component exponentoperator is
port ( e: in std_logic_vector (2 downto 0);
 expresult: out std_logic_vector ( 7 downto 0) );
end component;


    signal Esig : STD_LOGIC_VECTOR(2 downto 0);
    signal Msig : STD_LOGIC_VECTOR(3 downto 0);
    signal expresultsig : STD_LOGIC_VECTOR(7 downto 0);
    signal multsig : STD_LOGIC_VECTOR(10 downto 0);
	 
begin
    Esig <= std_logic_vector(Q(6 downto 4));
    Msig <= std_logic_vector(Q(3 downto 0));
	 
U1 : exponentoperator port map(Esig,expresultsig);
U2 : mymultiply port map (Msig,expresultsig,multsig);

binarybits <= multsig;

end structural;