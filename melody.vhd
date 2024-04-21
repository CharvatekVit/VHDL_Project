----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 11:29:49 AM
-- Design Name: 
-- Module Name: melody - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity melody is
  Port (bin         : in std_logic_vector (3 downto 0);
        rele        : out std_logic_vector (4 downto 1);
        dalsi       : in std_logic;
        prev        : in std_logic;
        akt_melody  : out std_logic_vector(1 downto 0);
        clk         : in std_logic);
end melody;

architecture Behavioral of melody is

    signal sig_akt_melody : std_logic_vector(1 downto 0);
    
begin
    --sig_akt_melody <= "00";
    p_7seg_decoder : process (clk, dalsi, prev) is
    begin
       if rising_edge(clk) then
        if (dalsi = '1') then
          sig_akt_melody <= sig_akt_melody + 1;
        elsif (prev = '1') then
          sig_akt_melody <= sig_akt_melody - 1;
        else
          case sig_akt_melody is
            when x"0" =>        -- zacatek prvni melodie
              case bin is
                when x"0" =>     -- x"0" means "0000" in hexadec.
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"1" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"2" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"3" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"4" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"5" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"6" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"7" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"8" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"9" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"A" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"B" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"C" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"D" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"E" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"F" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when others =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
              end case;        -- konec prvni melodie
            when x"1" =>        -- zacatek druhe melodie
              case bin is
                when x"0" =>     -- x"0" means "0000" in hexadec.
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"1" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"2" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"3" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"4" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"5" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"6" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"7" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"8" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"9" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"A" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"B" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"C" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"D" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"E" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"F" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when others =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
              end case;        -- konec druhe melodie
            when x"2" =>        -- zacatek treti melodie
              case bin is
                when x"0" =>     -- x"0" means "0000" in hexadec.
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"1" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"2" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"3" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"4" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"5" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '1';
                  rele(4) <= '0';
                when x"6" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"7" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"8" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"9" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"A" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"B" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"C" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"D" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"E" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"F" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when others =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
              end case;        -- konec treti melodie
            when x"3" =>        -- zacatek ctvrte melodie
              case bin is
                when x"0" =>     -- x"0" means "0000" in hexadec.
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"1" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"2" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"3" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"4" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"5" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"6" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"7" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"8" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"9" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"A" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"B" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"C" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"D" =>
                  rele(1) <= '1';
                  rele(2) <= '1';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"E" =>
                  rele(1) <= '1';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when x"F" =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
                when others =>
                  rele(1) <= '0';
                  rele(2) <= '0';
                  rele(3) <= '0';
                  rele(4) <= '0';
              end case;        -- konec ctvrte melodie
            when others => null;
          end case;
        end if;
      end if;    
    end process p_7seg_decoder;

    akt_melody <= sig_akt_melody;
    
end Behavioral;
