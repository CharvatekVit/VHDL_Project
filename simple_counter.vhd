library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity simple_counter is
    Generic ( N : integer := 16);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           en : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (16 downto 0));
end simple_counter;

architecture Behavioral of simple_counter is

signal sig_count : std_logic_vector (N-1 downto 0);

begin
    
    process (clk)
    begin
       if rising_edge(clk) then
          if rst='1' then
             sig_count <= (others => '0');
          elsif en='1' then
             sig_count <= sig_count + 1;
          end if;
       end if;
    end process;
    
    count <= sig_count;

end Behavioral;
