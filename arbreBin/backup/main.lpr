program main;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, arbrebin, arbrebinPlus
  { you can add units after this };
var arb:TarbreBin;
begin
 initArbre(arb);
 allouer(arb);
 aff_val(arb,2);
 allouer(arb^.FG);
  aff_val(fg(arb),1);
  allouer(arb^.FD);
  aff_val(fd(arb),3);
  afficherParOrdre(arb);
  libere( fg(arb));
  libere( fd(arb));
  libere(arb);
  readln;
  readln;
end.

