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

begin
  hanoi(3,'A','C','B');
  readln;
  readln;
end.

