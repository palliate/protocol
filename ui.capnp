@0xcb9c2347b57a29ee;

### Message definitions ###
struct Create {
  title    @0:Text;
  position @1:Position;
  flags    @2:Flags;
  icon     @3:Icon;
}

struct Close { }

struct Flags {
  visible   @0:Bool = true;
  minimized @1:Bool = false;
  maximized @2:Bool = false;
  focused   @3:Bool = false;
  floating  @4:Bool = false;
}

struct Attention { }

struct Position {
  x      @0:Int32;
  y      @1:Int32;
  width  @2:UInt32;
  height @3:UInt32;
}

struct Title {
  title  @0:Text;
}

struct Icon {
  width  @0:UInt8;
  height @1:UInt8;
  data   @2:Data;
}


### Meta definitions ###
using WindowHandle = UInt32;

### Outer Wrapper ###
struct UI {
  uuid        @0:UInt64;
  handle      @1:WindowHandle = 0;

  data :union{
    empty     @2:Void;
    create    @3:Create;
    close     @4:Close;
    flags     @5:Flags;
    attention @6:Attention;
    position  @7:Position;
    title     @8:Title;
    icon      @9:Icon;
  }
}
