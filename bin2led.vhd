
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 01:11:44 PM
-- Design Name: 
-- Module Name: bin2seg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bin2led is
    Port ( bin : in STD_LOGIC_VECTOR (3 downto 0);
           leds : out STD_LOGIC_VECTOR (15 downto 0);
           dalsi : in STD_LOGIC;
           prev : in std_logic);
end bin2led;

architecture Behavioral of bin2led is

begin

    p_7seg_decoder : process (bin, dalsi, prev) is
    begin
    
      if (dalsi = '1') then
        leds <= "0000000000000000";  -- Clear the display
      elsif (prev = '1') then
        leds <= "0000000000000000";  -- Clear the display
      else
      
        case bin is
          when x"0" =>     -- x"0" means "0000" in hexadec.
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
