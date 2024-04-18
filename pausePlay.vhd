----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 01:53:48 PM
-- Design Name: 
-- Module Name: pausePlay - Behavioral
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

entity pausePlay is
    Port ( clk    : in std_logic;
           enable : in STD_LOGIC;
           output : out STD_LOGIC);
end pausePlay;

architecture Behavioral of pausePlay is

    signal sig_enable : std_logic;

begin
    process(clk, enable) is
    begin
    if rising_edge(clk) then
        if (enable = '1') then
            if (sig_enable = '1') then
                sig_enable <= '0'; 
                output <= '0';
            else
                output <= '1';
                sig_enable <= '1';
            end if;
        end if;
    end if;
    end process;
    
end Behavioral;

