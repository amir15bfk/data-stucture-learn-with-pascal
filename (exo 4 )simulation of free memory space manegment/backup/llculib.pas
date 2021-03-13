unit llculib;

{$mode objfpc}{$H+}


interface
type
    TypeDeBase = integer;
    liste = ^maillon;
    maillon = record
      v : TypeDeBase;
      suiv : ^maillon;
    end;
function valeur(l:liste):TypeDeBase;
procedure Libere(l:liste);
function adr(l:liste):liste;
procedure aff_adr(l,p:liste);
procedure aff_val(l:liste;x:TypeDeBase);
procedure AllouerMaillon(var l:liste);
procedure InitListe(l:liste);


implementation
procedure InitListe(l:liste);
begin
     l := nil;
end;

function valeur(l:liste):TypeDeBase;
begin
     valeur := l^.v;
end;

procedure Libere(l:liste);
begin
     dispose(l);
end;

function adr(l:liste):liste;
begin
     adr := l^.suiv;
end;

procedure aff_adr(l,p:liste);
begin
     l^.suiv:=p;
end;

procedure aff_val(l:liste;x:TypeDeBase);
begin
     l^.v := x;
end;

procedure AllouerMaillon(var l:liste);
begin
     new(l);
end;

end.

