	telemeter_system u0 (
		.clk_clk               (<connected-to-clk_clk>),               //            clk.clk
		.pll_sys_locked_export (<connected-to-pll_sys_locked_export>), // pll_sys_locked.export
		.reset_reset_n         (<connected-to-reset_reset_n>),         //          reset.reset_n
		.sevenseg_0_hex0       (<connected-to-sevenseg_0_hex0>),       //     sevenseg_0.hex0
		.sevenseg_0_hex1       (<connected-to-sevenseg_0_hex1>),       //               .hex1
		.sevenseg_0_hex2       (<connected-to-sevenseg_0_hex2>),       //               .hex2
		.sevenseg_0_hex3       (<connected-to-sevenseg_0_hex3>),       //               .hex3
		.sevenseg_0_hex4       (<connected-to-sevenseg_0_hex4>),       //               .hex4
		.sevenseg_0_hex5       (<connected-to-sevenseg_0_hex5>),       //               .hex5
		.telemeter_0_echo      (<connected-to-telemeter_0_echo>),      //    telemeter_0.echo
		.telemeter_0_trig      (<connected-to-telemeter_0_trig>),      //               .trig
		.telemeter_0_readdata  (<connected-to-telemeter_0_readdata>)   //               .readdata
	);

