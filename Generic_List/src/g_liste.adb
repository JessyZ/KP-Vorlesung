with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body g_liste is

   procedure einfuegen (l : in out list_type; element : in beliebig) is
      tmp : z_list_element;
      new_element : z_list_element := new list_element'(element, null);

   begin
      -- List empty
      if l.laenge = 0 then
         l.anfang := new_element;
         l.laenge := 1;

      elsif l.anfang.info > new_element.info then
         new_element.naechst := l.anfang;
         l.anfang := new_element;
         l.laenge := l.laenge + 1;

      else
         tmp := l.anfang;
         -- for each
         while tmp.naechst /= null loop

            if new_element.info > tmp.naechst.info  then
               tmp := tmp.naechst;

            else exit;
            end if;

         end loop;

         new_element.naechst := tmp.naechst;
         tmp.naechst := new_element;

         l.laenge := l.laenge + 1;

      end if;

   end einfuegen;

   procedure printList(l :in out list_type)is
      help : z_list_element := l.anfang;
  begin
    if help = null then
      put_line("List is empty.");
    end if;

    while help /= null loop
      put(help.info); new_line;
      help := help.naechst;
    end loop;

   end printList;


   end g_liste;
