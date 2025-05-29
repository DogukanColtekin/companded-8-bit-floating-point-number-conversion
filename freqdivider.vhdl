library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity freqdivider is
    Port (
        boardclk     : in  STD_LOGIC;
        enablesignal : out STD_LOGIC
    );
end freqdivider;

architecture dataflow of freqdivider is
    signal counter : unsigned(24 downto 0) := (others => '0');
    signal pulse   : STD_LOGIC := '0';
begin

    process(boardclk)
    begin
        if rising_edge(boardclk) then
            if counter = 24999999 then
                counter <= (others => '0');
                pulse   <= '1'; 
            else
                counter <= counter + 1;
                pulse   <= '0'; 
            end if;
        end if;
    end process;

    enablesignal <= pulse;

end dataflow;