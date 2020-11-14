enable_testing()

add_executable( leopays_test_generator ${CMAKE_CURRENT_SOURCE_DIR}/eosio_test_generator.cpp ${CMAKE_CURRENT_SOURCE_DIR}/eosio_wasm_spec_test_generator.cpp)
