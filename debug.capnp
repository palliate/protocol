@0xf2bc23c56f3f621f;

struct Message {
  severity    @0:Severity;
  threadId    @1:UInt64;
  threadName  @2:Text;
  location    @3:Text;
  function    @4:Text;
  line        @5:UInt32;
  text        @6:Text;
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
struct Debug {
  data :union{
    empty       @0:Void;
    message     @1:Message;
  }
}
