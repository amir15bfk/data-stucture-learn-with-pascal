unit llculibplus;

{$mode objfpc}{$H+}

interface

uses llculib;
 const
   NULL = nil;
type
      memory = liste;
    TRetour = record
      prec, cour : liste;
    end;

procedure AfficherMemory(l:liste);
function AddInTheBegin(var l:liste; x,y:TypeDeBase) : boolean;
function Rechercher(l:liste;x:TypeDeBase):boolean;
procedure Supprimer(var l:liste;x:TypeDeBase);
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
     retour.prec  :=nill;
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

procedure Supprimer(var l:liste;x:TypeDeBase);
var
         retour:TRetour;

begin
     retour := RechercheNonBooleenne(l,x);
     if retour.cour <> NULL then     (*l'élément à supprimer a été trouvé *)
     begin
        if retour.prec = NULL then   (*l'élément est en tête de liste *)
           l := adr(l)
        else
            aff_adr(retour.prec, adr(retour.cour));
        libere(retour.cour);

     end

end;

procedure AfficherMemory(l:liste);
begin
     while l<>NULL do
     begin
          write('|',fadr(l),'|',taille(l),'|');
          l := adr(l);
          if l = NULL then
             writeln('--#')
          else
              write(' -> ');
     end;
end;

function AddInTheBegin(var l:liste; x,y:TypeDeBase):boolean;
var
   p:memory;
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
