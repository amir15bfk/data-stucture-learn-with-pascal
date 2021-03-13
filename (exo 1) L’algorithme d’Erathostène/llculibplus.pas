unit llculibplus;

{$mode objfpc}{$H+}

interface

uses llculib;

type
    TRetour = record
      prec, cour : TListe;
    end;

procedure AfficherListe(l:TListe);
function AjouterEnTete(var l:TListe; x:TypeDeBase) : boolean;
function Rechercher(l:Tliste;x:TypeDeBase):boolean;
function Supprimer(var l:TListe;x:TypeDeBase):boolean;
function RechercheNonBooleenne(l:Tliste;x:TypeDeBase):TRetour;

implementation
function Rechercher(l:Tliste;x:TypeDeBase):boolean;
var
         trouve:boolean;
begin
     trouve:= false;
     while (not trouve) and (l<>NULL) do
           if x = valeur(l) then
              trouve := true
           else
               l := adr(l);
     Rechercher := trouve;
end;

function RechercheNonBooleenne(l:Tliste;x:TypeDeBase):TRetour;
var
         trouve:boolean;
         retour : TRetour;
begin
     retour.prec  := NULL;
     retour.cour := l;
     trouve:= false;
     while (not trouve) and (retour.cour<>NULL) do
           if x = valeur(retour.cour) then
              trouve := true
           else
               begin
                    retour.prec := retour.cour;
                    retour.cour := adr(retour.cour);
               end;
     RechercheNonBooleenne := retour;
end;

function Supprimer(var l:TListe;x:TypeDeBase):boolean;
var
         retour:TRetour;
         sortie : boolean;
begin
     retour := RechercheNonBooleenne(l,x);
     if retour.cour <> NULL then     (*l'élément à supprimer a été trouvé *)
     begin
        if retour.prec = NULL then   (*l'élément est en tête de liste *)
           l := adr(l)
        else
            aff_adr(retour.prec, adr(retour.cour));
        libere(retour.cour);
        sortie := true
     end
     else
         (*l'élément à supprimer n'a pas été trouvé *)
         sortie := false;
end;

procedure AfficherListe(l:TListe);
begin
     while l<>NULL do
     begin
          write(valeur(l));
          l := adr(l);
          if l = NULL then
             writeln('.')
          else
              write(' -> ');
     end;
end;

function AjouterEnTete(var l:TListe; x:TypeDeBase):boolean;
var
   p:TListe;
   sortie : boolean;
begin
     new(p);
     sortie := false;
     if p<>NULL then
     begin
          aff_val(p, x);
          aff_adr(p,l);
          l := p;
          sortie := true;
     end;
end;
end.

