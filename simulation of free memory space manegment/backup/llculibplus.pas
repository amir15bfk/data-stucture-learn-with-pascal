unit llculibplus;

{$mode objfpc}{$H+}

interface

uses llculib;
 const
   NULL = nil;
type

    TRetour = record
      prec, cour : Liste;
    end;

procedure AfficherListe(l:Liste);
function AjouterEnTete(var l:Liste; x:TypeDeBase) : boolean;
function Rechercher(l:liste;x:TypeDeBase):boolean;
function Supprimer(var l:Liste;x:TypeDeBase):boolean;
function RechercheNonBooleenne(l:liste;x:TypeDeBase):TRetour;

implementation
function Rechercher(l:liste;x:TypeDeBase):boolean;
var
         trouve:boolean;
begin
     trouve:= false;
     while (not trouve) and (l<>NULL) do
           if x = taille(l) then
              trouve := true
           else
               l := adr(l);
     Rechercher := trouve;
end;

function RechercheNonBooleenne(l:liste;x:TypeDeBase):TRetour;
var
         trouve:boolean;
         retour : TRetour;
begin
     retour.prec  := NULL;
     retour.cour := l;
     trouve:= false;
     while (not trouve) and (retour.cour<>NULL) do
           if x = taille(retour.cour) then
              trouve := true
           else
               begin
                    retour.prec := retour.cour;
                    retour.cour := adr(retour.cour);
               end;
     RechercheNonBooleenne := retour;
end;

function Supprimer(var l:Liste;x:TypeDeBase):boolean;
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

procedure AfficherListe(l:Liste);
begin
     while l<>NULL do
     begin
          write('|',fadr(l),'|',taille(l),'|');
          l := adr(l);
          if l = NULL then
             writeln(' -#')
          else
              write(' -> ');
     end;
end;

function AjouterEnTete(var l:Liste; x:TypeDeBase; y:TypeDeBase):boolean;
var
   p:Liste;
   sortie : boolean;
begin
     new(p);
     sortie := false;
     if p<>NULL then
     begin
          aff_fadr(p, x);
          aff_taille(p, y);
          aff_adr(p,l);
          l := p;
          sortie := true;
     end;
end;
end.
