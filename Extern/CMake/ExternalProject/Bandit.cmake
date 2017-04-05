include (ExternalProject)

ExternalProject_Add (
    bandit

    GIT_REPOSITORY "https://github.com/banditcpp/bandit.git"
    GIT_TAG "master"
    
    CMAKE_ARGS "-DBANDIT_BUILD_SPECS=OFF" "-DBANDIT_RUN_SPECS=OFF"
      
    UPDATE_COMMAND ""
    INSTALL_COMMAND "")

ExternalProject_Get_Property (bandit SOURCE_DIR)
ExternalProject_Get_Property (bandit INSTALL_DIR)

ExternalProject_Add_Step (bandit install_header_files
    COMMAND ${CMAKE_COMMAND} -E copy_directory "${SOURCE_DIR}/bandit" "${INSTALL_DIR}/include/bandit"
    DEPENDEES install)
