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
  creeArebre(arb);

  afficherParOrdre(arb);
  writeln('Min : ',min(arb));
  writeln('Max : ',Max(arb));
  writeln('find 5 : ',search( arb,5));
  supprime(arb,5);

  writeln('find 5 : ',search( arb,5));
  afficherParOrdre(arb);
  close(arb);
  if arb=nil then
  begin
  write('gg');
  end;
  afficherParOrdre(arb);
  {initarbre(arb);
  allouer(arb);
  aff_val(arb,2);
  allouerG(arb);
  aff_val(fg(arb),1);
  allouerD(arb);
  aff_val(fd(arb),3);
  afficherParOrdre(arb);
  libere( fg(arb));
  libere( fd(arb));
  libere(arb); }
  readln;
  readln;
end.

