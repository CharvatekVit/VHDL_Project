-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 18.4.2024 11:51:07 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_simple_counter is
end tb_simple_counter;

architecture tb of tb_simple_counter is

    component simple_counter
        Generic ( N : integer := 4);
        port (clk   : in std_logic;
              dalsi : in std_logic;
              prev  : in std_logic;
              back  : in std_logic;
              forw  : in std_logic;
              en    : in std_logic;
              count : out std_logic_vector (n-1 downto 0));
    end component;

    constant COUNTER_WIDTH : integer := 6;
    
    signal sig_clk   : std_logic;
    signal sig_dalsi : std_logic;
    signal sig_prev  : std_logic;
    signal sig_back  : std_logic;
    signal sig_forw  : std_logic;
    signal sig_en    : std_logic;
    signal sig_count : std_logic_vector (COUNTER_WIDTH-1 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : simple_counter
    generic map ( N => COUNTER_WIDTH )
    port map (clk   => sig_clk,
              dalsi => sig_dalsi,
              prev  => sig_prev,
              back  => sig_back,
              forw  => sig_forw,
              en    => sig_en,
              count => sig_count);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  EDIT: Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    sig_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_dalsi <= '0';
        sig_prev <= '0';
        sig_back <= '0';
        sig_forw <= '0';
        sig_en <= '0';

        -- Testing if prev and dalsi resets the counter
        sig_dalsi <= '1';
        wait for 100 ns;
        sig_dalsi <= '0';
        wait for 100 ns;
        sig_prev <= '1';
        wait for 100 ns;
        sig_prev <= '0';
        wait for 100 ns;
        sig_en <= '1';
        wait for 100 ns;
        

        -- Testing if back decreases counter by 4
        --     and if forw increases counter by 4
        sig_back <= '1';
        wait for 10 ns;
        sig_back <= '0';
        wait for 100 ns;
        sig_forw <= '1';
        wait for 10 ns;
        sig_forw <= '0'; 

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_simple_counter of tb_simple_counter is
    for tb
    end for;
end cfg_tb_simple_counter;
