library IEEE;
use IEEE.STD_LOGIC_1164.ALL;




entity test is
    Port ( BTNC : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTND : in STD_LOGIC;
           JB : out STD_LOGIC_VECTOR (4 downto 1));
end test;

architecture Behavioral of test is

begin
    JB(1) <= '1' when BTNU = '1' else '0';
    JB(2) <= '1' when BTNL = '1' else '0';
    JB(3) <= '1' when BTNC = '1' else '0';
    JB(4) <= '1' when BTNR = '1' else '0';
    
    process is
        variable i : integer := 0;
    begin
 
        while i < 10 loop
            JB(1) <= '1';
            wait for 10ms;
            JB(1) <= '0';
            i := i + 1;
        end loop;
        wait;
 
    end process;
        

end Behavioral;
