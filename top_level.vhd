library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           CLK100MHZ : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           JB : out std_logic_vector (4 downto 1);
           CA : out std_logic;
           CB : out std_logic;
           CC : out std_logic;
           CD : out std_logic;
           CE : out std_logic;
           CF : out std_logic;
           CG : out std_logic;
           AN : out std_logic_vector(7 downto 0);
           DP : out std_logic);
end top_level;

architecture Behavioral of top_level is
    
    -- Component declaration for clock enable
    component clock_enable is
    Generic( PERIOD : integer := 12500000);
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
              back  : in std_logic;
              forw  : in std_logic;
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
    port (clk    : in std_logic;
          enable : in std_logic;
          output : out std_logic);
    end component;
    
    component melody is
    port(bin         : in std_logic_vector (3 downto 0);
        rele          : out std_logic_vector (4 downto 1);
        dalsi       : in std_logic;
        prev        : in std_logic;
        akt_melody  : out std_logic_vector(1 downto 0);
        clk         : in std_logic);
    end component;
    
    component bin2seven is
    port (bin : in STD_LOGIC_VECTOR (1 downto 0);
          seg : out STD_LOGIC_VECTOR (6 downto 0);
          clear : in STD_LOGIC);
    end component;
    
    signal sig_en_1s : std_logic;
    signal sig_count : std_logic_vector(3 downto 0);
    signal sig_pause : std_logic;
    signal sig_pressed : std_logic;
    signal sig_pressed_BTNU : std_logic;
    signal sig_pressed_BTND : std_logic;
    signal sig_pressed_BTNL : std_logic;
    signal sig_pressed_BTNR : std_logic;
    signal sig_en_2ms : std_logic;
    signal sig_akt_melody : std_logic_vector(1 downto 0);
    
begin
    
    -- Component instatitation of clock enable for 2 ms
    CE2 : clock_enable
    Generic map(PERIOD => 200000)
    port map(
        clk => CLK100MHZ,
        rst => '0',
        pulse => sig_en_2ms);
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
        dalsi => sig_pressed_BTNU,
        prev => sig_pressed_BTND,
        back => sig_pressed_BTNL,
        forw => sig_pressed_BTNR,
        en => sig_en_1s,
        count => sig_count);
    -- Component instantiation of debouncer
    DBC : debounce
    port map(
        clk => CLK100MHZ,
        rst => '0',
        bouncey => BTNC,
        en => sig_en_2ms,
        pos_edge => sig_pressed,
        neg_edge => open,
        clean => open);
    DBU : debounce
    port map(
        clk => CLK100MHZ,
        rst => '0',
        bouncey => BTNU,
        en => sig_en_2ms,
        pos_edge => sig_pressed_BTNU,
        neg_edge => open,
        clean => open);
    DBD : debounce
    port map(
        clk => CLK100MHZ,
        rst => '0',
        bouncey => BTND,
        en => sig_en_2ms,
        pos_edge => sig_pressed_BTND,
        neg_edge => open,
        clean => open);
    DBL : debounce
    port map(
        clk => CLK100MHZ,
        rst => '0',
        bouncey => BTNL,
        en => sig_en_2ms,
        pos_edge => sig_pressed_BTNL,
        neg_edge => open,
        clean => open);
    DBR : debounce
    port map(
        clk => CLK100MHZ,
        rst => '0',
        bouncey => BTNR,
        en => sig_en_2ms,
        pos_edge => sig_pressed_BTNR,
        neg_edge => open,
        clean => open);
    -- 
    LE : bin2seg
    port map(
        bin => sig_count,
        leds => LED,
        dalsi => sig_pressed_BTNU,
        prev => sig_pressed_BTND);
    
    PP : pausePlay
    port map(
        clk => CLK100MHZ,
        enable => sig_pressed,
        output => sig_pause);
    
    MEL : melody
    port map(
        bin => sig_count,
        rele => JB,
        dalsi => sig_pressed_BTNU,
        prev => sig_pressed_BTND,
        akt_melody => sig_akt_melody,
        clk => CLK100MHZ);
    
    B2S : bin2seven
    port map(
        bin => sig_akt_melody,
        seg(6) => CA,
        seg(5) => CB,
        seg(4) => CC,
        seg(3) => CD,
        seg(2) => CE,
        seg(1) => CF,
        seg(0) => CG, 
        clear => '0');
    
    DP <= '1';
    AN <= "11111110";

end Behavioral;
