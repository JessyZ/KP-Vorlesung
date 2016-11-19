with Variable_Length255;
use Variable_Length255;


package MyList is

   type list_element;
   type ptr_list_element is access list_element;
   type list_head;
   type ptr_list_head is access list_head;

   type list_element is record
      information : Variable_String;
      pointer : ptr_list_element;
   end record;

   type list_head is record
      first : ptr_list_element := null;
      last :  ptr_list_element := null;
      count : Integer := 0;
   end record;

   head : list_head;

   procedure insert (value : in Variable_String; head : in out list_head);
   procedure print_list (head : in list_head);

  end MyList;

