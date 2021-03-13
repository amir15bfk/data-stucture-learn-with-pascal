unit arbreBinPlus;

{$mode objfpc}{$H+}

interface

uses
  Classes, arbreBin;
procedure afficherParOrdre(var arb:TarbreBin);

implementation
procedure afficherParOrdre(var arb:TarbreBin);
begin
  if arb<>nil then
  begin
   afficherParOrdre (FG(arb));
    write(' ',val(arb));
   afficherParOrdre (FD(arb));

  end;
end;

end.

