---------------------------------------------------------------------------
-- Programm    : \Uebung8\erz_verbr.adb
-- Verfasser   : T. Tempelmeier
-- Datum       : 17.10.07 15:47:49
-- Beschreibung: Erzeuger-Verbraucher-Problem mit Flußkontrolle   STACK
--               Einfache Demo-Version
--               In der Praxis: + generisch + eigenes Paket + protected TYPE
-- Änderungen  :
---------------------------------------------------------------------------

with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Integer_Text_IO;        use Ada.Integer_Text_IO;
with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;
with Praedikate;                 use Praedikate;
with Filterpackage;              use Filterpackage;
with Ada.Numerics.Discrete_Random;

procedure main is

   function sort (xs: ArrayInt) return ArrayInt is
      pivot : integer;
   begin
      if (xs'Length <= 1) THEN
         return xs;
      else
         pivot := xs(xs'length /2);
         return sort(filter(xs, pivot, greater)) & filter(xs, pivot, equal) & sort(filter(xs, pivot, less));
     end if;
   end sort;

   subtype myint10000 is integer range -10_000 .. 10_000;
   package myrand is new Ada.Numerics.Discrete_Random(myint10000);
   use myrand;
   g10000 : myrand.generator;
   data : constant ArrayInt (1..200) := (others => Random(G10000));
   result : ArrayInt(data'range);
begin
   result := sort(data);
   for i of result loop
      put(i);
      new_line;
   end loop;
end main;

