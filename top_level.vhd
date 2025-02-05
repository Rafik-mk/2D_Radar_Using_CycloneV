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
        LEDR     : out STD_LOGIC_VECTOR(9 downto 0)  -- Affichage distance
    );
end top_level;

architecture Behavioral of top_level is

    -- télémètre
    component telemetre_us
        Port (
            clk     : in  STD_LOGIC;
            rst_n   : in  STD_LOGIC;
            trig    : out STD_LOGIC;
            echo    : in  STD_LOGIC;
            dist_cm : out STD_LOGIC_VECTOR(9 downto 0)
        );
    end component;

    signal dist_internal : STD_LOGIC_VECTOR(9 downto 0);

begin

    U1: telemetre_us
        port map (
            clk     => CLOCK_50,
            rst_n   => KEY0,
            trig    => GPIO_0_1,
            echo    => GPIO_0_3,
            dist_cm => dist_internal
        );

    -- affichage de la distance aux LEDs
    LEDR <= dist_internal;

end Behavioral;
