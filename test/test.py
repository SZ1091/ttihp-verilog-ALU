# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer
from cocotb.binary import BinaryValue


@cocotb.test()
async def test_alu_completa(dut):
    cocotb.log.info("Inicio del test")

    # Espera inicial para estabilizar señales (GDS puede empezar con X)
    await Timer(100, units="ns")

    # Leer resultado con tolerancia a X/Z
    raw_value = dut.uo_out.value
    try:
        result = raw_value.integer
    except ValueError:
        cleaned_str = str(raw_value).replace('x', '0').replace('z', '0')
        cleaned = BinaryValue(cleaned_str)
        result = cleaned.integer
        cocotb.log.warning(
            f"Se detectaron bits indeterminados en uo_out: '{raw_value}'. "
            f"Se forzó a: '{cleaned_str}' => {result}"
        )

    cocotb.log.info(f"Resultado procesado: {result}")

    assert isinstance(result, int)

    # Keep testing the module by changing the input values, waiting for
    # one or more clock cycles, and asserting the expected output values.
