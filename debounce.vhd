library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.MATH_REAL.ALL;


entity debounce is
    Generic( PERIOD : integer := 6);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           bouncey : in STD_LOGIC;
           clean : out STD_LOGIC;
           pos_edge : out STD_LOGIC;
           neg_edge : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    type   state_type is (RELEASED, PRE_PRESSED, PRESSED, PRE_RELEASED);
    signal state : state_type;

    constant DEB_COUNT : integer := 4;

    signal sig_count : integer range 0 to DEB_COUNT;

    signal sig_clean : std_logic;
    
    signal sig_delay : std_logic;
begin
    p_delay : process (clk) is
    begin
        if rising_edge(clk) then
            sig_delay <= sig_clean;
        end if;
    end process p_delay;
    
    pos_edge <= sig_clean and not(sig_delay);
    neg_edge <= '1' when (sig_clean = '0' and sig_delay = '1') else '0';

    p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
            if (rst = '1') then
                state <= RELEASED;
            elsif (en = '1') then

                case state is

                    when RELEASED =>
                        if bouncey = '1' then 
                            state <= PRE_PRESSED;
                            sig_count <= 0;
                        end if;

                    when PRE_PRESSED =>
                        if bouncey = '1' then
                            sig_count <= sig_count + 1;

                            if sig_count = DEB_COUNT - 1 then
                                state <= PRESSED;
                            end if;

                        else
                            state <= RELEASED;
                        end if;

                    when PRESSED =>
                        if bouncey = '0' then
                            sig_count <= 0;
                            state <= PRE_RELEASED;
                        end if;

                    when PRE_RELEASED =>
                        if bouncey = '0' then
                            sig_count <= sig_count + 1;

                            if sig_count = DEB_COUNT - 1 then
                                state <= RELEASED;
                            end if; 

                        else
                            state <= PRESSED;
                        end if;

                    when others =>
                        null;
                end case;
            end if;
        end if;

    end process p_fsm;

    sig_clean <= '1' when (state = PRESSED or state = PRE_RELEASED) else '0';

    clean <= sig_clean;

end Behavioral;
