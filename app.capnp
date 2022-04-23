@0xaa881ba7cfa22169;

### Message definitions ###
# Exchange capabilities during handshake
# the other party has to respond with Capabilities
struct Handshake {
  capabilities @0:List(Capability);
  neighbors    @1:List(Neighbor);

  struct Capability{
    plugin @0 :Text;
    server @1 :Bool;
    client @2 :Bool;
  }

  # enumerate other instances we could route to
  struct Neighbor{
    uuid  @0 :Data;
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
    uuid @2 :Data;
    ip   @3 :IP;
  }
}

struct IP{
  host @0 :Text;
  port @1 :UInt16;
}


### Outer Wrapper ###
struct App {
  uuid          @0:UInt64;
  data :union{
    empty       @1:Void;
    handshake   @2:Handshake;
    serve       @3:Serve;
    connect     @4:Connect;
    response    @5:Response;
  }
}
