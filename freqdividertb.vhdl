library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freqdivider_tb is
end freqdivider_tb;

architecture behavior of freqdivider_tb is

    -- Component Declaration
    component freqdivider
        Port (
            boardclk     : in  STD_LOGIC;
            enablesignal : out STD_LOGIC
        );
    end component;

    -- Testbench signals
    signal boardclk     : STD_LOGIC := '0';
    signal enablesignal : STD_LOGIC;

    -- Clock period constant
    constant clk_period : time := 10 ns;  -- 100 MHz clock

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: freqdivider
        Port map (
            boardclk     => boardclk,
            enablesignal => enablesignal
        );

    -- Clock generation process
    clk_process : process
    begin
        while now < 1 sec loop  -- Simulate for 1 second
            boardclk <= '0';
            wait for clk_period / 2;
            boardclk <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Monitor process (optional debug output)
    monitor_proc: process
    begin
        wait until enablesignal'event;
        report "Time: " & time'image(now) & 
               " | enablesignal changed to: " & std_logic'image(enablesignal);
    end process;

end behavior;