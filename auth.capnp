@0xff3cd11fb8603a86;

struct AuthRequest {
  token    @0:UInt64;
}

struct AuthResponse {
  code     @0:Status;

  enum Status{
    ok     @0;
    failed @1;
  }
}


struct Auth {
  uuid          @0:UInt64;
  data :union{
    authrequest     @1:AuthRequest;
    authresponse    @2:AuthResponse;
  }
}
