library ieee;
    use ieee.std_logic_1164.all;

entity tb_clock_enable is
end entity tb_clock_enable;

architecture tb of tb_clock_enable is
    component clock_enable is
        generic (
            PERIOD : integer
        );
        port (
            clk   : in    std_logic;
            rst   : in    std_logic;
            pulse : out   std_logic
        );
    end component;

    signal clk   : std_logic;
    signal rst   : std_logic;
    signal pulse : std_logic;

    constant TbPeriod   : time      := 10 ns;
    signal   TbClock    : std_logic := '0';
    signal   TbSimEnded : std_logic := '0';
begin

    dut : component clock_enable
        generic map (
            PERIOD => 6
        )
        port map (
            clk   => clk,
            rst   => rst,
            pulse => pulse
        );

    TbClock <= not TbClock after TbPeriod / 2 when TbSimEnded /= '1' else
               '0';

    clk <= TbClock;

    stimuli : process is
    begin
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;

    end process stimuli;

end architecture tb;


configuration cfg_tb_clock_enable of tb_clock_enable is
    for tb
    end for;
end cfg_tb_clock_enable;
