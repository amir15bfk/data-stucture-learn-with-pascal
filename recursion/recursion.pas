program recursion;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
type
  table=array [1..5] of  integer ;


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
function minR( T:table ;s:integer ;e:integer):integer;
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
function maxR( T:table ;s:integer ;e:integer):integer;
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
function sumRT( T:table ;s:integer ;e:integer):integer; //T[s]+T[s+1]+...+T[e]

begin

 if s=e then
 begin
 sumRT := T[e];
 end
 else
    sumRT:=T[s]+sumRT(T,s+1,e);

end;
function mulRT( T:table ;s:integer ;e:integer):integer;  //T[s]*T[s+1]*...*T[e]
 var temp:integer;
begin

 if s=e then
 begin
 temp := T[e];
 end
 else
    temp:=T[s]*mulRT(T,s+1,e);

 mulRT := temp;
end;

function moyT( T:table;s:integer ;e:integer):real;

begin
  moyT:=sumRT(T,s,e)/(e-s+1);

end;
function valPascal(i,j:integer):integer;
begin
 if (j>i)then valPascal:=0
 else
 if (i=j) or (j=0)  then
 valPascal:=1
 else valPascal:=valPascal(i-1,j)+valPascal(i-1,j-1);

end;


procedure affMPascal(n:integer);
var i,j:integer;
begin
 for i:=0 to n do
 begin
 for j:=0 to i do
 write(valPascal(i,j),' ');
 writeln();
 end;

end;
//roman to decimal
  function eval(r:char):integer;
  begin
   case (r) of
   'M':eval:=1000;
   'D':eval:=500;
   'C':eval:=100;
   'L':eval:=50;
   'X':eval:=10;
   'V':eval:=5;
   'I':eval:=1;
end;
  end;
function RtoD(R:String):integer;
begin
 if (length(R)=0) then
 RtoD:=0
 else if (length(R)=0) then
 RtoD:= eval(R[1])
 else if (eval(R[1])<eval(R[2])) then
 RtoD:= eval(R[2])- eval(R[1])+RtoD(copy(R,3,length(R)-2))
 else
   RtoD:= eval(R[1])+RtoD(copy(R,2,length(R)-1));

end;

var T:array [1..5] of  integer ;  s:String;
begin
  //hanoi(3,'A','C','B');
  //writeln(pgcd(16,12));
  //writeln(sum(3));
  //T[1]:=5;
  //T[2]:=3;
  //T[3]:=6;
  //T[4]:=2;
  //T[5]:=1;
  //writeln(minR(T,1,5));
  //writeln(maxR(T,1,5));
  //writeln(sumRT(T,1,5));
  //writeln(mulRT(T,1,5));
  //writeln(moyT(T,1,5):0:5);
  //writeln(valPascal(4,2));
  //affMPascal(15);
  s:='XIV';
  writeln (RtoD(s));
  readln;
  readln;
end.

