# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.binary import BinaryValue
import random

@cocotb.test()
async def test_alu_completa(dut):
    cocotb.log.info("Inicio del test")

    A = 15
    B = 20
    op = 0  # operación suma

    # Inicialización
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.ena.value = 0
    dut.clk.value = 0

    await Timer(1, units='ns')
    dut.clk.value = 1
    await Timer(1, units='ns')
    dut.clk.value = 0

    # Cargar entradas
    dut.ui_in.value = A
    dut.uio_in.value = B
    dut.ena.value = op

    await Timer(1, units='ns')
    dut.clk.value = 1
    await Timer(1, units='ns')
    dut.clk.value = 0

    # Esperar a que la operación se propague (más ciclos si es gate-level)
    for _ in range(5):
        await Timer(10, units='ns')
        dut.clk.value = 1
        await Timer(1, units='ns')
        dut.clk.value = 0

    result = dut.uo_out.value

    # DEBUG: Mostrar valores crudos
    cocotb.log.info(f"DEBUG: uo_out binstr: {result.binstr}")
    cocotb.log.info(f"DEBUG: uo_out integer (if resolvable): {result.integer if result.is_resolvable else 'UNRESOLVABLE'}")
    cocotb.log.info(f"Resultado suma A={A} + B={B}: {result}")

    assert result == 35, f"Resultado incorrecto: {result} (esperado 35)"


    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
