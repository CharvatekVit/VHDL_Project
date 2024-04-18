library ieee;
use ieee.std_logic_1164.all;

entity tb_pausePlay is
end tb_pausePlay;

architecture tb of tb_pausePlay is

    component pausePlay
        port (clk    : in std_logic;
              enable : in std_logic;
              output : out std_logic);
    end component;

    signal clk    : std_logic;
    signal enable : std_logic;
    signal output : std_logic;

    constant TbPeriod : time := 10 ns;
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : pausePlay
    port map (clk    => clk,
              enable => enable,
              output => output);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    clk <= TbClock;

    stimuli : process
    begin
        enable <= '0';

        -- EDIT Add stimuli here
        wait for 10 * TbPeriod;
        enable <= '1';
        
        wait for 10 * TbPeriod;
        enable <= '0';

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_pausePlay of tb_pausePlay is
    for tb
    end for;
end cfg_tb_pausePlay;
