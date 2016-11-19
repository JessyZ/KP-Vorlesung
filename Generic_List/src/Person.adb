with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body Person is

   function ">" (x: Person; y: Person) return boolean is
   begin
      return x.alter > y.alter;
   end ">";


   procedure put (x:in Person) is
   begin
      put("Name: ");
      put(x.name);
      new_line;
      put("Alter: ");
      put(x.alter);
      new_line;
   end put;


end Person;
