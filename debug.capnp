@0xb378089e01736fc9;

struct Message {
  severity    @0:Severity;
  threadId    @1:Text;
  threadName  @2:Text;
  location    @3:Text;
  text        @4:Text;
}

struct MinLevel {
  severity    @0:Severity;
}

### Meta definitions ###
enum Severity {
  debug   @0;
  info    @1;
  warning @2;
  error   @3;
  fatal   @4;
}

### Outer Wrapper ###
struct Packet {
  data :union{
    empty       @0:Void;
    message     @1:Message;
    minLevel    @2:MinLevel;
  }
}
