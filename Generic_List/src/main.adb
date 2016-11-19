with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with g_liste;
with Person;
use Person;
with Variable_Length255;
use Variable_Length255;


procedure main is
   package person_liste is new g_liste(Person.Person);

   p1 : person_liste.list_type;
   Bob : Person.Person := (To_Variable_String("Bob"), 20);
   Anna : Person.Person := (To_Variable_String("Anna"), 19);
   Unbenannt : Person.Person;
begin

   person_liste.einfuegen(p1, Bob);
   person_liste.einfuegen(p1, Anna);
   person_liste.einfuegen(p1, Unbenannt);

   person_liste.printList(p1);

 end main;
