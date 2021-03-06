program main;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes   ,llculib,llculibplus, AlcFree
  { you can add units after this };

var M:memory;

begin
  initMemory(m);
  firstFit(m,1000);
  AfficherMemory(m);

  readln;
  readln;



end.

