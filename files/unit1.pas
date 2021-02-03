unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
TYPE
  TEnregistrement=  INDIVIDU;
  INDIVIDU = RECORD
 Nom : string[20] ;
 Prenom : string[20] ;
 Tp1 : real ;
 Tp2 : real ;
End ;
function compteLeNombreDEnregistrements( fichier : FILE OF  TEnregistrement):Integer ;

implementation
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

end.

