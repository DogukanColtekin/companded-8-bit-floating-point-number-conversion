library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_sevenbitcountermain is
-- No ports for a testbench
end tb_sevenbitcountermain;

architecture behavior of tb_sevenbitcountermain is

    -- Component Under Test
    component sevenbitcountermain is
        Port (
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            Q      : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    -- Signals to connect to the DUT
    signal clk_tb    : STD_LOGIC := '0';
    signal reset_tb  : STD_LOGIC := '0';
    signal Q_tb      : STD_LOGIC_VECTOR(6 downto 0);

    constant CLK_PERIOD : time := 10 ns;  -- 100 MHz

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: sevenbitcountermain
        port map (
            clk   => clk_tb,
            reset => reset_tb,
            Q     => Q_tb
        );

    -- Clock generation process
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initialize and hold reset
        reset_tb <= '1';
        wait for 100 ns;
        reset_tb <= '0';

        -- Let the simulation run
        wait for 2 ms;

        -- End simulation
        wait;
    end process;

end behavior;