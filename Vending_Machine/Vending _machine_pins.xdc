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
	
## LEDs
set_property PACKAGE_PIN U16 [get_ports {pulso}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {pulso}]
	
##Pmod Header JA
##Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {filas[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {filas[0]}]
##Sch name = JA2
set_property PACKAGE_PIN L2 [get_ports {filas[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {filas[1]}]
##Sch name = JA3
set_property PACKAGE_PIN J2 [get_ports {filas[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {filas[2]}]
##Sch name = JA4
set_property PACKAGE_PIN G2 [get_ports {filas[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {filas[3]}]
##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {columnas[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {columnas[0]}]
##Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {columnas[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {columnas[1]}]
##Sch name = JA9
set_property PACKAGE_PIN H2 [get_ports {columnas[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {columnas[2]}]
##Sch name = JA10
set_property PACKAGE_PIN G3 [get_ports {columnas[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {columnas[3]}]

 
