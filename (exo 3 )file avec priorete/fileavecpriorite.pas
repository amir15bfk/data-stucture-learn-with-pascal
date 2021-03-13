unit fileAvecPriorite;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,llculibplus,llculib;
type
  fileP= record
    t,qp,q:liste;

  end;
procedure emfiler(var f:fileP;x:integer;p:boolean);
procedure dismfiler(var f:fileP;var x:integer;var pr:boolean);
procedure initFileP(var f:fileP);


implementation
 procedure initFileP(var f:fileP);
 begin
  initListe(f.t );
  initListe(F.qp);
  initListe(f.q);
 end;

 procedure emfiler(var f:fileP;x:integer;p:boolean);
 var  E:liste;
 begin
   new(E);    aff_val(E,x);
   aff_priorite(E,p);
   if f.t=nil then begin

        f.t:=E;
    if p then
        f.qp:=E
    else
     f.q:=E;
   end
 else
  if p then  begin
      if F.qp = nil then
          begin
           f.qp:=E;
           aff_adr(f.qp,f.t);
           f.t:=E;
           end
      else begin
           aff_adr( E,adr(f.qp));
           aff_adr(f.qp,E);
           f.qp:=E;
           end;
      end
  else
  begin
           if F.q = nil then
          begin
           f.q:=E;
           aff_adr(f.qp,f.q);
           aff_adr( E,nil);
           end
      else begin
           aff_adr( E,nil);
           aff_adr(f.q,E);
           f.q:=E;
           end;

  end;

 end;
 procedure dismfiler(var f:fileP;var x:integer;var pr:boolean);
 var  p:liste;
   begin if f.t= nil then writeln('file vide')
    else
    begin
        p:=f.t;
        f.t:=adr(f.t);
        x:=valeur(p);
        pr:=priorite(p);
        Libere(p);
    end;
   end;

end.

