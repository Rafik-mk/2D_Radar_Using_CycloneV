library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_motor_tb is
end servo_motor_tb;

architecture testbench of servo_motor_tb is
    signal clk       : std_logic := '0';
    signal reset_n   : std_logic := '1';
    signal position  : std_logic_vector(7 downto 0) := (others => '0');
    signal commande  : std_logic;

    constant clk_period : time := 20 ns; -- 50 MHz

begin
    -- Instanciation du module testé
    uut: entity work.servo_motor
        port map (
            clk       => clk,
            reset_n   => reset_n,
            position  => position,
            commande  => commande
        );

    -- Génération de l’horloge (oscillation continue)
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus de test
    stimulus_process : process
    begin
        -- Reset initial
        reset_n <= '0';
        wait for 50 ns;
        reset_n <= '1';

        -- Test position 90° (1,5 ms)
        position <= "01000000";
        wait for 40 ms;

        -- Test position 180° (2 ms)
        position <= "10000000";
        wait for 40 ms;

        -- Test position 0° (1 ms)
        position <= "00000000";
        wait for 40 ms;

        -- Arrêter la simulation
        wait;
    end process;

end testbench;
