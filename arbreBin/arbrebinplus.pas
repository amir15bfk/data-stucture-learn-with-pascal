unit arbreBinPlus;

{$mode objfpc}{$H+}

interface

uses
  Classes, arbreBin,files;
procedure afficherParPreOrdre( arb:TarbreBin);
procedure afficherParOrdre( arb:TarbreBin);
procedure afficherParPostOrdre( arb:TarbreBin);
procedure afficherEnLargeur( arb:TarbreBin);
procedure ajouteElement(var arb:TarbreBin;x:TypeDeBase);
procedure creeArebre(var arb:TarbreBin);
function Min(arb:TarbreBin):typedebase;
function Max(arb:TarbreBin):typedebase;
Function search(arb:TarbreBin;x:Integer):Boolean;
procedure close(var arb:TarbreBin);
procedure supprime(var arb:TarbreBin;X:integer);

function nombreFilsImpair(arb : Tarbrebin):integer;
function nombreFilsPair(arb : Tarbrebin):integer;
procedure AfficherArbre2(arb:TarbreBin);
procedure AfficherArbre3(arb:TarbreBin);

function EstQuasiParfait(arb:TarbreBin):boolean;

procedure printVal(arb:Tarbrebin);
procedure printTree (arb:Tarbrebin);
procedure printTree (arb:Tarbrebin;isLeft:boolean;indent:String);

implementation

procedure afficherParPreOrdre( arb:TarbreBin);
begin
  if arb<>nil then
  begin
   writeln(' ',val(arb));
   afficherParPreOrdre(FG(arb));
   afficherParPreOrdre(FD(arb));
  end;
end;
procedure afficherParOrdre( arb:TarbreBin);
begin
  if arb<>nil then
  begin
   afficherParOrdre(FG(arb));
    writeln(' ',val(arb));
   afficherParOrdre(FD(arb));
  end;
end;
procedure afficherParPostOrdre( arb:TarbreBin);
begin
  if arb<>nil then
  begin
   afficherParPostOrdre(FG(arb));
   afficherParPostOrdre(FD(arb));
   writeln(' ',val(arb));

  end;
end;
procedure afficherEnLargeur( arb:TarbreBin);
var  f:Tfile; temp:Tarbrebin;
  begin
    initFile(f);
    enfiler(f,arb);
    while not fileVide(f) do
          begin

           desenfiler(f,temp);
           if temp<>nil  then
              begin
           writeln (val(temp));
           enfiler(f,Fg(temp));
           enfiler(f,FD(temp));
              end;
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
          else
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
              supprime(arb^.FD,temp);
             end
             else
             begin
              temp:=max(FG(arb));
              aff_val(arb,temp);
              supprime(arb^.FG,temp);
             end ;
             end
      end
      else if (val(arb)<x )then
         supprime(arb^.FD,x)
         else
           supprime(arb^.FG,x);


end;
function nombreFilsImpair(arb : Tarbrebin):integer;
var s:integer;
begin
  s:=0;
  if arb <> nil then
     begin
       s:=nombreFilsImpair(FG(arb))+nombreFilsImpair(FD(arb));
       if  ((FG(arb)= nil ) and (FD(arb)<> nil )) or ((FG(arb)<> nil ) and (FD(arb)= nil )) then
             s:=s+1;
     end;

  nombreFilsImpair:=s;
end;
function nombreFilsPair(arb : Tarbrebin):integer;
var s:integer;
begin
  s:=0;
  if arb <> nil then
     begin
       s:=nombreFilsPair(FD(arb)) +nombreFilsPair(FG(arb));
        if  (FG(arb)<> nil ) and (FD(arb)<> nil ) then
       s:=s+1;
     end;
   nombreFilsPair:=s;
end;
procedure AfficherArbre2(arb:TarbreBin);
begin
  if arb<>nil then
     begin
     write('{');
     AfficherArbre2(FG(arb));
     write(', ',val(arb),' ,');

     AfficherArbre2(FD(arb));

     write('}');
     end else write('...');
end;
procedure AfficherArbre3(arb:TarbreBin);
begin
  if arb<>nil then
     if (FG(arb)<> nil) or  (FD(arb)<> nil)  then
     begin
     write('{');
     AfficherArbre3(FG(arb));
     write(',',val(arb),',');

     AfficherArbre3(FD(arb));

     write('}');
     end else  write(val(arb))
     else write('...');
end;
function EstQuasiParfait(arb:TarbreBin):boolean;
begin
  if arb<>nil then
  begin
  if (FG(arb)=nil ) and (FD(arb)<>nil)  then
  begin
  if ((FG(FD(arb))=nil ) and (FD(FD(arb))=nil )) then
  EstQuasiParfait:= true
  else EstQuasiParfait:=false;
  end
  else if (FG(arb)<>nil ) and (FD(arb)=nil)  then
  begin
  if ((FG(FG(arb))=nil ) and (FD(FG(arb))=nil )) then
  EstQuasiParfait:= true
  else EstQuasiParfait:=false;
  end else  EstQuasiParfait:= EstQuasiParfait(FG(arb)) and EstQuasiParfait(FD(arb));

  end else EstQuasiParfait:=true;
end;

procedure printVal(arb:Tarbrebin);
begin
  if arb=nil then
     write('<nil>')
  else
     write(' ',val(arb));
  writeln('');
end;
procedure printTree (arb:Tarbrebin);
 begin
   if arb <>nil then
      begin
   if FD(arb)<>nil then
      printTree(FD(arb), false, '');
      printVal(arb);
    if FG(arb)<>nil then
      printTree(FG(arb), true, '');

      end
   else printVal(arb);

 end;

procedure printTree (arb:Tarbrebin;isLeft:boolean;indent:String);
begin
  if FD(arb)<>nil then
     if  isLeft then
        printTree (FD(arb), false, indent+' |      ')
        else printTree (FD(arb), false, indent+'        ');
  write(indent);
  if isLeft then
     write(' \')
     else
        write(' /');
    write('----- ');
    printVal(arb);

    if FG(arb)<>nil then
     if  isLeft then
        printTree (FG(arb), true, indent+'        ')
        else printTree (FG(arb), true, indent+' |      ');


end;

end.
