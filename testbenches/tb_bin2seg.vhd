-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 18.4.2024 12:21:43 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_bin2seg is
end tb_bin2seg;

architecture tb of tb_bin2seg is

    component bin2seg
        port (bin   : in std_logic_vector (3 downto 0);
              leds  : out std_logic_vector (15 downto 0);
              dalsi : in std_logic;
              prev  : in std_logic);
    end component;

    signal sig_bin   : std_logic_vector (3 downto 0);
    signal sig_leds  : std_logic_vector (15 downto 0);
    signal sig_dalsi : std_logic;
    signal sig_prev  : std_logic;

begin

    dut : bin2seg
    port map (bin   => sig_bin,
              leds  => sig_leds,
              dalsi => sig_dalsi,
              prev  => sig_prev);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_dalsi <= '0';
        sig_prev <= '0';

        -- Test case 1
    sig_bin <= x"0";
    wait for 50 ns;
    assert sig_leds = "1000000000000000";
        report "0 does not map 1000000000000000" severity error;
    
    -- Test case 2
    sig_bin <= x"1";
    wait for 50 ns;
    assert sig_leds = "1100000000000000";
        report "1 does not map 1100000000000000" severity error;
        
    -- Test case 3
    sig_bin <= x"2";
    wait for 50 ns;
    assert sig_leds = "1110000000000000";
        report "2 does not map 1110000000000000" severity error;
        
    -- Test case 4
    sig_bin <= x"3";
    wait for 50 ns;
    assert sig_leds = "1111000000000000";
        report "3 does not map 1111000000000000" severity error;
    
    -- Test case 5
    sig_bin <= x"4";
    wait for 50 ns;
    assert sig_leds = "1111100000000000";
        report "4 does not map 1111100000000000" severity error;
        
    -- Test case 6
    sig_bin <= x"5";
    wait for 50 ns;
    assert sig_leds = "1111110000000000";
        report "5 does not map 1111110000000000" severity error;
        
    -- Test case 7
    sig_bin <= x"6";
    wait for 50 ns;
    assert sig_leds = "1111111000000000";
        report "6 does not map 1111111000000000" severity error;
        
    -- Test case 8
    sig_bin <= x"7";
    wait for 50 ns;
    assert sig_leds = "1111111100000000";
        report "7 does not map 1111111100000000" severity error;
        
    -- Test case 9
    sig_bin <= x"8";
    wait for 50 ns;
    assert sig_leds = "1111111110000000";
        report "8 does not map 1111111110000000" severity error;
        
    -- Test case 10
    sig_bin <= x"9";
    wait for 50 ns;
    assert sig_leds = "1111111111000000";
        report "9 does not map 1111111111000000" severity error;
        
    -- Test case 11
    sig_bin <= x"A";
    wait for 50 ns;
    assert sig_leds = "1111111111100000";
        report "A does not map 1111111111100000" severity error; 
        
    -- Test case 12
    sig_bin <= x"B";
    wait for 50 ns;
    assert sig_leds = "1111111111110000";
        report "B does not map 1111111111110000" severity error;
        
    -- Test case 13
    sig_bin <= x"C";
    wait for 50 ns;
    assert sig_leds = "1111111111111000";
        report "C does not map 1111111111111000" severity error; 
        
    -- Test case 14
    sig_bin <= x"D";
    wait for 50 ns;
    assert sig_leds = "1111111111111100";
        report "D does not map 1111111111111100" severity error; 
        
    -- Test case 15
    sig_bin <= x"E";
    wait for 50 ns;
    assert sig_leds = "1111111111111110";
        report "E does not map 1111111111111110" severity error; 
    
    sig_dalsi <= '1';
    wait for 50ns;
    assert sig_leds = "0000000000000000";
        report "leds aren't cleared" severity error;  
    sig_dalsi <= '0';
        
    -- Test case 16
    sig_bin <= x"F";
    wait for 50 ns;
    assert sig_leds = "1111111111111111";
        report "F does not map 1111111111111111" severity error;
        
    sig_prev <= '1';
    wait for 50ns;
    assert sig_leds = "0000000000000000";
        report "leds aren't cleared" severity error;
    sig_prev <= '0'; 

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_bin2seg of tb_bin2seg is
    for tb
    end for;
end cfg_tb_bin2seg;
