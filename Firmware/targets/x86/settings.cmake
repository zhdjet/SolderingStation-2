set(CWARN "-Wall -Wstrict-prototypes -Wextra")
set(CXXWARN "-Wall -Wextra")
set(CTUNING "")
set(RANDOM_DEFS "-D__weak=__attribute__((weak)) -D__packed=__attribute__((__packed__)) -DUNREFERENCED_PARAMETER(x)=(void)(x)")

set(CMAKE_C_FLAGS "-std=gnu11 ${CWARN} ${CTUNING} ${CMCU}")
set(CMAKE_CXX_FLAGS "-std=gnu++14 ${CXXWARN} ${CTUNING} ${CMCU} ${RANDOM_DEFS} ${CXXTHREADS}")
set(CMAKE_CXX_STANDARD 14)

set(DEBUG_COMP_OPTIONS "-DDEBUG -Og -g")
set(RELEASE_COMP_OPTIONS "-DNDEBUG -O2")

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE}")

set(CMAKE_C_FLAGS_DEBUG ${DEBUG_COMP_OPTIONS})
set(CMAKE_CXX_FLAGS_DEBUG ${DEBUG_COMP_OPTIONS})
set(CMAKE_C_FLAGS_RELEASE ${RELEASE_COMP_OPTIONS})
set(CMAKE_CXX_FLAGS_RELEASE ${RELEASE_COMP_OPTIONS})
