library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_motor is
    Port (
        clk       : in  std_logic;   -- Horloge 50MHz
        reset_n   : in  std_logic;   -- Reset actif bas
        position  : in  std_logic_vector(7 downto 0); -- Position en entrée
        commande  : out std_logic   -- Signal PWM pour le servo
    );
end servo_motor;

architecture Behavioral of servo_motor is
    signal count : integer := 0;
    signal pwm   : std_logic := '0';
begin
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            count <= 0;
            pwm <= '0';
        elsif rising_edge(clk) then
            if count < (to_integer(unsigned(position)) * 10 + 1000) then
                pwm <= '1';
            else
                pwm <= '0';
            end if;

            if count < 20000 then
                count <= count + 1;
            else
                count <= 0;
            end if;
        end if;
    end process;

    commande <= pwm;
end Behavioral;
