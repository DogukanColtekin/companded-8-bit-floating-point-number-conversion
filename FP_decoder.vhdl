library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FP_decoder is
  Port ( MY_CLK : in STD_LOGIC;
           SSEG_CA : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN : out  STD_LOGIC_VECTOR (3 downto 0));
end FP_decoder;

architecture structural of FP_decoder is

component sevenbitcountermain is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        Q      : out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

component seventoeleven is
    Port ( Q : in STD_LOGIC_VECTOR(6 downto 0);
           binarybits : out STD_LOGIC_VECTOR(10 downto 0));
end component;

component elevenbittobcd is
    Port ( mult : in STD_LOGIC_VECTOR(10 downto 0);
           bcdbits : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component BCD_to_seven_segment is
port ( d: in std_logic_vector (3 downto 0);
 s: out std_logic_vector ( 7 downto 0) );
end component;

component nexys3_sseg_driver is
    Port ( MY_CLK : in  STD_LOGIC;
           DIGIT0 : in  STD_LOGIC_VECTOR (7 downto 0);
           DIGIT1 : in  STD_LOGIC_VECTOR (7 downto 0);
           DIGIT2 : in  STD_LOGIC_VECTOR (7 downto 0);
           DIGIT3 : in  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_CA : out  STD_LOGIC_VECTOR (7 downto 0);
           SSEG_AN : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal resetsig : std_logic;
signal Qsig : STD_LOGIC_VECTOR(6 downto 0);
signal binarybitssig : STD_LOGIC_VECTOR(10 downto 0);
signal bcdbitssig : STD_LOGIC_VECTOR(15 downto 0);

signal sevenseg0 : STD_LOGIC_VECTOR(3 downto 0);
signal sevenseg1 : STD_LOGIC_VECTOR(3 downto 0);
signal sevenseg2 : STD_LOGIC_VECTOR(3 downto 0);
signal sevenseg3 : STD_LOGIC_VECTOR(3 downto 0);

signal digit0 : STD_LOGIC_VECTOR(7 downto 0);
signal digit1 : STD_LOGIC_VECTOR(7 downto 0);
signal digit2 : STD_LOGIC_VECTOR(7 downto 0);
signal digit3 : STD_LOGIC_VECTOR(7 downto 0);


signal  CA_adli_output :  STD_LOGIC_VECTOR (7 downto 0);
signal  AN_adli_output :  STD_LOGIC_VECTOR (3 downto 0);



begin

resetsig <= '0';
	
sevenseg0 <= bcdbitssig(3 downto 0);
sevenseg1 <= bcdbitssig(7 downto 4);
sevenseg2 <= bcdbitssig(11 downto 8);
sevenseg3 <= bcdbitssig(15 downto 12);
	


U1: sevenbitcountermain port map(MY_CLK,resetsig,Qsig);
U2: seventoeleven port map (Qsig,binarybitssig);
U3: elevenbittobcd port map (binarybitssig,bcdbitssig);
U4: BCD_to_seven_segment port map(sevenseg0,digit0);
U5: BCD_to_seven_segment port map(sevenseg1,digit1);
U6: BCD_to_seven_segment port map(sevenseg2,digit2);
U7: BCD_to_seven_segment port map(sevenseg3,digit3);
U8: nexys3_sseg_driver port map (MY_CLK,digit3,digit2,digit1,digit0,CA_adli_output,AN_adli_output);

SSEG_CA <= CA_adli_output;
SSEG_AN <= AN_adli_output;


end structural;

