unit arbrebin;

{$mode objfpc}{$H+}

interface
uses
  Classes, SysUtils;

type TypeDeBase =integer;
     Tarbrebin =^noeud;
      noeud = record
        val:TypeDeBase;
        FG:Tarbrebin;
        FD:Tarbrebin;
      end;
procedure initArbre(var ARB:TarbreBin);
procedure aff_val( ARB:TarbreBin;x:TypeDeBase);
procedure aff_FG( ARB:TarbreBin;x:Tarbrebin);
procedure aff_FD( ARB:TarbreBin;x:Tarbrebin);
function val( ARB:TarbreBin):TypeDeBase;
function FG( ARB:TarbreBin):Tarbrebin;
function FD( ARB:TarbreBin):Tarbrebin;
procedure allouer( var ARB:TarbreBin);
procedure allouerG(var  ARB:TarbreBin);
procedure allouerD(var  ARB:TarbreBin);
procedure libere(var ARB:TarbreBin);
implementation
 procedure initArbre(var ARB:TarbreBin);
 begin
   arb:=nil;
 end;

procedure aff_val( ARB:TarbreBin;x:TypeDeBase);
begin
 arb^.val:=x;
end;

procedure aff_FG( ARB:TarbreBin;x:Tarbrebin);
begin
  arb^.FG:=x;
end;
procedure aff_FD( ARB:TarbreBin;x:Tarbrebin);
begin
  arb^.FD:=x;
end;
function val( ARB:TarbreBin):TypeDeBase;
begin
  val:=arb^.val;
end;
function FG( ARB:TarbreBin):Tarbrebin;
begin
  FG:=arb^.FG;
end;
function FD( ARB:TarbreBin):Tarbrebin;
begin
  FD:=arb^.FD;
end;
procedure allouer(var  ARB:TarbreBin);
begin
  new(arb);
  aff_FG(arb,nil);
  aff_Fd(arb,nil);
end;
procedure allouerG(var  ARB:TarbreBin);
begin
  new(arb^.FG);
  aff_FG(arb^.FG,nil);
  aff_Fd(arb^.FG,nil);
end;
procedure allouerD(var  ARB:TarbreBin);
begin
  new(arb^.FD);
  aff_FG(arb^.FD,nil);
  aff_Fd(arb^.FD,nil);
end;
procedure libere(var ARB:TarbreBin);
begin
  dispose(arb);
end;

end.
