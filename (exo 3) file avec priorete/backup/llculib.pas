unit llculib;

{$mode objfpc}{$H+}


interface
type

    TypeDeBase  = Integer;
    liste = ^maillon;
    maillon = record
      v : TypeDeBase;
      p:boolean;
      suiv : ^maillon;
    end;
function valeur(l:liste):TypeDeBase;
function priorite(l:liste):boolean;
procedure Libere(l:liste);
function adr(l:liste):liste;
procedure aff_adr(l,p:liste);
procedure aff_priorite( l:liste;x:boolean);
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
function priorite(l:liste):boolean;
begin
     priorete:=l^.p;
end;
procedure aff_priorite( l:liste;x:boolean);
begin
     l^.p:=x;
end;

end.

