unit llcuavanceelib;

{$mode objfpc}{$H+}

interface

uses llculib;
procedure AfficherListe(l:liste);
procedure AjouterEnTete(var l:liste; x:TypeDeBase);

implementation

procedure AfficherListe(l:liste);
begin
     while l<>nil do
     begin
          write(valeur(l));
          l := adr(l);
          if l = nil then
             writeln('.')
          else
              write(' -> ');
     end;
end;

procedure AjouterEnTete(var l:liste; x:TypeDeBase);
var
   p:liste;
begin
     new(p);
     if p<>nil then
     begin
          aff_val(p, x);
          aff_adr(p,l);
          l := p;
     end;
end;
end.

