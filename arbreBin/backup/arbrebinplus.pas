unit arbreBinPlus;

{$mode objfpc}{$H+}

interface

uses
  Classes, arbreBin;
procedure afficherParOrdre( arb:TarbreBin);
procedure ajouteElement(var arb:TarbreBin;x:TypeDeBase);
procedure creeArebre(var arb:TarbreBin);
function Min(arb:TarbreBin):typedebase;
function Max(arb:TarbreBin):typedebase;
Function search(arb:TarbreBin;x:Integer):Boolean;
procedure close(var arb:TarbreBin);
procedure supprime(var arb:TarbreBin;X:integer);
implementation
procedure afficherParOrdre( arb:TarbreBin);
begin
  if arb<>nil then
  begin
   afficherParOrdre(FG(arb));

    writeln(' ',val(arb));
   afficherParOrdre(FD(arb));
  end;
end;
procedure ajouteElement(var arb:TarbreBin;x:TypeDeBase);
begin
  if arb = nil then
  begin
   allouer(arb);
   aff_val(arb,x);
  end else
      if x < val( arb) then
          ajouteElement( arb^.FG,x)
          else if x > val( arb) then
          ajouteElement( arb^.FD,x);
end;
procedure creeArebre(var arb:TarbreBin);
var n,i,x :integer;
begin
  initArbre(arb);
  writeln('give me n :');
  readln(n);
  for i:=1 to n do
  begin
    writeln('give me an integer');
    readln(x);
    ajouteElement( arb,x);
  end;

end;
function Min(arb:TarbreBin):typedebase;
begin
  if arb <> nil then
  if FG(arb)=nil then
   min:=val(arb)
   else min:= min(FG(arb))
   else write('arbre Vide ');
end;
function Max(arb:TarbreBin):typedebase;
begin
  if arb <> nil then
  if FD(arb)=nil then
   Max:=val(arb)
   else Max:= Max(FD(arb))
   else write('arbre Vide');
end;
Function search(arb:TarbreBin;x:Integer):Boolean;
begin
  if (arb=nil) then search:= false
  else if (val(arb)=x) then search:= true
       else if (val(arb)<x) then search:= search(FD(arb),x)
            else if (val(arb)>x) then search:=search(FG(arb),x);
end;
procedure close(var arb:TarbreBin);
begin
  if arb <> nil then
       if (FD(arb)=nil) and (FG(arb)=nil)  then
          begin
          dispose(arb);
          arb:=nil;
          end
          else  begin
           close( arb^.FG);
           close( arb^.FD);
          end;
end;
procedure supprime(var arb:TarbreBin;X:integer);
var  temp:integer;
begin
  if arb<>nil then
     if val(arb)=x then
     begin
        if (FG(arb)=nil) and (FD(arb)=nil) then
           begin
           dispose(arb);
           arb:=nil;

           end
        else begin
         if FD(arb)<>nil then
             begin
              temp:=min(FD(arb));
              aff_val(arb,temp);
              supprime(arb^.FD,x);
             end
             else
             begin
              temp:=max(FG(arb));
              aff_val(arb,temp);
              supprime(arb^.FG,x);
             end ;
             end
      end
      else if (val(arb)<x )then
         supprime(arb^.FD,x)
         else
           supprime(arb^.FG,x);


end;

end.

