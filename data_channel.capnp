@0x96db6f39c5c57e43;

interface DataChannel (Type) {
  stream @0(callback :Callback, token :UInt64) -> ();

  interface Callback {
    message @0(data :Type) -> ();
  }
}