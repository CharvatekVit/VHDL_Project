library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity pretaceni is
    Port ( puvodni : in STD_LOGIC_VECTOR (3 downto 0);
           back : in STD_LOGIC;
           forw : in STD_LOGIC;
           clk : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (3 downto 0));
end pretaceni;

architecture Behavioral of pretaceni is

    signal sig_output : std_logic_vector(3 downto 0);
begin

    process (clk, back, forw) is
    begin
       sig_output <= puvodni;
       if rising_edge(clk) then
            if forw = '1' then
                sig_output <= puvodni + 4;
            elsif back = '1' then
                sig_output <= puvodni - 4;
            end if;
       end if;
       output <= sig_output;
    end process;
end Behavioral;









