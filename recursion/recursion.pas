program recursion;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
function fact(n:integer):Integer;
begin
  if (n=1) or  (n=0) then
  fact:=1
  else
    fact:=n*fact(n-1);

end;
function fib(n:integer):integer;
begin
   if (n=1) or  (n=0) then
   fib:=1
   else
     fib:=fib(n-1)+fib(n-2);
end;
procedure hanoi(n:integer;source,fin,aux:char);
begin
       if n>=1 then
       begin
         hanoi(n-1,source,aux,fin);
         writeln(source,'-->',fin);
         hanoi(n-1,aux,fin,source);
       end;

end;
function CBD(n:integer):integer;
begin
    if n<>0 then CBD:=n mod 10 + CBD(n div 10)*2
    else CBD:=0;
end;
function PGCD(a,b:integer):integer;
var r:integer;
begin
 r:= a mod b;
 if r<>0 then pgcd:= pgcd(b,r)
 else pgcd:=b;
end;
function sum(n:integer):integer;
begin
 if n = 1  then
 sum:=1
 else
   sum:=n+sum(n-1);

end;

begin
  //hanoi(3,'A','C','B');
  //writeln(pgcd(16,12));
  writeln(sum(3));
  readln;
  readln;
end.

