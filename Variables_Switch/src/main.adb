with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;



procedure main is

   f1 : float := 3.0;
   f2 : float := 4.0;
   i1 : Integer := 2;
   i2 : Integer := 1;

   generic
   type sometype is private;
procedure variables_switch(x, y : in out sometype);


procedure variables_switch(x, y : in out sometype) is
   T: sometype;
begin
   T := x;
   x := y;
   y := T;
end variables_switch;

procedure variables_switch_float is new
  variables_switch(float);

procedure variables_switch_int is new
  variables_switch(Integer);

begin

   variables_switch_float(f1, f2);
   variables_switch_int(i1, i2);

   put(f1);
   put(f2);
   put(i1);
   put(i2);

 end main;





