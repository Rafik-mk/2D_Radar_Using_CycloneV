	component telemeter is
		port (
			clk_clk                          : in  std_logic                    := 'X'; -- clk
			pll_sys_locked_export            : out std_logic;                           -- export
			reset_reset_n                    : in  std_logic                    := 'X'; -- reset_n
			telemeter_0_conduit_end_echo     : in  std_logic                    := 'X'; -- echo
			telemeter_0_conduit_end_trig     : out std_logic;                           -- trig
			telemeter_0_conduit_end_readdata : out std_logic_vector(9 downto 0)         -- readdata
		);
	end component telemeter;

	u0 : component telemeter
		port map (
			clk_clk                          => CONNECTED_TO_clk_clk,                          --                     clk.clk
			pll_sys_locked_export            => CONNECTED_TO_pll_sys_locked_export,            --          pll_sys_locked.export
			reset_reset_n                    => CONNECTED_TO_reset_reset_n,                    --                   reset.reset_n
			telemeter_0_conduit_end_echo     => CONNECTED_TO_telemeter_0_conduit_end_echo,     -- telemeter_0_conduit_end.echo
			telemeter_0_conduit_end_trig     => CONNECTED_TO_telemeter_0_conduit_end_trig,     --                        .trig
			telemeter_0_conduit_end_readdata => CONNECTED_TO_telemeter_0_conduit_end_readdata  --                        .readdata
		);

