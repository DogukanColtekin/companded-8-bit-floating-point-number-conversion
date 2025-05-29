library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sevencounter is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        clk_enable : in  STD_LOGIC;
        Q          : out STD_LOGIC_VECTOR(6 downto 0)
    );    
end sevencounter;

architecture dataflow of sevencounter is
    signal count : unsigned(6 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
		  
            if reset = '1' then
                count <= (others => '0');
        
				elsif clk_enable = '1' then
                count <= count + 1;
            end if;
        end if;
    end process;

    Q <= std_logic_vector(count);

end dataflow;