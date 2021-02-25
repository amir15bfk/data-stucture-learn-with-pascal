unit llcuavanceelib;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,llculib;
procedure affList(var l:liste);
procedure craeteList(var  l:liste,n:integer);
procedure SortList(var l:liste,n:integer);
implementation

procedure SortList(var l:liste);
var p,q,adrdeMIN:liste;
begin
    initListe(q);
    initListe(p);
    p:=l;

    while (adr(p)<>nil) || (p<>Nil) do
    begin
    min:=valeur(p);  q:=adr(p);   adrDemin:=p;
    while q<>nil do
    if valeur(q)<min then
    begin
    adrDeMin:=q;
    min:=valeur(q);
    end;
    x:=valeur(p);
    aff_val(p,valeur(adrDeMin));
    end;
end;
procedure craeteList(var  l:liste,n:integer);
var p:liste; i:integer;
begin
    initListe(p);
    for i:=1 to n do
    begin
        AllouerMaillon(p);
        writeln('gve me x');
        readln(x);
        aff_val(p,x);
        aff_adr(p,l);
        l:=p;
    end;
end;
procedure afficheList(var l:liste);
begin


end;



end.

