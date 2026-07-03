# cmake
## build scripts

```files
cmake/
CMakeLists.txt
CMakePresets.json
```
- [[decl/cpp/CMakeLists.txt|CMakeLists.txt]]
	- [[decl/cpp/version.cmake]]
	- [[decl/cpp/src.cmake]]
	- [[decl/cpp/syntax.cmake]]
	- [[decl/cpp/install.cmake]]

## libs/tools search

```files
cmake/
    FindRAGEL.cmake                // ragel used for some ASCII->num
    FindREADLINE.cmake             // command line edit
    FindZMQ.cmake                  // most simple IPC with async messages
```

## target toolchain configuration

cross-build target can be switched using CMake presets:

```files
CMakePresets.json
cmake/
    any_toolchain.cmake              // shared config
    x86_64-linux-gnu.cmake           // default: developer's Linux HOST
    mingw-w64-ucrt-x86_64.cmake      // modern 64-bit Windows
    i686-w64-mingw32.cmake           // compatibility: 32-bit (Win7+)
    aarch64-linux-gnu.cmake          // Raspberry Pi 4+
    armv7-linux-gnu.cmake            // retro 32-bit Raspberry's
    arm-none-eabi.cmake              // Cortex-M/STM32 MCU's
    xtensa-lx106-elf.cmake           // ESP32
```

- [[decl/cpp/CMakePresets.json|CMakePresets.json]]
- [[decl/cpp/any_toolchain.cmake]]
	- [[decl/cpp/x86_64-linux-gnu.cmake]]
