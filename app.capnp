@0x957fac5f66577c33;

### Message definitions ###
# Exchange capabilities during handshake
# the other party has to respond with Capabilities
struct Handshake {
  uuid         @0:UInt64;
  capabilities @1:List(Capability);
  neighbors    @2:List(Neighbor);

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

struct Info{
  endpoints   @0 :List(GenericInfo);
  plugins     @1 :List(GenericInfo);
  #TODO fill with more runtime info
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

struct GenericInfo {
  name   @0 :Text;
  active @1 :Bool;
}

interface App {
  handshake @0(client :Handshake) -> (server :Handshake);
  serve     @1(service :Serve)    -> (response :Response);
  connect   @2(service :Connect)  -> (response :Response);
  status    @3()                  -> (info :Info);
}
