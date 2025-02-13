library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_level is
    Port (
        CLOCK_50 : in  STD_LOGIC; 
        KEY0     : in  STD_LOGIC;  -- Bouton Reset n
        GPIO_0_1 : out STD_LOGIC;  -- Signal Trigger 
        GPIO_0_3 : in  STD_LOGIC;  -- Signal Echo 
        LEDR     : out STD_LOGIC_VECTOR(9 downto 0);  -- Affichage distance
		  HEX0 : out std_logic_vector (6 downto 0);
		  HEX1 : out std_logic_vector (6 downto 0);
		  HEX2 : out std_logic_vector (6 downto 0);
		  HEX3 : out std_logic_vector (6 downto 0);
		  HEX4 : out std_logic_vector (6 downto 0);
	     HEX5 : out std_logic_vector (6 downto 0)
    );
end top_level;

architecture Behavioral of top_level is

	component telemeter_system is
        port (
            clk_clk              : in  std_logic                    := 'X'; -- clk
            reset_reset_n        : in  std_logic                    := 'X'; -- reset_n
            telemeter_0_echo     : in  std_logic                    := 'X'; -- echo
            telemeter_0_trig     : out std_logic;                           -- trig
            telemeter_0_readdata : out std_logic_vector(9 downto 0);       -- readdata
				sevenseg_0_hex0       : out std_logic_vector(6 downto 0);        -- hex0
            sevenseg_0_hex1       : out std_logic_vector(6 downto 0);        -- hex1
            sevenseg_0_hex2       : out std_logic_vector(6 downto 0);        -- hex2
            sevenseg_0_hex3       : out std_logic_vector(6 downto 0);        -- hex3
            sevenseg_0_hex4       : out std_logic_vector(6 downto 0);        -- hex4
            sevenseg_0_hex5       : out std_logic_vector(6 downto 0)  
        );
    end component telemeter_system;

begin

	u0 : component telemeter_system
        port map (
            clk_clk               => CLOCK_50,               --            clk.clk
            reset_reset_n         => KEY0,         --          reset.reset_n
            telemeter_0_echo        => GPIO_0_3,        --      telemeter.echo
            telemeter_0_trig        => GPIO_0_1,        --               .trig
            telemeter_0_readdata   => LEDR, 		--               .writedata
				sevenseg_0_hex0       => HEX0,       --     sevenseg_0.hex0
            sevenseg_0_hex1       => HEX1,       --               .hex1
            sevenseg_0_hex2       => HEX2,       --               .hex2
            sevenseg_0_hex3       => HEX3,       --               .hex3
            sevenseg_0_hex4       => HEX4,       --               .hex4
            sevenseg_0_hex5       => HEX5  
				
        );

end Behavioral;
