capnp_generate_cpp(palliate_proto palliate_proto_headers
  ${CMAKE_CURRENT_LIST_DIR}/app.capnp
  ${CMAKE_CURRENT_LIST_DIR}/uic.capnp
  ${CMAKE_CURRENT_LIST_DIR}/input.capnp
  ${CMAKE_CURRENT_LIST_DIR}/debug.capnp
  ${CMAKE_CURRENT_LIST_DIR}/auth.capnp
)
