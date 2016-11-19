
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO ;



procedure Basis is
   a : integer := 0;
   b : integer := 1;
   erg : integer := 0;
   type vector is array (integer range <>) of integer;
   v1 : vector (0..2) := (1, 2, 3);
   v2 : vector (0..2) := (4, 5, 6);

   procedure Tausch ( a : in out integer; b : in out integer) is
   hilfs : integer;
   begin
      hilfs := a;
      a := b;
      b := hilfs;
   end Tausch;

   function Skalar (va : vector; vb : vector) return integer is
      ergebnis : integer := 0;
   begin
      -- Überprüfung ob gleiche Grenzen
      if va'first = va'first and va'last = vb'last then
         for i in va'range loop
            ergebnis := va(i) * vb(i) + ergebnis;
         end loop;
      else
         new_line;
         Ada.Text_IO.Put ("nicht berechenbar");
      end if;
      return ergebnis;
   end Skalar;

begin

   Tausch(a, b);
   Ada.Integer_Text_IO .Put (a);
   new_line;
   Ada.Integer_Text_IO.Put (b);

   erg := Skalar(v1, v2);
   new_line;
   Ada.Integer_Text_IO.Put (erg);




end Basis;

