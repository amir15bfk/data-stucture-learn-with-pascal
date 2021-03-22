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
function nombreFilsIM(arb : Tarbrebin):integer;

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
function nombreFilsIM(arb : Tarbrebin):integer;
begin
  if arb = nil then
      nombreFilsIM:=0
  else

    if  (FG(arb)<> nil ) or (FD(arb)<> nil ) then
      begin
       if FG(arb) = nil then
       nombreFilsIM:=1+nombreFilsIM(FD(arb))
       else  if FD(arb) = nil then
             nombreFilsIM:=1+nombreFilsIM(FG(arb));
      end
      else  nombreFilsIM:=0;

end;
function nombreFilsPair(arb : Tarbrebin):integer;
begin
  if arb = nil then
      nombreFilsPair:=0
  else

    if  (FG(arb)<> nil ) and (FD(arb)<> nil ) then
      begin

       nombreFilsPair:=1+nombreFilsPair(FD(arb)) +nombreFilsPair(FG(arb));
      end
      else begin
       if  (FG(arb)<> nil ) then
            nombreFilsPair:=nombreFilsPair(FG(arb))
            else if (FD(arb)<> nil ) then
            nombreFilsPair:=nombreFilsPair(FD(arb))
            else nombreFilsPair:=0;
      end;

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
