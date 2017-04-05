cmake_minimum_required (VERSION 3.7)

project (Extern VERSION 1.0.0)

list (APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")

set_directory_properties (PROPERTIES EP_BASE "${CMAKE_BINARY_DIR}")

include ("ExternalProject/Docopt")
include ("ExternalProject/Bandit")
