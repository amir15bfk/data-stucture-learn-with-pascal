program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, fileAvecPriorite, llculibplus
  { you can add units after this };
var f:fileP;  i:integer;
begin
   initFileP(f);
   for i:=1 to 10 do
   begin
   emfiler(f ,i,false);
   emfiler(f ,i,true);
   end;
   AfficherListe(f.t);
   readln;
   readln;


end.

