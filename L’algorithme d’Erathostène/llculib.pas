unit llculib;

{$mode objfpc}{$H+}


interface
const
  NULL=nil;
type
    TypeDeBase = integer;
    Tliste = ^maillon;
    maillon = record
      v : TypeDeBase;
      suiv : ^maillon;
    end;
function valeur(l:Tliste):TypeDeBase;
procedure Libere(l:Tliste);
function adr(l:Tliste):Tliste;
procedure aff_adr(l,p:Tliste);
procedure aff_val(l:Tliste;x:TypeDeBase);
procedure AllouerMaillon(var l:Tliste);
procedure InitListe(l:Tliste);


implementation
procedure InitListe(l:Tliste);
begin
     l := nil;
end;

function valeur(l:Tliste):TypeDeBase;
begin
     valeur := l^.v;
end;

procedure Libere(l:Tliste);
begin
     dispose(l);
end;

function adr(l:Tliste):Tliste;
begin
     adr := l^.suiv;
end;

procedure aff_adr(l,p:Tliste);
begin
     l^.suiv:=p;
end;

procedure aff_val(l:Tliste;x:TypeDeBase);
begin
     l^.v := x;
end;

procedure AllouerMaillon(var l:Tliste);
begin
     new(l);
end;

end.

