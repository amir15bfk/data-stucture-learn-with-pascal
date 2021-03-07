program main;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes   ,llculib,llculibplus, AlcFree
  { you can add units after this };

var M,lastFit:memory; adrA,adrB,adrC:integer;

begin
  initMemory(m);
  initListe(lastFit);
  firstFit(m,10000);
  libere(m,300,200);
  libere(m,3000,800);
  libere(m,3900,300);
  libere(m,5000,350);
  AfficherMemory(m);
  nextFit(m,lastfit,150);
  AfficherMemory(m);
  nextFit(m,lastfit,150);
  AfficherMemory(m);
  nextFit(m,lastfit,20);
  AfficherMemory(m);

  AfficherMemory(m);
  nextFit(m,lastfit,150);
  AfficherMemory(m);
  nextFit(m,lastfit,150);
  AfficherMemory(m);
  nextFit(m,lastfit,20);
  AfficherMemory(m);
  libere(m,3000,4000);
  {m:=nil;
  AddInTheBegin(m,3000,800);
  AddInTheBegin(m,700,1800);
  AddInTheBegin(m,300,250);
  AfficherMemory(m);
  adrA:=firstFit(m,1000);
  AfficherMemory(m);
  adrB:=firstFit(m,200);
  AfficherMemory(m);
  adrC:=firstFit(m,800);
  AfficherMemory(m);
  writeln(' adrA = ' ,adrA,'  adrB = ' ,adrB,'  adrC = ' ,adrC);  }
  readln;
  readln;



end.

