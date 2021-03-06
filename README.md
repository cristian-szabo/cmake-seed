# C/C++ CMake Seed Project

A seed project which defines the structure for a C/C++ application. Separates execution of the code from the implementation and testing by separating the components. 

## Build Status

| Linux | Windows 
| --- | ---
| [![Build Status](https://travis-ci.org/cristian-szabo/cmake-seed.svg?branch=master)](https://travis-ci.org/cristian-szabo/cmake-seed) | [![Build status](https://ci.appveyor.com/api/projects/status/sop318ja0g6qs6pn/branch/master?svg=true)](https://ci.appveyor.com/project/cristian-szabo/cmake-seed/branch/master)

## Requirements

- Linux / Windows
- C/C++ Compiler (C++ 11 Features)
- CMake > 3.2
- Git > 1.7

## How To Install

Configure and generate the project files based on your preffered IDE for Windows or Linux

``` bash
cmake -G "Visual Studio 2014" -B./Build -H./
```

Build all the project components.

``` bash
cmake --build ./Build --target All
```

Run the tests for the project library.

``` bash
push Build/Test/[CONFIGURATION]
ProjectTest --reporter=spec --formatter=vs
pop
```

Execute the project application.

``` bash
push Build/App/[CONFIGURATION]
ProjectApp -o sum -a 2 -b 3
pop
```

Install the project files (Windows - C:/Program Files (x86) OR Linux /usr/share) or to a specific location.

``` bash
push Build
make install
pop
```

Package project in an installer executable (Windows - NMPN)

``` bash
push Build
make package
pop
```

## Integration

The following CMake script is the minimum required to integrate in your project.

``` cmake
cmake_minimum_required (VERSION 3.2)

project (Demo VERSION 1.0.0)

set (CMAKE_CXX_STANDARD 11)

find_package (Project 1.0.0 REQUIRED COMPONENTS Lib CONFIG)

file (GLOB HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Include/*.hpp")
file (GLOB SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Source/*.cpp")

source_group ("Include\\" FILES ${HEADER_FILES})
source_group ("Source\\" FILES ${SOURCE_FILES})

add_executable (${PROJECT_NAME} ${HEADER_FILES} ${SOURCE_FILES})

target_include_directories (${PROJECT_NAME} PUBLIC  
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include>)

target_link_libraries (${PROJECT_NAME} PUBLIC Project::Lib)

add_custom_command (TARGET ${PROJECT_NAME} 
    POST_BUILD 
    COMMAND ${CMAKE_COMMAND} -E copy_if_different 
        "$<TARGET_FILE_DIR:Project::Lib>/$<TARGET_FILE_NAME:Project::Lib>" "$<TARGET_FILE_DIR:${PROJECT_NAME}>")
```
