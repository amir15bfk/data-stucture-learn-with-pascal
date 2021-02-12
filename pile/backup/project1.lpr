program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, Unit1,piles
  { you can add units after this };
procedure getMin(var p1:pile;var p2 :pile;var min:Integer);
var x: integer;
begin
     desempiler(p1,min);
     while not pileVide(p1) do
           begin
               desempiler(p1,x);
               if x<min then
               begin
               empiler(p2 ,min);
               min:=x;
               end
               else
               empiler(p2,x);
           end;

end;
procedure sortpile(var p:pile);
var p2,p3:pile; min :integer;
begin
     initpile(p2);
     initpile(p3);
while  not( pilevide(p) and pilevide(p2)) do
         begin
             if not pilevide(p)then
              getMin(p,p2,min)
              else
                getMin(p2,p,min);
             empiler(p3,min);
         end;
p:=p3;
end;
var p:pile;
  n,x ,i:integer;
begin

   initpile(p);

   repeat
   writeln('donner n<100');
   readln(n);
   until (n<100) and (n>0);
   for i:=1 to n do
   begin

       writeln('give me x');
       readln(x);
       empiler(p1,x);
   end;
   writeln('non sorted');
   Afficherpile(p);

   sortpile(p);

   writeln('sorted');
   Afficherpile(p);
   readln;
   readln;
end.

