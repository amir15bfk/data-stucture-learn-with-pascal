program math_examples;

{$mode objfpc}{$H+}

uses math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

begin
   writeln(' 1 + 1 = ',1+1);
   writeln(' 2 - 1 = ',2-1);
   writeln(' 2 * 2 = ',2*2);
   writeln(' 4 / 2 = ',4/2:0:5);
   writeln(' 5 div 2 = ',2 div 1);
   writeln(' 5 mod 2 = ',2 mod 1);
   writeln(' 4 ^ 2 = ',power(4,2):0:5);
   readln;
   writeln(' 10 / 3 = ',10 / 3);
   writeln(' 10 / 3:0:2 = ',10 / 3:0:2);
   writeln(' 10 / 3:5:2 = ',10 / 3:5:2);
   writeln(' 10 / 3:10:2 = ',10 / 3:10:2);
   readln;
   writeln(' ( 1 + 2 ) * 3 = ',(1+2)*3);
   writeln(' 1 + 2 * 3 = ',1+2*3);

   readln;
   readln;


end.

