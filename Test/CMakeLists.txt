project (Test)

find_package (Bandit REQUIRED)

file (GLOB HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Include/*.hpp")
file (GLOB SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Source/*.cpp")

source_group ("Include\\" FILES ${HEADER_FILES})
source_group ("Source\\" FILES ${SOURCE_FILES})

add_executable (${PROJECT_NAME} ${HEADER_FILES} ${SOURCE_FILES})

target_include_directories (${PROJECT_NAME} PUBLIC  
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include>)

target_link_libraries (${PROJECT_NAME} PUBLIC Lib bandit)
