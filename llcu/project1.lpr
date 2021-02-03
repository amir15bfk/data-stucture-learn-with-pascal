program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var i,j,n,x:Integer;
  T:array [1..100] of Integer;

begin
  repeat
    writeln('give me the size of the table');
    readln(n);
  until (n>0) and (n<101);
  for i:=1 to n do
  begin
  write('T[',i,'] : ');
  readln(T[i]);
  j:=1;
  end;
  j:=1;
  while (j<n) do
  for i:=j to n-1 do
  begin
    if T[i]>T[i+1]  then
    begin
         x:=T[i+1];
         T[i+1]:=T[i];
         T[i]:=x ;
    end;
    j:=j+1;
  end;
  for i:=1 to n do
  writeln('T[',i,'] : ',T[i]);
  readln;
  readln;

end.





































