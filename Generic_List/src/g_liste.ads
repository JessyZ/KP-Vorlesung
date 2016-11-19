generic
   type beliebig is private;
   with function ">" (x: beliebig; y: beliebig) return boolean is <>;
   with procedure put (x:in beliebig) is <>;

package g_liste is

   type list_type is private;
   type list_element is private;
   type z_list_element is access list_element;

   procedure einfuegen (l: in out list_type; element : in beliebig);
   procedure printList(l : in out list_type);

private
   type list_element is
      record
         info : beliebig;
         naechst : z_list_element;
      end record;

   type list_type is record
      anfang : z_list_element := null;
      laenge : natural := 0;
   end record;



end g_liste;

