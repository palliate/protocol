@0xf4a0d047ce013cbc;

struct Mouse {
  visible @0:Bool;
  x       @1:Int32;
  y       @2:Int32;
}

struct MouseButton {
  key       @0:MouseKey;
  action    @1:Action;
  modifier  @2:UInt8;
  x         @3:Int32;
  y         @4:Int32;
}

struct Cursor {
  id        @0:UInt32;
  width     @1:UInt8;
  height    @2:UInt8;
  hotspotX  @3:UInt8;
  hotspotY  @4:UInt8;
  data      @5:Data;
}

struct Keyboard {
  key       @0:UInt32;
  action    @1:Action;
  modifier  @2:UInt8;
  scancode  @3:UInt32;
}

struct Scroll {
  x         @0:UInt32;
  y         @1:UInt32;
}

struct Clipboard {
  data      @0:Text;
}

### Meta definitions ###
enum Action {
  release @0;
  press   @1;
  repeat  @2;
}

enum MouseKey {
  left   @0;
  right  @1;
  middle @2;
  mb4    @3;
  mb5    @4;
  mb6    @5;
  mb7    @6;
  mb8    @7;
}

### Outer Wrapper ###
struct Packet {
  data :union{
    empty       @0:Void;
    mouse       @1:Mouse;
    mouseButton @2:MouseButton;
    cursor      @3:Cursor;
    keyboard    @4:Keyboard;
    scroll      @5:Scroll;
    clipboard   @6:Clipboard;
  }
}
