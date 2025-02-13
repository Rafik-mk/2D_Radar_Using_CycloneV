	telemeter u0 (
		.clk_clk                          (<connected-to-clk_clk>),                          //                     clk.clk
		.pll_sys_locked_export            (<connected-to-pll_sys_locked_export>),            //          pll_sys_locked.export
		.reset_reset_n                    (<connected-to-reset_reset_n>),                    //                   reset.reset_n
		.telemeter_0_conduit_end_echo     (<connected-to-telemeter_0_conduit_end_echo>),     // telemeter_0_conduit_end.echo
		.telemeter_0_conduit_end_trig     (<connected-to-telemeter_0_conduit_end_trig>),     //                        .trig
		.telemeter_0_conduit_end_readdata (<connected-to-telemeter_0_conduit_end_readdata>)  //                        .readdata
	);

