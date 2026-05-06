## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]

## Buttons
set_property PACKAGE_PIN U18 [get_ports {btn[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]
set_property PACKAGE_PIN T18 [get_ports {btn[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]

## Audio Output (PMOD Header J1)
set_property PACKAGE_PIN J1 [get_ports audio_out]					
	set_property IOSTANDARD LVCMOS33 [get_ports audio_out]
