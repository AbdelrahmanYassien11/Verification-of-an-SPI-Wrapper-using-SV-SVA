vlib work
vlog project_package_wrapper.sv spi_wrapper_tb.sv spi_wrapper_sva.sv spi_wrapper.vp +cover -covercells
vsim -voptargs=+acc work.spi_Wrapper_tb -cover
add wave *
coverage save wrapper_tb.ucdb -onexit
run -all
quit -sim
vcover report -file report.txt wrapper_tb.ucdb -details -annotate -all
