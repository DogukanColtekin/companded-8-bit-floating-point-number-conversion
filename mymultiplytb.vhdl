library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mymultiply is
end tb_mymultiply;

architecture behavior of tb_mymultiply is

    -- Component Declaration for the Unit Under Test (UUT)
    component mymultiply
        port (
            m         : in  std_logic_vector(3 downto 0);
            expresult : in  std_logic_vector(7 downto 0);
            mult      : out std_logic_vector(10 downto 0)
        );
    end component;

    -- Testbench signals
    signal m_tb         : std_logic_vector(3 downto 0) := (others => '0');
    signal expresult_tb : std_logic_vector(7 downto 0) := (others => '0');
    signal mult_tb      : std_logic_vector(10 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: mymultiply
        port map (
            m         => m_tb,
            expresult => expresult_tb,
            mult      => mult_tb
        );

    -- Stimulus process
    stim_proc: process
        type t_power_array is array (0 to 7) of integer;
        constant powers_of_2 : t_power_array := (1, 2, 4, 8, 16, 32, 64, 128);
    begin
        for i in 0 to 15 loop  -- m from 0 to 15
            m_tb <= std_logic_vector(to_unsigned(i, 4));
            for j in 0 to 7 loop  -- powers of 2 for expresult
                expresult_tb <= std_logic_vector(to_unsigned(powers_of_2(j), 8));
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;

end behavior;