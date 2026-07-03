/// @defgroup vm vm
/// @ingroup lib

#pragma once

/// @brief opcode
enum class Op : uint8_t {
    nop = 0x00,  ///< `( -- )` no operation, empty command
    halt = 0xFF  ///< `( -- )` stop system
};
