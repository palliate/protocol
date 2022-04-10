find_package(CapnProto CONFIG REQUIRED)

capnp_generate_cpp(palliate_proto palliate_proto_headers 
  ${CMAKE_CURRENT_LIST_DIR}/app.capnp
)