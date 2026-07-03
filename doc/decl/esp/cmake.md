```
cmake_minimum_required(VERSION 3.25)
get_filename_component(CMAKE_PROJECT_NAME ${CMAKE_SOURCE_DIR} NAME)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(${CMAKE_PROJECT_NAME} VERSION 0.0.1)
```
