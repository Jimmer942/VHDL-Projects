## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Switches
set_property PACKAGE_PIN V17 [get_ports {reset}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {salida[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[0]}]
set_property PACKAGE_PIN W6 [get_ports {salida[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[1]}]
set_property PACKAGE_PIN U8 [get_ports {salida[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[2]}]
set_property PACKAGE_PIN V8 [get_ports {salida[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[3]}]
set_property PACKAGE_PIN U5 [get_ports {salida[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[4]}]
set_property PACKAGE_PIN V5 [get_ports {salida[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[5]}]
set_property PACKAGE_PIN U7 [get_ports {salida[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[6]}]

set_property PACKAGE_PIN V7 [get_ports {salida[7]}]							
	set_property IOSTANDARD LVCMOS33 [get_ports {salida[7]}]
	
set_property PACKAGE_PIN U2 [get_ports {MUX[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MUX[0]}]
set_property PACKAGE_PIN U4 [get_ports {MUX[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MUX[1]}]
set_property PACKAGE_PIN V4 [get_ports {MUX[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MUX[2]}]
set_property PACKAGE_PIN W4 [get_ports {MUX[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {MUX[3]}]