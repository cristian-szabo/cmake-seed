project (Test VERSION 1.0.0)

file (GLOB HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Include/*.hpp")
file (GLOB SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/Source/*.cpp")

source_group ("Include\\" FILES ${HEADER_FILES})
source_group ("Source\\" FILES ${SOURCE_FILES})

add_executable (${PROJECT_NAME} ${HEADER_FILES} ${SOURCE_FILES})

add_dependencies (${PROJECT_NAME} Bandit)

target_include_directories (${PROJECT_NAME} PUBLIC  
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Include>
    $<TARGET_PROPERTY:bandit,INTERFACE_INCLUDE_DIRECTORIES>)

target_link_libraries (${PROJECT_NAME} PUBLIC Lib)

add_custom_command (TARGET ${PROJECT_NAME} 
    POST_BUILD 
    COMMAND ${CMAKE_COMMAND} -E copy_if_different "$<TARGET_FILE_DIR:Lib>/$<TARGET_FILE_NAME:Lib>" "$<TARGET_FILE_DIR:${PROJECT_NAME}>")
