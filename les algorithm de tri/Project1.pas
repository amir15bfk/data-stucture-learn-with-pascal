program Project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
const Tmax=100;
type tableau= array [1..Tmax]of integer;
procedure TriParSelection (var T:tableau;n:integer);
var i,j,temp,pmin:integer;
begin
    for i:=1 to n-1 do
    begin
    pmin:=i;
    for j:=i+1 to n do
        if T[pmin]>T[j] then
        pmin:=j;

    if pmin<>i then
    begin
      temp:=T[i];
      T[i]:=T[pmin];
      T[pmin]:=temp;
    end;
end;
end;
procedure TriParBuller(var T:tableau;n:integer);
var temp,i,j:integer; flag:boolean;

  begin
      flag:=true;
      j:=n;
      while (j>=2) and flag do
            begin
            flag:=false;
            for i:=1 to j-1 do
            if T[i]>T[i+1] then
            begin
              temp:= T[i];
              T[i]:= T[i+1];
              T[i+1]:=temp;
              flag:=true;
            end;
            j:=j-1;
            end;

  end;
procedure TriParInsersion(var T:tableau;n:integer);
var  i,j,temp:integer;
  begin
      for i:=2 to n do
      begin
      temp:=T[i];
      j:=i-1;
      while (T[j]>temp) and (j>0) do
            begin
            T[j+1]:=T[j];
            j:=j-1;
            end;
      T[j+1]:=temp;
      end;

  end;

procedure afficherT(var T:tableau;n:integer);
var i:integer;
begin
    for i:=1 to n do
    write('|',T[i],'|');
    writeln('|/0|');
    readln;

end;

var T:tableau;
begin
  T[1]:=5;
  T[2]:=4;
  T[3]:=3;
  T[4]:=2;
  T[5]:=1;
  afficherT(T,5);
  TriParInsersion(T,5);
  afficherT(T,5);
end.

