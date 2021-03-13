unit llculib;

{$mode objfpc}{$H+}


interface
type
    TypeDeBase = integer;
    liste = ^maillon;
    maillon = record
      taille : TypeDeBase;
      fadr : TypeDeBase;
      suiv : ^maillon;
    end;
function taille(l:liste):TypeDeBase;
function fadr(l:liste):TypeDeBase;
procedure Libere(l:liste);
function adr(l:liste):liste;
procedure aff_adr(l,p:liste);
procedure aff_taille(l:liste;x:TypeDeBase);
procedure aff_fadr(l:liste;x:TypeDeBase);
procedure AllouerMaillon(var l:liste);
procedure InitListe(l:liste);


implementation
procedure InitListe(l:liste);
begin
     l := nil;
end;

function taille(l:liste):TypeDeBase;
begin
     taille := l^.taille;
end;
function fadr(l:liste):TypeDeBase;
begin
     fadr := l^.fadr;
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

procedure aff_taille(l:liste;x:TypeDeBase);
begin
     l^.taille := x;
end;
procedure aff_fadr(l:liste;x:TypeDeBase);
begin
     l^.fadr := x;
end;
procedure AllouerMaillon(var l:liste);
begin
     new(l);
end;

end.

