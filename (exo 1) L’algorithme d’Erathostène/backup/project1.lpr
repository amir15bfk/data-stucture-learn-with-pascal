program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, llculib ,llculibplus
  { you can add units after this };
procedure Erathostene(var l:TListe;n:integer);
var p,q,c:Tliste;  i:integer;
begin
  initListe(q);
  initListe(p);
  initListe(c);
  for i:=n downto 2  do
  AjouterEnTete(l,i);

  q:=l;
  while valeur(q)<=(n/2) do
  begin
    p:=adr(q);
    c:=q;
    while p<>Null do
    begin
      if valeur(p) mod  valeur(q) = 0 then
      begin
         aff_adr(c,adr(p));
         Libere(p);
         p:=adr(c);
      end
      else
      begin
       c:=p;
       p:=adr(p);
       end;

    end;

    q:=adr(q);
  end;

      AfficherListe(l);

end;
var
  l:Tliste;

begin
   initListe(l);
   Erathostene(l,1000000);
   readln;
   readln;
end.

