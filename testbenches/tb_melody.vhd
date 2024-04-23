library ieee;
use ieee.std_logic_1164.all;

entity tb_melody is
end tb_melody;

architecture tb of tb_melody is

    component melody
        Port (bin         : in std_logic_vector (3 downto 0);
              rele        : out std_logic_vector (4 downto 1);
              dalsi       : in std_logic;
              prev        : in std_logic;
              akt_melody  : out std_logic_vector(1 downto 0);
              clk         : in std_logic);
    end component;

    signal sig_bin          : std_logic_vector (3 downto 0);
    signal sig_rele         : std_logic_vector (4 downto 1);
    signal sig_dalsi        : std_logic;
    signal sig_prev         : std_logic;
    signal sig_akt_melody   : std_logic_vector(1 downto 0);
    signal sig_clk          : std_logic;

    constant TbPeriod       : time := 10 ns;
    signal TbClock          : std_logic := '0';
    signal TbSimEnded       : std_logic := '0';

begin

    dut : melody
    port map   (bin         => sig_bin,
                rele        => sig_rele,
                dalsi       => sig_dalsi,
                prev        => sig_prev,
                akt_melody  => sig_akt_melody,
                --pred_melody => sig_pred_melody,
                clk         => sig_clk);

    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    sig_clk <= TbClock;

    stimuli : process
    begin
        sig_bin <= "0000";
        sig_dalsi <= '0';
        sig_prev <= '0';
        wait for 50 ns;

        -- Testing if prev and dalsi decreases or increases akt_melody by 1
        sig_prev <= '1';
        wait for 10 ns;
        sig_prev <= '0';
        wait for 40 ns;
        sig_dalsi <= '1';
        wait for 10 ns;
        sig_dalsi <= '0';
        wait for 40 ns;

        -- Testing some melodies
        
        sig_bin <= "0000";
        wait for 50 ns;
        assert sig_rele = "0000"
            report "0 does not match first note (0000)"
            severity error;
        
        sig_bin <= "0001";
        wait for 50 ns;
        assert sig_rele = "0001"
            report "1 does not match second note (0001)"
            severity error;
        
        sig_bin <= "1001";
        wait for 50 ns;
        assert sig_rele = "0011"
            report "9 does not match 9th note (0011)"
            severity error;
        
        --sig_akt_melody <= "10";
        sig_dalsi <= '1';
        wait for 10 ns;
        sig_dalsi <= '0';
        wait for 40 ns;
        sig_dalsi <= '1';
        wait for 10 ns;
        sig_dalsi <= '0';
        wait for 40 ns;

        sig_bin <= "0000";
        wait for 50 ns;
        assert sig_rele = "0000"
            report "0 does not match first note (0000)"
            severity error;
        
        sig_bin <= "0001";
        wait for 50 ns;
        assert sig_rele = "0001"
            report "1 does not match second note (0001)"
            severity error;
        
        sig_bin <= x"5";
        wait for 50 ns;
        assert sig_rele = "0111"
            report "5 does not match 5th note (0111)"
            severity error;

        -- Stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is requred by some simulators. Usually no need to edit.

configuration cfg_tb_melody of tb_melody is
    for tb
    end for;
end cfg_tb_melody;
