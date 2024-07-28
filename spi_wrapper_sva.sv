module spi_wrapper_sva(MISO_sva,MOSI_sva,SS_n_sva,clk_sva,rst_n_sva);

// sva file interfaces
input MISO_sva, MOSI_sva, SS_n_sva, clk_sva, rst_n_sva;




//properties
property rst_n_low;

	@(posedge clk_sva) $fell(rst_n_sva) |-> (!MISO_sva);
	    
endproperty


chk_rst_vals: assert property(rst_n_low);

cov_rst_vals: cover property(rst_n_low);

endmodule