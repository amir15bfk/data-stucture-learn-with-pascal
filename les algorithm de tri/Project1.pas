program main;

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
//marge sort
procedure Fussion(var T:tableau;D,med,F:integer);
var i,j,k,h,g:integer; temp:tableau;
  begin
      i:=D;
      k:=1;
      j:=med+1;
     while (i<=med) and (j<=F) do
            begin
            if (T[i]<=T[j]) then
            begin
              temp[k]:=T[i];
              i:=i+1;
            end
            else
            begin
              temp[k]:=T[j];
              j:=j+1;
            end;
            k:=k+1;
            end;
      while i<=med do
            begin
              temp[k]:=T[i];
              k:=k+1;
              i:=i+1;
            end;
      while j<=F do
            begin
              temp[k]:=T[j];
              k:=k+1;
              j:=j+1;
            end;
      for i:=1 to k-1 do
          T[D+i-1]:=temp[i];
    end;

procedure TriParFussion(var T:tableau;D,F:integer);
var med:integer;
  begin
      if D<F then
      begin
        med:=(F+D)div 2;
        TriParFussion(T, D,med);
        TriParFussion(T, med+1,F);
        Fussion(T,D,med,F);
      end;
  end;
//quick sort
procedure TriRapide(var T:tableau;D,F:integer);
var G,Dr,piv,s,temp:integer;
  begin
      if D<F then
      begin
      G:=D;
      piv:=F;
      Dr:=f-1;
      s:=1;
      while g<=Dr do
      if s=1 then
           if T[G]>T[piv] then
           begin
           temp:= T[g];
           T[g]:=T[piv];
           T[piv]:=temp;
           piv:=g;
           g:=g+1;
           s:=2;
           end
           else
           G:=G+1

      else
          if T[Dr]<T[piv] then
           begin
           temp:= T[Dr];
           T[dr]:=T[piv];
           T[piv]:=temp;
           piv:=dr;
           dr:=dr-1;
           s:=1;
           end
           else
           dr:=Dr-1;

      TriRapide(T,d,piv-1);
      TriRapide(T,piv+1,F);



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
  T[1]:=10;
  T[2]:=9;
  T[3]:=8;
  T[4]:=7;
  T[5]:=6;
  T[6]:=5;
  T[7]:=4;
  T[8]:=3;
  T[9]:=2;
  T[10]:=1;
  afficherT(T,10);
  TriRapide(T,1,10);
  afficherT(T,10);
end.

