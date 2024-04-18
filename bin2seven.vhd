library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity bin2seven is
    Port ( bin : in STD_LOGIC_VECTOR (1 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           clear : in STD_LOGIC);
end bin2seven;

architecture Behavioral of bin2seven is


begin

    p_7seg_decoder : process (bin, clear) is
    begin
    
      if (clear = '1') then
        seg <= "1111111";  -- Clear the display
      else
        case bin is
          when x"4" =>     -- x"0" means "0000" in hexadec.
            seg <= "0000001";
          when x"0" =>
            seg <= "1001111";
    
          -- WRITE YOUR CODE HERE
          when x"1" =>
            seg <= "0010010";
          when x"2" =>
            seg <= "0000110";
          when x"3" =>
            seg <= "1001100";
          when x"5" =>
            seg <= "0100100";
          when x"6" =>
            seg <= "0100000";
    
          when x"7" =>
            seg <= "0001111";
          when x"8" =>
            seg <= "0000000";
    
          when x"9" =>
            seg <= "0000100";
          when x"A" =>
            seg <= "0001000";
          when x"B" =>
            seg <= "1100000";
          when x"C" =>
            seg <= "0110001";
          when x"D" =>
            seg <= "1000010";
    
          when x"E" =>
            seg <= "0110000";
          when others =>
            seg <= "0111000";
        end case;
    
      end if;    
    end process p_7seg_decoder;

end Behavioral;
