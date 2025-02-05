library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity telemetre_us is
    Port ( clk     : in  STD_LOGIC;  
           rst_n   : in  STD_LOGIC;  
           trig    : out STD_LOGIC; 
           echo    : in  STD_LOGIC;  
           dist_cm : out STD_LOGIC_VECTOR(9 downto 0) 
         );
end telemetre_us;

architecture behave of telemetre_us is

    signal counter     : INTEGER := 0;
    signal time_echo   : INTEGER := 0;
    signal trig_signal : STD_LOGIC := '0';
    signal measuring   : BOOLEAN := false;

begin

    process (clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
            trig_signal <= '0';
        elsif rising_edge(clk) then
            if counter < 500 then  -- 10 µs à 50 MHz
                trig_signal <= '1';
                counter <= counter + 1;
            else
                trig_signal <= '0';
            end if;
        end if;
    end process;
    
    trig <= trig_signal;

    -- Mesure de la durée de l'écho
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            time_echo <= 0;
            measuring <= false;
        elsif rising_edge(clk) then
            if echo = '1' then
                measuring <= true;
                time_echo <= time_echo + 1;
            elsif echo = '0' and measuring then
                measuring <= false;
                dist_cm <= CONV_STD_LOGIC_VECTOR(time_echo / 58, 10); -- Conversion en cm
            end if;
        end if;
    end process;

end behave;
