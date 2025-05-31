# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
def safe_int(binary_value):
    # Convierte cualquier 'x' o 'z' en '0' para evitar errores
    bin_str = str(binary_value).lower().replace('x', '0').replace('z', '0')
    return int(bin_str, 2)

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
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b01000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    # Cargar B = 20
    dut.ui_in.value = 20
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b11000000
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = 0b10000000
    await ClockCycles(dut.clk, 1)

    # Operación suma
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    # Mostrar resultado
    dut.uio_in.value = 0b00000000
    await ClockCycles(dut.clk, 1)

    # ✅ Usa safe_int en lugar de .integer
    result = safe_int(dut.uo_out.value)
    dut._log.info(f"Resultado suma A=15 + B=20: {result}")
    assert result == 35, f"Resultado incorrecto: {result} (esperado 35)"

    # Mostrar flags
    dut.uio_in.value = 0b00100000
    await ClockCycles(dut.clk, 1)

    flags = safe_int(dut.uo_out.value)
    dut._log.info(f"Flags (COZN): {flags:08b}")

    dut._log.info("Fin del test exitoso.")

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
