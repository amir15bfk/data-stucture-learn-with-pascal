program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, unit1
  { you can add units after this };
Label 1 ;

TYPE
  TEnregistrement=  INDIVIDU;
  INDIVIDU = RECORD
 Nom : string[20] ;
 Prenom : string[20] ;
 Tp1 : real ;
 Tp2 : real ;
End ;
VAR    ETUDIANT : array[1..100]  OF  INDIVIDU ;
Moy : real ;
I,N :integer ;
Fin : Boolean ;
Fichier1 : FILE OF  INDIVIDU ;
function compteLeNombreDEnregistrements( fichier : FILE OF  TEnregistrement):Integer ;
var I:= Integer;
begin
     RESET(Fichier) ;
  I:=1;
WHILE  NOT  EOF(Fichier)  DO
  BEGIN
 Seek(Fichier, I)
 I :=I+1 ;
  End ;
     CLOSE(Fichier) ;
      compteLeNombreDEnregistrements:=I;
end;
BEGIN
   ASSIGN(Fichier1,'D:\eleves.PAS') ;
   Rewrite(Fichier1) ;
   Writeln('SAISIE DES DONNES DANS Fichier1') ;
Fin := False ;
I :=1 ;
WHILE  NOT Fin  DO
     BEGIN
Writeln('Appuyer sur ENTREE Pour  Terminer la saisie') ;
Write('LE NOM : ') ;READLN(ETUDIANT[I].Nom) ;
If (ETUDIANT[I].Nom  = '') then
goto 1 ;
Write('LE PRENOM : ') ;READLN(ETUDIANT[I].Prenom) ;
Write('NOTE DE TP1 : ') ;READLN(ETUDIANT[I].Tp1) ;
Write('NOTE DE TP2 : ') ;READLN(ETUDIANT[I].Tp2) ;
Write(Fichier1,ETUDIANT[I]) ;
I :=I+1 ;
    End ;
1 :  Close(Fichier1) ;

writeln('LECTURE DU FICHIER ET CALCULE DE LA MOYENNE DES TP') ;
     {Elle n’est pas nécessaire mais on le fait quand même }
     {car les infos dont on a besoin se trouvent déjà dans le tableau ETUDIANT}
     RESET(Fichier1) ;
     I :=1 ;
     WHILE  NOT  EOF(Fichier1)  DO
  BEGIN
 READ(Fichier1,ETUDIANT[I]) ;
 I :=I+1 ;
  End ;
      Writeln('AFFICHAGE DES RESULTATS : APPUYER SUR UNE TOUCHE') ;
      Readln;Readln;
      N := I - 1 ;
      FOR  I := 1  TO  N  DO
BEGIN
  MOY :=  (ETUDIANT[I].Tp1  + ETUDIANT[I].Tp2)/2 ;
  write(ETUDIANT[I].Nom) ;
  write(ETUDIANT[I].Prenom) ;
  write(ETUDIANT[I].Tp1:6 :2); {avec 2 chiffres après la virgule}
  write(ETUDIANT[I].Tp2:6 :2) ;
  write(MOY:6 :2) ;
  writeln;
End ;
     CLOSE(Fichier1) ;
     writeln('compte Le Nombre D"Enregistrements :', compteLeNombreDEnregistrements( Fichier1));
     Readln ;Readln ;
END.

