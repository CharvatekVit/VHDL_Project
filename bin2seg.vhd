library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity bin2seg is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           leds : out STD_LOGIC_VECTOR (15 downto 0);
           dalsi : in STD_LOGIC;
           prev : in std_logic);
end bin2seg;

architecture Behavioral of bin2seg is

begin

    p_7seg_decoder : process (bin, dalsi, prev) is
    begin
    
      if (dalsi = '1') then
        leds <= "0000000000000000"; 
        elsif (prev = '1') then
        leds <= "0000000000000000";
      else
      
        case bin is
          when x"0" => 
            leds <= "1000000000000000";
          when x"1" =>
            leds <= "1100000000000000";
          when x"2" =>
            leds <= "1110000000000000";
          when x"3" =>
            leds <= "1111000000000000";
          when x"4" =>
            leds <= "1111100000000000";
          when x"5" =>
            leds <= "1111110000000000";
          when x"6" =>
            leds <= "1111111000000000";
          when x"7" =>
            leds <= "1111111100000000";
          when x"8" =>
            leds <= "1111111110000000";
          when x"9" =>
            leds <= "1111111111000000";
          when x"A" =>
            leds <= "1111111111100000";
          when x"B" =>
            leds <= "1111111111110000";
          when x"C" =>
            leds <= "1111111111111000";
          when x"D" =>
            leds <= "1111111111111100";
          when x"E" =>
            leds <= "1111111111111110";
          when x"F" =>
            leds <= "1111111111111111";
          when others =>
            leds <= "0000000000000000";
        end case;
    
      end if;    
    end process p_7seg_decoder;

end Behavioral;
