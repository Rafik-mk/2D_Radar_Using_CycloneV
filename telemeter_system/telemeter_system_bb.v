
module telemeter_system (
	clk_clk,
	pll_sys_locked_export,
	reset_reset_n,
	sevenseg_0_hex0,
	sevenseg_0_hex1,
	sevenseg_0_hex2,
	sevenseg_0_hex3,
	sevenseg_0_hex4,
	sevenseg_0_hex5,
	telemeter_0_echo,
	telemeter_0_trig,
	telemeter_0_readdata);	

	input		clk_clk;
	output		pll_sys_locked_export;
	input		reset_reset_n;
	output	[6:0]	sevenseg_0_hex0;
	output	[6:0]	sevenseg_0_hex1;
	output	[6:0]	sevenseg_0_hex2;
	output	[6:0]	sevenseg_0_hex3;
	output	[6:0]	sevenseg_0_hex4;
	output	[6:0]	sevenseg_0_hex5;
	input		telemeter_0_echo;
	output		telemeter_0_trig;
	output	[9:0]	telemeter_0_readdata;
endmodule
