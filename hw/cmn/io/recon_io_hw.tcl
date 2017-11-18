# TCL File Generated by Component Editor 16.0
# Tue May 23 23:48:14 EST 2017
# DO NOT MODIFY


# 
# recon_io "recon_io" v1.0
# JEFF LIEU 2017.05.23.23:48:14
# 
# 

# 
# request TCL package from ACDS 16.0
# 
package require -exact qsys 16.0


# 
# module recon_io
# 
set_module_property DESCRIPTION ""
set_module_property NAME recon_io
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "RECON Library"
set_module_property AUTHOR "JEFF LIEU"
set_module_property DISPLAY_NAME recon_io
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false
set_module_property VALIDATION_CALLBACK validate

# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL recon_io
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file recon_io.v VERILOG PATH recon_io.v TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter PORT_WIDTH INTEGER 16
set_parameter_property PORT_WIDTH DEFAULT_VALUE 16
set_parameter_property PORT_WIDTH DISPLAY_NAME PORT_WIDTH
set_parameter_property PORT_WIDTH TYPE INTEGER
set_parameter_property PORT_WIDTH UNITS None
set_parameter_property PORT_WIDTH ALLOWED_RANGES  1:32
set_parameter_property PORT_WIDTH HDL_PARAMETER true

add_parameter PWM_CNTR_WIDTH INTEGER 8
set_parameter_property PWM_CNTR_WIDTH DEFAULT_VALUE 8
set_parameter_property PWM_CNTR_WIDTH DISPLAY_NAME PWM_CNTR_WIDTH
set_parameter_property PWM_CNTR_WIDTH TYPE INTEGER
set_parameter_property PWM_CNTR_WIDTH UNITS None
set_parameter_property PWM_CNTR_WIDTH ALLOWED_RANGES 8:32
set_parameter_property PWM_CNTR_WIDTH HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset_n reset_n Input 1


# 
# connection point irq
# 
add_interface irq interrupt end
set_interface_property irq associatedAddressablePoint s0
set_interface_property irq associatedClock clock
set_interface_property irq associatedReset reset
set_interface_property irq bridgedReceiverOffset ""
set_interface_property irq bridgesToReceiver ""
set_interface_property irq ENABLED true
set_interface_property irq EXPORT_OF ""
set_interface_property irq PORT_NAME_MAP ""
set_interface_property irq CMSIS_SVD_VARIABLES ""
set_interface_property irq SVD_ADDRESS_GROUP ""

add_interface_port irq irq irq Output 1


# 
# connection point io_port
# 
add_interface io_port conduit end
set_interface_property io_port associatedClock clock
set_interface_property io_port associatedReset ""
set_interface_property io_port ENABLED true
set_interface_property io_port EXPORT_OF ""
set_interface_property io_port PORT_NAME_MAP ""
set_interface_property io_port CMSIS_SVD_VARIABLES ""
set_interface_property io_port SVD_ADDRESS_GROUP ""

add_interface_port io_port io_out io_out Output PORT_WIDTH
add_interface_port io_port io_opdrn io_opdrn Output PORT_WIDTH
add_interface_port io_port io_in io_in Input PORT_WIDTH
add_interface_port io_port io_oe io_oe Output PORT_WIDTH


# 
# connection point s0
# 
add_interface s0 avalon end
set_interface_property s0 addressUnits WORDS
set_interface_property s0 associatedClock clock
set_interface_property s0 associatedReset reset
set_interface_property s0 bitsPerSymbol 8
set_interface_property s0 burstOnBurstBoundariesOnly false
set_interface_property s0 burstcountUnits WORDS
set_interface_property s0 explicitAddressSpan 0
set_interface_property s0 holdTime 0
set_interface_property s0 linewrapBursts false
set_interface_property s0 maximumPendingReadTransactions 0
set_interface_property s0 maximumPendingWriteTransactions 0
set_interface_property s0 readLatency 1
set_interface_property s0 readWaitTime 1
set_interface_property s0 setupTime 0
set_interface_property s0 timingUnits Cycles
set_interface_property s0 writeWaitTime 0
set_interface_property s0 ENABLED true
set_interface_property s0 EXPORT_OF ""
set_interface_property s0 PORT_NAME_MAP ""
set_interface_property s0 CMSIS_SVD_VARIABLES ""
set_interface_property s0 SVD_ADDRESS_GROUP ""

add_interface_port s0 address address Input 6
add_interface_port s0 chipselect chipselect Input 1
add_interface_port s0 write write Input 1
add_interface_port s0 read read Input 1
add_interface_port s0 writedata writedata Input 32
add_interface_port s0 readdata readdata Output 32
set_interface_assignment s0 embeddedsw.configuration.isFlash 0
set_interface_assignment s0 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s0 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s0 embeddedsw.configuration.isPrintableDevice 0



proc validate {} {  
  set_module_assignment embeddedsw.CMacro.PORT_WIDTH      [get_parameter_value PORT_WIDTH]  
  set_module_assignment embeddedsw.CMacro.PWM_CNTR_WIDTH  [get_parameter_value PWM_CNTR_WIDTH]  
}
