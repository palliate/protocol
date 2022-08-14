@0xba90a5b80c88427f;

# UI Control

struct Create {
  title    @0:Text;
  position @1:Position;
  flags    @2:Flags;
  icon     @3:Icon;
}

struct Flags {
  visible   @0:Bool = true;
  minimized @1:Bool = false;
  maximized @2:Bool = false;
  focused   @3:Bool = false;
  floating  @4:Bool = false;
}

struct Position {
  x      @0:Int32;
  y      @1:Int32;
  width  @2:UInt32;
  height @3:UInt32;
}

struct Icon {
  width  @0:UInt8;
  height @1:UInt8;
  data   @2:Data;
}

using WindowHandle = UInt32;

interface UIC {
  create      @0  (window :Create)       -> (handle :WindowHandle);
  close       @1  (handle :WindowHandle) -> ();
  attention   @2  (handle :WindowHandle) -> ();

  setFlags    @3  (handle :WindowHandle, flags :Flags)       -> (success :Bool);
  setPosition @4  (handle :WindowHandle, position :Position) -> (success :Bool);
  setTitle    @5  (handle :WindowHandle, title :Text)        -> (success :Bool);
  setIcon     @6  (handle :WindowHandle, icon :Icon)         -> (success :Bool);

  getFlags    @7  (handle :WindowHandle) -> (flags :Flags);
  getPosition @8  (handle :WindowHandle) -> (position :Position);
  getTitle    @9  (handle :WindowHandle) -> (title :Text);
  getIcon     @10 (handle :WindowHandle) -> (icon :Icon);

  getHandle   @11 (title :Text)          -> (handle :WindowHandle);
  # attach/detach FramePump to monitor
  # query monitor layout
}