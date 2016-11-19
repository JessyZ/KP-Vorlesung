with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
     use Ada.Float_Text_IO;


procedure vektoradd is


   type vektor is array (integer range <>) of float;
   a : vektor (1..3) := (1.0, 2.0, 3.0);       -- Vorbesetzung mit
   b : vektor (1..3) := (4.0, 5.0, 6.0);       -- Testwerten
   c : vektor (1..4) := (1.0, 1.0, 1.0, 1.0);

   erg: vektor (1..3) := (0.0, 0.0, 0.0);

   function "+" (x, y: vektor) return vektor
        with pre=> x'first = y'first and x'last = y'last,
     post => true;

   function "+" (x, y: vektor) return vektor is
      ergebnis : vektor(1..x'last);
   begin
         for i in x'range loop
         ergebnis(i) := x(i) + y(i);
      end loop;
      return ergebnis;
   end "+";


   begin

   put ("Vektoraddition a + b = ");
   erg := a + b;

   for i in erg'range loop
      put(erg(i));
   end loop;

   new_line(2);

   put ("Vektoraddition a + c = ");
  -- erg := a + c; HIER soll Laufzeitfehler entstehen!

   for i in erg'range loop
      put(erg(i));
   end loop;

   new_line(2);
   skip_line;

   end vektoradd;
