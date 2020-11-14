# will be implictly used for any compilation unit if not overrided by SYSTEM_INCLUDE_FOLDERS parameter
# these directories go as -isystem <dir> to avoid warnings from code of third-party libraries

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lpc.bios/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lpc.bios/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lpc.msig/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lpc.msig/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lpc.system/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lpc.system/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lpc.token/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lpc.token/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/lpc.wrap/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/lpc.wrap/)

file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/old_versions/v1.6.0-rc3/lpc.bios/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/old_versions/v1.6.0-rc3/lpc.bios/)
file(COPY ${CMAKE_CURRENT_SOURCE_DIR}/old_versions/v1.7.0-develop-preactivate_feature/lpc.bios/ DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/old_versions/v1.7.0-develop-preactivate_feature/lpc.bios/)
