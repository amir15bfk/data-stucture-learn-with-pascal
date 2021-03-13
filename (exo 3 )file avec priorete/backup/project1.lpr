program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, fileAvecPriorite, llculibplus
  { you can add units after this };
var f:fileP;  x,i:integer;  pr:boolean;
begin
   initFileP(f);
   for i:=1 to 10 do
   begin
   emfiler(f ,i,false);
   emfiler(f ,i,true);
   end;
   for i:=1 to 10 do
   begin
   dismfiler(f ,x,pr);
   writeln(x,' ', pr);
   end;
   AfficherListe(f.t);
   readln;
   readln;


end.

