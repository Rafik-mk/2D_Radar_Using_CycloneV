library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity telemetre_us is
    Port ( 
        clk        : in  STD_LOGIC; 
        chipselect : in  STD_LOGIC;
        read_n     : in  STD_LOGIC; 
        rst_n      : in  STD_LOGIC;  
        trig       : out STD_LOGIC; 
        echo       : in  STD_LOGIC;  
        readdata   : out STD_LOGIC_VECTOR (31 downto 0);
        dist_cm    : out STD_LOGIC_VECTOR(9 downto 0) 
    );
end telemetre_us;

architecture behave of telemetre_us is

    signal counter      : INTEGER := 0;
    signal time_echo    : INTEGER := 0;
    signal trig_signal  : STD_LOGIC := '0';
    signal measuring    : BOOLEAN := false;
    signal dist_stable  : STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
    signal trig_timer   : INTEGER := 0;  -- Timer pour générer `trig` périodiquement

begin

    -- 🔹 **Génération de `trig` toutes les 50ms**
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            counter <= 0;
            trig_signal <= '0';
            trig_timer <= 0;
        elsif rising_edge(clk) then
            if trig_timer >= 2500000 then  -- 50ms (50Mhz / 20)
                trig_timer <= 0;
                counter <= 0;
            else
                trig_timer <= trig_timer + 1;
            end if;
            
            if counter < 500 then  -- 10µs pour activer `trig`
                trig_signal <= '1';
                counter <= counter + 1;
            else
                trig_signal <= '0';
            end if;
        end if;
    end process;
    
    trig <= trig_signal;

    -- 🔹 **Mesure de la durée de l'écho et conversion en distance**
    process (clk, rst_n)
    begin
        if rst_n = '0' then
            time_echo <= 0;
            measuring <= false;
            dist_stable <= (others => '0');
        elsif rising_edge(clk) then
            if echo = '1' then
                measuring <= true;
                time_echo <= time_echo + 1;
            elsif echo = '0' and measuring then
                measuring <= false;
                dist_stable <= CONV_STD_LOGIC_VECTOR(time_echo / 58, 10); -- Conversion en cm
                time_echo <= 0; -- 🔹 Réinitialisation de `time_echo`
            end if;
        end if;
    end process;

    -- 🔹 **Gestion de l'interface Avalon-MM**
    process (clk)
    begin
        if rising_edge(clk) then
            if chipselect = '1' and read_n = '0' then  -- Lecture Avalon-MM
                readdata <= (others => '0'); -- Initialiser à 0
                readdata(9 downto 0) <= dist_stable;  -- Conversion en 32 bits
            end if;
        end if;
    end process;

    -- 🔹 **Sortie stabilisée de la distance**
    dist_cm <= dist_stable;

end behave;
