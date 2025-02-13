library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_motor is
    Port (
        clk        : in  std_logic;   -- Horloge 50MHz
        reset_n    : in  std_logic;   -- Reset actif bas
        chipselect : in  std_logic;   -- Sélection du périphérique sur le bus Avalon
        write_n    : in  std_logic;   -- Signal d'autorisation d'écriture
        writedata  : in  std_logic_vector(7 downto 0); -- Valeur de position
        commande   : out std_logic   -- Signal PWM pour le servomoteur
    );
end servo_motor;

architecture Behavioral of servo_motor is
    signal position : std_logic_vector(7 downto 0) := (others => '0'); -- Stocke la position demandée
    signal count    : integer range 0 to 1000000 := 0; -- Compteur pour la génération du signal PWM
    signal pwm      : std_logic := '0'; -- Signal PWM

    -- Constantes pour la génération du signal PWM
    constant CLK_FREQ   : integer := 50000000;  -- 50 MHz
    constant PERIOD_20MS: integer := CLK_FREQ / 50;  -- Période de 20 ms
    constant MIN_PULSE  : integer := (CLK_FREQ / 1000) * 1;  -- 1 ms (0°)
    constant MAX_PULSE  : integer := (CLK_FREQ / 1000) * 2;  -- 2 ms (180°)
begin

    -- Processus de gestion du bus Avalon
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            position <= (others => '0');
        elsif rising_edge(clk) then
            if chipselect = '1' and write_n = '0' then
                position <= writedata;
            end if;
        end if;
    end process;

    -- Processus de génération du signal PWM
    process(clk, reset_n)
        variable pulse_width : integer := MIN_PULSE; -- Largeur d'impulsion PWM
    begin
        if reset_n = '0' then
            count <= 0;
            pwm <= '0';
        elsif rising_edge(clk) then
            -- Calcul de la largeur d'impulsion en fonction de la position
            pulse_width := MIN_PULSE + ((to_integer(unsigned(position)) * (MAX_PULSE - MIN_PULSE)) / 255);

            if count < pulse_width then
                pwm <= '1';  -- Signal PWM actif
            else
                pwm <= '0';  -- Signal PWM désactivé
            end if;

            -- Réinitialisation du compteur toutes les 20ms
            if count < PERIOD_20MS then
                count <= count + 1;
            else
                count <= 0;
            end if;
        end if;
    end process;

    -- Assignation de la sortie
    commande <= pwm;
    
end Behavioral;

