@0x8a11b22ba4861bde;

struct Test {
  number @0:UInt32;
}

struct Packet {
  data :union{
      empty   @0:Void;
      test    @1:Test;
  }
}