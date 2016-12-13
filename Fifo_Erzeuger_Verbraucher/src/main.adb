---------------------------------------------------------------------------
-- Programm    : \Uebung8\erz_verbr.adb
-- Verfasser   : T. Tempelmeier
-- Datum       : 17.10.07 15:47:49
-- Beschreibung: Erzeuger-Verbraucher-Problem mit Flußkontrolle   STACK
--               Einfache Demo-Version
--               In der Praxis: + generisch + eigenes Paket + protected TYPE
-- Änderungen  :
---------------------------------------------------------------------------

with Ada.Text_IO;                use Ada.Text_IO;
with Ada.Float_Text_IO;          use Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;  use Ada.Numerics.Float_Random;

procedure main is

   gen : Generator;

   size  : constant positive := 10;
   type store_array is array (1 .. size) of float;

   -----------------------------------------------------------
   function getRandom return Float is
   begin
      return Random(gen) * 10.0;
   end getRandom;

   protected fifo is                   -- protected object
      entry push (item : in  float);
      entry pop  (item : out float);
   private
      index : natural := 0;
      read_pos : natural := 1;
      write_pos: natural := 1;
      store : store_array;
   end fifo;


   protected body fifo is
      entry push (item : in float) when index /= size is
      begin
         store(write_pos) := item;
         index := index + 1;
         if write_pos = size then
            write_pos := 1;
         else
            write_pos := write_pos + 1;
         end if;
   end push;

      entry pop (item : out float) when index /= 0 is
         begin                      -- falls Stack nicht leer
            item  := store (read_pos);
            index := index -1;
      if read_pos = size then
         read_pos := 1;
      else
         read_pos := read_pos + 1;
      end if;
         end pop;
   end fifo;

   -- Wechselseitiger Ausschluß ist automatisch sichergestellt
   -- Flußkontrolle ist durch die when-Klauseln sichergestellt

   -----------------------------------------------------------

   task erzeuger;

   task body erzeuger is
      x      : float;
   begin
      while True loop

         -- Empfange irgendwoher Daten oder erzeuge Daten
         x := getRandom;  -- hier: zufälliger Wert

         delay duration(x); -- zufällige Verzögerung der Task
         put ("Erzeuger "); put (x, 5,1,0); new_line;

         -- Speichere Daten im Zwischenpuffer Stack
         fifo.push (x);

      end loop;
   end erzeuger;

   -----------------------------------------------------------

   task verbraucher;

   task body verbraucher is
      x      : float;
   begin
      while True loop

         x := getRandom;
         delay duration(x); -- zufällige Verzögerung der Task

         -- Hole Daten aus Zwischenpuffer Stack
         fifo.pop (x);

         -- Verarbeite Daten bzw. verbrauche Daten
         put ("Verbraucher "); put (x, 5,1,0); new_line;

      end loop;
   end verbraucher;

   -----------------------------------------------------------

begin

   put_line ("Die beiden Tasks laufen jetzt los!");

   skip_line;

end main;

