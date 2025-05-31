# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info

export COCOTB_RESOLVE_X=ZERO

# defaults
SIM ?= icarus
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = tt_um_SZ1091_ALU_Completa.v ALU_S.v ALU_S_Flags.v Carry_1.v Indicadores.v Multiplexor_1.v Multiplexor_2.v Negative_1.v Overflow_1.v Procesamiento.v Procesamiento_Entradas.v Procesamiento_Entradas2.v SL1.v SR1.v Shifters_1.v Sumador_0.v Sumador_1.v Sumador_2.v Sumador_3.v Zero_1.v

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DSIM
VERILOG_SOURCES += $(PDK_ROOT)/ihp-sg13g2/libs.ref/sg13g2_io/verilog/sg13g2_io.v
VERILOG_SOURCES += $(PDK_ROOT)/ihp-sg13g2/libs.ref/sg13g2_stdcell/verilog/sg13g2_stdcell.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# MODULE is the basename of the Python test file
MODULE = test

COCOTB_MAKEFILE ?= $(COCOTB_MAKEFILE)
include $(COCOTB_MAKEFILE)/Makefile.sim

clean:
	rm -rf sim_build results.xml
