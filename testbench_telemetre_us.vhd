library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity testbench_telemetre_us is
end testbench_telemetre_us;

architecture behave of testbench_telemetre_us is

    signal clk_tb     : STD_LOGIC := '0';
    signal rst_n_tb   : STD_LOGIC := '0';
    signal trig_tb    : STD_LOGIC;
    signal echo_tb    : STD_LOGIC := '0';
    signal dist_cm_tb : STD_LOGIC_VECTOR(9 downto 0);

    component telemetre_us
        Port ( clk     : in  STD_LOGIC;
               rst_n   : in  STD_LOGIC;
               trig    : out STD_LOGIC;
               echo    : in  STD_LOGIC;
               dist_cm : out STD_LOGIC_VECTOR(9 downto 0));
    end component;

begin

    -- telemeter IP
    uut: telemetre_us
        port map (
            clk     => clk_tb,
            rst_n   => rst_n_tb,
            trig    => trig_tb,
            echo    => echo_tb,
            dist_cm => dist_cm_tb
        );

    -- clock 50Hz
    process
    begin
        while true loop
            clk_tb <= '0';
            wait for 10 ns;
            clk_tb <= '1';
				report "Clock tick";
            wait for 10 ns;
        end loop;
    end process;

    -- Test scenario
    process
    begin
        -- Reset
        rst_n_tb <= '0';
        wait for 100 ns;
        rst_n_tb <= '1';
        wait for 100 ns;

        -- test
        wait for 500 ns;  
        echo_tb <= '1';  
        wait for 1 ms;   
        echo_tb <= '0';

        wait for 10 ms;

        -- 2nd test
        echo_tb <= '1';
        wait for 2 ms;
        echo_tb <= '0';

        wait for 20 ms;

        wait;
    end process;

end behave;
