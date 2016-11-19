with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Variable_Length255;
use Variable_Length255;
with variable_length255.IO;
use variable_length255.IO;

package Person is

   type Person is
      record
         name : Variable_String := To_Variable_String("Ungetauft");
         alter : Integer := 0;
      end record;

   procedure put (x : in Person);
   function ">" (x : Person; y : Person) return boolean;

end Person;

