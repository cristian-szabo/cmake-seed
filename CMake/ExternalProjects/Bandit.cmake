ExternalProject_Add (
    Bandit

    GIT_REPOSITORY "https://github.com/banditcpp/bandit.git"
    GIT_TAG "master"
    
    CMAKE_ARGS "-DBANDIT_BUILD_SPECS=OFF" "-DBANDIT_RUN_SPECS=OFF"
      
    UPDATE_COMMAND ""
    INSTALL_COMMAND "")

ExternalProject_Get_Property (Bandit SOURCE_DIR)

set (PROJECT_NAME "bandit")

add_library (${PROJECT_NAME} INTERFACE)

set_target_properties (${PROJECT_NAME} PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${SOURCE_DIR}")

add_dependencies (${PROJECT_NAME} Bandit)
