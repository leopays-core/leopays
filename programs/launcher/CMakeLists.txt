add_executable( ${LAUNCHER_EXECUTABLE_NAME} main.cpp )
if( UNIX AND NOT APPLE )
  set(rt_library rt )
endif()

find_package( Gperftools QUIET )
if( GPERFTOOLS_FOUND )
    message( STATUS "Found gperftools; compiling ${LAUNCHER_EXECUTABLE_NAME} with TCMalloc")
    list( APPEND PLATFORM_SPECIFIC_LIBS tcmalloc )
endif()

if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../../.git)
  find_package(Git)
  if(GIT_FOUND)
    execute_process(
      COMMAND ${GIT_EXECUTABLE} rev-parse --short=8 HEAD
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../.."
      OUTPUT_VARIABLE "LAUNCHER_BUILD_VERSION"
      ERROR_QUIET
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    message(STATUS "Git commit revision: ${LAUNCHER_BUILD_VERSION}")
  else()
    set(LAUNCHER_BUILD_VERSION 0)
  endif()
endif()

configure_file(config.hpp.in config.hpp ESCAPE_QUOTES)

target_include_directories( ${LAUNCHER_EXECUTABLE_NAME} PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries( ${LAUNCHER_EXECUTABLE_NAME}
                      PRIVATE eosio_chain fc Boost::program_options ${CMAKE_DL_LIBS} ${PLATFORM_SPECIFIC_LIBS} )

install( TARGETS
   ${LAUNCHER_EXECUTABLE_NAME}

   RUNTIME DESTINATION ${CMAKE_INSTALL_FULL_BINDIR}
   LIBRARY DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
   ARCHIVE DESTINATION ${CMAKE_INSTALL_FULL_LIBDIR}
)
