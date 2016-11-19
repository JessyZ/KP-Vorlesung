with Ada.Text_IO;
     use Ada.Text_IO;
with Ada.Integer_Text_IO;
     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;
with Variable_Length255;
use Variable_Length255;
with variable_length255.IO;
use variable_length255.IO;


package body MyList is

   procedure insert (value : in Variable_String; head : in out list_head) is
      tmp : ptr_list_element;
      new_element : ptr_list_element := new list_element'(value, null);

   begin
      -- List empty
      if head.count = 0 then
         head.first := new_element;
         head.last := new_element;
         head.count := 1;

      elsif head.first.information > new_element.information then
         new_element.pointer := head.first;
         head.first := new_element;
         head.count := head.count + 1;

      else
         tmp := head.first;
         -- for each
         while tmp.pointer /= null loop

            if tmp.pointer.information < new_element.information then
               tmp := tmp.pointer;

            else exit;
            end if;

         end loop;

         -- if last one
         if tmp.pointer = null then
            head.last := new_element;

         end if;
         new_element.pointer := tmp.pointer;
         tmp.pointer := new_element;

         head.count := head.count + 1;


      end if;

   end insert;

     procedure print_list (head : in list_head) is
    help : ptr_list_element := head.first;
  begin
    if help = null then
      put_line("List is empty.");
    end if;

    while help /= null loop
      put(help.information); new_line;
      help := help.pointer;
    end loop;
   end print_list;

   end MyList;
