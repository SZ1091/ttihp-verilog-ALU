# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_alu_completa(dut):
    dut._log.info("Inicio del test")

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut.rst_n.value = 0
    dut.ena.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)

    # Cargar A = 15
    dut.ui_in.value = 15
    dut.uio_in.value = 0b00000000  # bit 6 = 0 antes del pulso
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b01000000  # bit 6 = 1, bit 7 = 0 → carga A
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b00000000  # bit 6 = 0 después del pulso
    await ClockCycles(dut.clk, 1)

    # Cargar B = 20
    dut.ui_in.value = 20
    dut.uio_in.value = 0b00000000  # bit 6 = 0 antes del pulso
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b11000000  # bit 7=1, bit 6=1 → carga B
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b10000000  # bit 7=1, bit 6=0 después del pulso
    await ClockCycles(dut.clk, 1)

    # Operación suma (btnL=0, btnC=0, btnR=0 → bits 0-2 de uio_in)
    dut.uio_in.value = 0b00000000  # btnR=0, btnC=0, btnL=0
    await ClockCycles(dut.clk, 1)

    # Mostrar resultado (ui_7 = 0)
    dut.uio_in.value = 0b00000000  # ui_7=0
    await ClockCycles(dut.clk, 1)

    result = dut.uo_out.value.integer
    dut._log.info(f"Resultado suma A=15 + B=20: {result}")
    assert result == 35, f"Resultado incorrecto: {result} (esperado 35)"

    # Mostrar flags (ui_7 = 1)
    dut.uio_in.value = 0b00100000  # ui_7=1
    await ClockCycles(dut.clk, 1)

    flags = dut.uo_out.value.integer
    dut._log.info(f"Flags (COZN): {flags:08b}")

    dut._log.info("Fin del test exitoso.")

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
