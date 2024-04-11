----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2024 01:52:44 PM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0));
end top_level;

architecture Behavioral of top_level is
    
    -- Component declaration for clock enable
    component clock_enable is
    Generic( PERIOD : integer := 100000000);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
    end component;
    
    -- Component declaration for clock enable
    component clock_enable_2ms is
    Generic( PERIOD : integer := 200000);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
    end component;
    
    -- Component declaration for simple counter
    component simple_counter is
    Generic (N : integer := 4);
        port (clk   : in std_logic;
              dalsi : in std_logic;
              prev  : in std_logic;
              en    : in std_logic;
              count : out std_logic_vector (N-1 downto 0));
    end component;
    
    -- Component declaration for debounce
    component debounce is
    port (clk : in std_logic;
          rst : in std_logic;
          bouncey : in std_logic;
          en : in std_logic;
          pos_edge : out std_logic;
          neg_edge : out std_logic;
          clean : out std_logic);
    end component;
    
    -- Component declaration for 
    component bin2seg is
    port (bin : in std_logic_vector(3 downto 0);
          leds : out std_logic_vector(15 downto 0);
          dalsi : in std_logic;
          prev : in std_logic);
    end component;
    
    component pausePlay is
    port (--clk: in std_logic;
          enable : in std_logic;
          output : out std_logic);
    end component;
    
    signal sig_en_1s : std_logic;
    signal sig_count : std_logic_vector(3 downto 0);
    signal sig_pause : std_logic;
    signal sig_pressed : std_logic;
    signal sig_en_2ms : std_logic;
    
begin
    
    -- Component instatitation of clock enable for 2 ms
    --CE2 : clock_enable_2ms
    --port map(
    --clk => CLK100MHZ,
    --rst => '0',
    --pulse => sig_en_2ms);
    -- Component instantiation of clock enable for 1 s
    CE1 : clock_enable
    port map(
    clk => CLK100MHZ,
    rst => sig_pause,
    pulse => sig_en_1s);
    -- Component instantiation of 4-bit simple counter
    SC4 : simple_counter
    port map(
    clk => CLK100MHZ,
    dalsi => BTNU,
    prev => BTND,
    en => sig_en_2ms,
    count => sig_count);
    -- Component instantiation of debouncer
    DB : debounce
    port map(
    clk => CLK100MHZ,
    rst => '0',
    bouncey => BTNC,
    en => sig_en_1s,
    pos_edge => open,
    neg_edge => open,
    clean => sig_pressed);
    -- 
    LE : bin2seg
    port map(
    bin => sig_count,
    leds => LED,
    dalsi => BTNU,
    prev => BTND);
    
    PP : pausePlay
    port map(
    --clk => CLK100MHZ,
    enable => sig_pressed,
    output => sig_pause);
    

end Behavioral;
