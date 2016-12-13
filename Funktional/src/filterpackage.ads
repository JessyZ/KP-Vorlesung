with praedikate;
use Praedikate;
package filterpackage is
   type ArrayInt is array (natural range <>) of integer;
   function Filter (v: ArrayInt; x: Integer; p: Praedikat) return ArrayInt;
end filterpackage;
