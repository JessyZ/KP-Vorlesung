package body Filterpackage is

function Filter (v: ArrayInt; x: Integer; p: Praedikat) return ArrayInt is
   Temp: ArrayInt(v'Range);
   j: integer := v'First;
   begin
      for element of v loop
         if p(x, element) then
            Temp(J) := element;
            j := j+1;
         end if;
      end loop;
      return Temp(v'first .. j-1);
   end filter;
 end Filterpackage;
