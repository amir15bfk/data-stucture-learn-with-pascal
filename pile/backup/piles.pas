unit Piles;

{$mode objfpc}{$H+}
interface
const
     TMax = 1000;
type
    TypeDeBasedesElementsDeLaPile = Integer;
    Pile = record
         t: array [1..Tmax] of TypeDeBasedesElementsDeLaPile;
         sommet : integer;
    end;


procedure empiler(var p:pile; x:TypeDeBasedesElementsDeLaPile);
procedure desempiler(var p:pile; var x:TypeDeBasedesElementsDeLaPile);
procedure InitPile(var p:pile);
function pileVide(var p:pile):boolean;
procedure Afficherpile( var p:pile);

implementation

procedure empiler(var p:pile; x:TypeDeBasedesElementsDeLaPile);
begin
     if p.sommet < TMax then
     begin
        p.sommet := p.sommet + 1;
        p.t[p.sommet] := x;
     end;
end;

procedure desempiler(var p:pile; var x:TypeDeBasedesElementsDeLaPile);
begin
     if p.sommet > 0 then
     begin
        x := p.t[p.sommet];
        p.sommet := p.sommet - 1;
     end;
end;

procedure InitPile(var p:pile);
begin
     p.sommet := 0;
end;
function pileVide(var p:pile):boolean;
begin
     if p.sommet=0 then
      pileVide:=true
      else pileVide:=false;
end;
procedure Afficherpile( var p:pile);
var i:integer;
begin
     for i:=1 to  p.sommet do
     writeln('| ',p.t[i] ,' |');
     writeln('----');
end;

end.

