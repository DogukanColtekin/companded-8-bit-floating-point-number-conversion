library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenbitcountermain is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(6 downto 0)
    );
end sevenbitcountermain;

architecture structural of sevenbitcountermain is

    component sevencounter is
        Port (
            clk        : in  STD_LOGIC;
            reset      : in  STD_LOGIC;
            clk_enable : in  STD_LOGIC;
            Q          : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    component freqdivider is
        Port (
            boardclk     : in  STD_LOGIC;
            enablesignal : out STD_LOGIC
        );
    end component;

signal slowclock : STD_LOGIC;
signal Qsig : std_logic_vector(6 downto 0);

begin

U1: freqdivider port map(clk, slowclock);
U2: sevencounter port map(clk,reset,slowclock,Qsig);

Q <= Qsig;

end structural;