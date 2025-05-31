# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import ClockCycles
from cocotb.clock import Clock

@cocotb.test()
async def test_alu_completa(dut):
    dut._log.info("Inicio del test")

    A = 15
    B = 20

    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut.rst_n.value = 0
    dut.ena.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)

    # Cargar A
    dut.ui_in.value = A
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b01000000  # cargar A (bit 6 = 1)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    # Cargar B
    dut.ui_in.value = B
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b11000000  # cargar B (bit 7=1, bit 6=1)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b10000000  # bit 7=1, bit 6=0
    await ClockCycles(dut.clk, 1)

    # Operación: suma (btnL, btnC, btnR = 0)
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    # Mostrar resultado (ui_7 = 0)
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    result = dut.uo_out.value.integer
    dut._log.info(f"Resultado suma A={A} + B={B}: {result}")
    assert result == 35, f"Resultado incorrecto: {result} (esperado 35)"

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
