include (FindPackageHandleStandardArgs)

find_path (BANDIT_INCLUDE_DIR
    NAMES
        bandit/bandit.h
    PATHS
        ${EXTERN_PATH}
    PATH_SUFFIXES
        bandit/include
    NO_DEFAULT_PATH)
        
find_package_handle_standard_args (bandit
    FOUND_VAR BANDIT_FOUND
    REQUIRED_VARS BANDIT_INCLUDE_DIR
    VERSION_VAR "2.0.0")

mark_as_advanced (BANDIT_INCLUDE_DIR)

if (BANDIT_FOUND)
    add_library(bandit INTERFACE IMPORTED)
    
    set_target_properties(bandit PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${BANDIT_INCLUDE_DIR}")
endif ()
