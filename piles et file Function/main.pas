program main;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes ,files ,sysutils
  { you can add units after this };
procedure FromA(n:integer);
var f:Tfile;  s,x:String;
              i,j:integer;
begin
    InitFile(f);
    s:='A';
    for j:=1 to n do
    begin
      for i := 1 to length(s) do
          begin
            writeln(S[i]);
       enfiler(f,s[i]);
       end;
     s:='';
     writeln(s);
     while not FileVide(F) do
     begin
     desenfiler(f,x);
     writeln(s);
    case x of
    'A':appendstr( s,'ABC');
    'B':appendstr( s,'BC');
    'C':appendstr( s,'A');
     end;
     end;
     writeln('etape ',j,' : ',s);
    end;

end;
begin
  FromA(5);
  readln;
  readln;
end.

