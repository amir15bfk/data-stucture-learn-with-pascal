unit AlcFree;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, llculibplus;
const
  memsize=32768;


procedure initMemory(var M:memory);
function firstFit(var M : memory;T:integer):boolean;
implementation
  procedure initMemory(var M:memory);
  begin
    new(m);
    aff_fadr(m,0);
    aff_taille(m,memsize);
  end;
  function firstFit(var M : memory;T:integer):boolean;
  var p:liste;  B:boolean;
  begin
    p:=m;
    B:=false ;
    while(p<>nil) and (not B) do
      begin
           if taille(p)>=T then
           begin
           b:=true;
           aff_taille(p, taille(p)-T);
           aff_fadr(p, fadr(p)+T);
           end;
      end;

  end;

end.

