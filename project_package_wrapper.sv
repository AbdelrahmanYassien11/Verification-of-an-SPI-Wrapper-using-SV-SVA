package wrapper_package;

	typedef enum {IDLE, CHK_CMD , WRITE_ADDR , WRITE_DATA , READ_ADDR, READ_DATA} fsm_states;
	
	bit [2:0] state;

	class spi_data;

		rand       bit MOSI;
		logic      MOSI_COMM;
		bit 	   clk;
		bit 	   SS_n;
		bit		   rst_n;
		bit [2:0] state;

		covergroup covgrp_1 @(SS_n);

			SS_n_cp: coverpoint SS_n iff (rst_n) {
				bins END_COMM = (0 => 1);
				bins STRT_COMM = (1 => 0);
			}

		endgroup

		covergroup covgrp_2;

			MOSI_cp: coverpoint MOSI_COMM iff (rst_n) {
				bins MOSI_WRT_ADDR 	= (0 => 0 => 0);
				bins MOSI_WRT_DATA  = (0 => 0 => 1);
				bins MOSI_RD_ADDR 	= (1 => 1 => 0);
				bins MOSI_RD_DATA   = (1 => 1 => 1);
			}

			CMDs_cp: coverpoint state iff (rst_n) {

				bins idle2_chk_cmd = (IDLE => CHK_CMD);
				bins WRT_addr2_IDLE = (WRITE_ADDR => IDLE);
				bins WRT_data2_IDLE = (WRITE_DATA => IDLE);
				bins RD_addr2_IDLE = (READ_ADDR => IDLE);
				bins RD_data2_IDLE = (READ_DATA => IDLE);

			}

		endgroup

		function new();

			covgrp_1 = new;
			covgrp_2 = new;

		endfunction

	endclass

endpackage