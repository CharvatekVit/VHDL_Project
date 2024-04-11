library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;


entity clock_enable is
    Generic( PERIOD : integer := 6);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end clock_enable;

architecture Behavioral of clock_enable is
    constant bits_needed : integer := integer(ceil(log2(real(PERIOD + 1))));
    
    signal sig_count : std_logic_vector(bits_needed - 1 downto 0);
    
begin

    p_clk_enable : process (clk) is
    begin

        if (rising_edge(clk)) then
            if (rst = '1') then                 -- if high-active reset then

                sig_count <= (others => '0');   -- Clear all bits of local counter
                pulse <= '0';                   -- Set output `pulse` to low

            elsif (sig_count = PERIOD-1) then
                sig_count <= (others => '0');   -- Clear all bits of local counter
                pulse <= '1';                   -- Set output `pulse` to high

            else                                -- else
                sig_count <= sig_count + 1;     -- Increment local counter
                pulse <= '0';                   -- Set output `pulse` to low

            end if;                             -- Each `if` must end by `end if`
        end if;

    end process p_clk_enable;

end Behavioral;
