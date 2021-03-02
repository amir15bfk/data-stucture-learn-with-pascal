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
function minR( T:array of  integer ;s:integer ;e:integer):integer;
var temp:integer;
begin

 if s=e then
 begin
 minR := T[s];
 end
 else begin
    temp:=minR(T,s+1,e);
   if (T[s]<temp) then
      minR:=T[s]
      else minR :=temp;
   end;
end;
function maxR( T:array of  integer ;s:integer ;e:integer):integer;
var temp:integer;
begin

 if s=e then
 begin
 maxR := T[s];
 end
 else begin
    temp:=maxR(T,s+1,e);
   if (T[s]>temp) then
      maxR:=T[s]
      else maxR :=temp;
   end;
end;
var T:array [0..5] of  integer ;
begin
  //hanoi(3,'A','C','B');
  //writeln(pgcd(16,12));
  //writeln(sum(3));
  T[1]:=5;
  T[2]:=3;
  T[3]:=6;
  T[4]:=2;
  T[5]:=1;
  writeln(minR(T,1,5));
  writeln(maxR(T,1,5));
  readln;
  readln;
end.

