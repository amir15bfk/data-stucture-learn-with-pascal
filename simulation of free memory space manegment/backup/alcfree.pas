unit AlcFree;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, llculib,llculibplus;
const
  memsize=32768;


procedure initMemory(var M:memory);
function firstFit(var M : memory;T:integer):integer;
implementation
  procedure initMemory(var M:memory);
  begin
    new(m);
    aff_fadr(m,0);
    aff_taille(m,memsize);
  end;
  function firstFit(var M : memory;T:integer):integer;
  var p:liste; s:integer;
  begin
    p:=m;
    s:=-1 ;
    while(p<>nil) and (b<0) do
      begin
           if taille(p)>=T then
           begin
           s:=fadr(p);
           aff_taille(p, taille(p)-T);
           aff_fadr(p, fadr(p)+T);
           end;
           p:=adr(p);
      end;

    Supprimer(m,0);
    firstFit:=s;
  end;

end.

