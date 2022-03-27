@0x8a11b22ba4861bde;


### Message definitions ###
# Exchange capabilities during handshake
# the other party has to respond with Capabilities
struct Handshake {
  capabilities @0 :List(Capability);
  neighbors @1 :List(Neighbor);
  
  struct Capability{
    plugin @0 :Text;
    server @1 :Bool;
    client @2 :Bool;
  }

  # enumerate other instances we could route to
  struct Neighbor{
    name @0 :Text;
    transport @1 :Transport;
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
  transport @1 :Transport;
  address :union{
    name @2 :Text;
    ip @3 :IP;
  }
}

struct Response {
  code @0 :Status;
  address :union{
    name @1 :Text;
    ip @2 :IP;
  }

  enum Status{
    ok @0;
    failed @1;
  }
}

struct Test {
  number @0:UInt32;
}


### Meta definitions ###
enum Transport{
  tcp @0;
  shm @1;
}

struct IP{
  host @0 :Text;
  port @1 :UInt16;
}


### Outer Wrapper ###
struct Packet {
  data :union{
    empty   @0:Void;
    test  @1:Test;
    handshake @2:Handshake;
    serve @3:Serve;
    connect @4:Connect;
    response @5:Response;
  }
}
