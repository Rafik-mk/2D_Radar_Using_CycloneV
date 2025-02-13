
module telemeter (
	clk_clk,
	pll_sys_locked_export,
	reset_reset_n,
	telemeter_0_conduit_end_echo,
	telemeter_0_conduit_end_trig,
	telemeter_0_conduit_end_readdata);	

	input		clk_clk;
	output		pll_sys_locked_export;
	input		reset_reset_n;
	input		telemeter_0_conduit_end_echo;
	output		telemeter_0_conduit_end_trig;
	output	[9:0]	telemeter_0_conduit_end_readdata;
endmodule
