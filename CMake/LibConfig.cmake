#pragma once

#pragma warning(disable:4251)
#pragma warning(disable:4996)

#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>

#include <memory>
#include <algorithm>
#include <functional>
#include <chrono>
#include <future>
#include <numeric>

#include <cstdint>
#include <cstdarg>
#include <ctime>

#include <string>
#include <array>
#include <vector>
#include <list>
#include <map>

#ifdef _WIN32
#   include <io.h> 
#   include <direct.h>
#else
#   include <unistd.h>
#endif

#define PROJECT_VERSION "@PROJECT_VERSION@"

#define PROJECT_VERSION_MAJOR "@PROJECT_VERSION_MAJOR@"

#define PROJECT_VERSION_MINOR "@PROJECT_VERSION_MINOR@"

#include "Export.hpp"
