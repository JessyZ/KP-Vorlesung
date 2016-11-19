with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with MyList;
use MyList;
with Variable_Length255;
use Variable_Length255;


procedure main is

   MyListHead: list_head;
   s1 : Variable_String := To_Variable_String("AAA");
   s2 : Variable_String := To_Variable_String("BCD");
   s3 : Variable_String := To_Variable_String("AAC");
begin

   insert(s1, MyListHead);
   insert (s2, MyListHead);
   insert (s3, MyListHead);

   put("Num of elements: "); put(MyListHead.count); new_line;

   print_list(MyListHead);

 end main;
