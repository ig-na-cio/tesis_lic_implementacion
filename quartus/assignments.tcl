# En Quartus:
# Tools > Tcl Scripts
# quartus/assignments.tcl

set_global_assignment -name TOP_LEVEL_ENTITY de0nano

set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/de0nano.sv
set_global_assignment -name SYSTEMVERILOG_FILE ../rtl/processor/p.sv