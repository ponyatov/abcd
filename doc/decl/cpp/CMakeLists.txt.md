# CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.25)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
project(${CMAKE_PROJECT_NAME} VERSION 0.0.1 LANGUAGES CXX C ASM)

include(version)  # binary files naming by version & git branch/hash
include(src)      # scan project for source code files

message("-- |")
message("-- | toolchain: " ${CMAKE_CXX_COMPILER} " @ " ${CMAKE_TOOLCHAIN_FILE})
message("-- |      host: " ${CMAKE_HOST_SYSTEM_NAME}-${CMAKE_HOST_SYSTEM_VERSION})
message("-- |    target: " "hw:" ${HW} " cpu:" ${CPU} " arch:" ${ARCH} " os:" ${OS})
message("-- |   startup: " "${S}")
message("-- |    linker: " "${LD}")
message("-- |    binary: " "${CMAKE_INSTALL_PREFIX}/${BIN_OUTPUT_NAME}${CMAKE_EXECUTABLE_SUFFIX}")
message("-- |       ini: " "${F}")
message("-- |      data: " "${DATA}")
message("-- |       cpp: " "${C} ${CP}")
message("-- |       hpp: " "${H} ${HP}")
message("-- |")

target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE ${INC})

add_executable(${CMAKE_PROJECT_NAME}
    ${C}  ${H}          # C/C++ sources
    ${CP} ${HP}         # generated parsers
    ${S}  ${LD}         # embedded/lowlevel
    ${F}                # init/config files & scripts
    ${DATA}             # precompiled binary data (bytecode,..)
)

include(install) # target install
```
