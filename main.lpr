program main;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
procedure FromA(n:integer);
var f:Tfile;  s,x:String;
              i,j:integer;
begin
    s:='A';
    for j:=1 to n do
    begin
      for i := 1 to length(s) do
       emfiler(f,s[i]);

     while not fileVide(f) do
     begin
  desenfiler(f,x);
  if x='A' then
  s:=s+'ABC'
  else
    if x='B' then
    s:=s+'BC'
    else s:=s+'A';
     end;
     writeln('etape ',n,' : ',s);
    end;

end;
begin
  FromA(5);
  readln;
  readln;
end.

