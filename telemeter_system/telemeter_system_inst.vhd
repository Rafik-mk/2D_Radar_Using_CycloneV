	component telemeter_system is
		port (
			clk_clk               : in  std_logic                    := 'X'; -- clk
			pll_sys_locked_export : out std_logic;                           -- export
			reset_reset_n         : in  std_logic                    := 'X'; -- reset_n
			sevenseg_0_hex0       : out std_logic_vector(6 downto 0);        -- hex0
			sevenseg_0_hex1       : out std_logic_vector(6 downto 0);        -- hex1
			sevenseg_0_hex2       : out std_logic_vector(6 downto 0);        -- hex2
			sevenseg_0_hex3       : out std_logic_vector(6 downto 0);        -- hex3
			sevenseg_0_hex4       : out std_logic_vector(6 downto 0);        -- hex4
			sevenseg_0_hex5       : out std_logic_vector(6 downto 0);        -- hex5
			telemeter_0_echo      : in  std_logic                    := 'X'; -- echo
			telemeter_0_trig      : out std_logic;                           -- trig
			telemeter_0_readdata  : out std_logic_vector(9 downto 0)         -- readdata
		);
	end component telemeter_system;

	u0 : component telemeter_system
		port map (
			clk_clk               => CONNECTED_TO_clk_clk,               --            clk.clk
			pll_sys_locked_export => CONNECTED_TO_pll_sys_locked_export, -- pll_sys_locked.export
			reset_reset_n         => CONNECTED_TO_reset_reset_n,         --          reset.reset_n
			sevenseg_0_hex0       => CONNECTED_TO_sevenseg_0_hex0,       --     sevenseg_0.hex0
			sevenseg_0_hex1       => CONNECTED_TO_sevenseg_0_hex1,       --               .hex1
			sevenseg_0_hex2       => CONNECTED_TO_sevenseg_0_hex2,       --               .hex2
			sevenseg_0_hex3       => CONNECTED_TO_sevenseg_0_hex3,       --               .hex3
			sevenseg_0_hex4       => CONNECTED_TO_sevenseg_0_hex4,       --               .hex4
			sevenseg_0_hex5       => CONNECTED_TO_sevenseg_0_hex5,       --               .hex5
			telemeter_0_echo      => CONNECTED_TO_telemeter_0_echo,      --    telemeter_0.echo
			telemeter_0_trig      => CONNECTED_TO_telemeter_0_trig,      --               .trig
			telemeter_0_readdata  => CONNECTED_TO_telemeter_0_readdata   --               .readdata
		);

