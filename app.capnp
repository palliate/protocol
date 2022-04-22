@0x8e0fc74064f72400;

### Message definitions ###
# Exchange capabilities during handshake
# the other party has to respond with Capabilities
struct Handshake {
  uuid @0 :Text;
  capabilities @1 :List(Capability);
  neighbors @2 :List(Neighbor);
  
  struct Capability{
    plugin @0 :Text;
    server @1 :Bool;
    client @2 :Bool;
  }

  # enumerate other instances we could route to
  struct Neighbor{
    uuid  @0 :Text;
    route @1 :Route;
  }
}

# Request a plugin to be served over the specified transport
# the server has to respond with Response
struct Serve{
  plugin @0 :Text;
  transport @1 :Transport;
}

# Request to connect the local instance to the specified
# plugin at the specified address
struct Connect{
  plugin @0 :Text;
  route @1 :Route;
}

struct Response {
  code @0 :Status;
  route @1 :Route;

  enum Status{
    ok @0;
    failed @1;
  }
}

### Meta definitions ###
enum Transport{
  none @0;
  tcp @1;
  shm @2;
}

struct Route{
  type @0 :Transport;
  address :union {
    none @1 :Void;
    uuid @2 :Text;
    ip   @3 :IP;
  }
}

struct IP{
  host @0 :Text;
  port @1 :UInt16;
}


### Outer Wrapper ###
struct App {
  data :union{
    empty   @0:Void;
    handshake @1:Handshake;
    serve @2:Serve;
    connect @3:Connect;
    response @4:Response;
  }
}
