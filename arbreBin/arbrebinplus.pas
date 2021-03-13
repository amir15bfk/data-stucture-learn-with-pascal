unit arbreBinPlus;

{$mode objfpc}{$H+}

interface

uses
  Classes, arbreBin;
procedure afficherParOrdre( arb:TarbreBin);

implementation
procedure afficherParOrdre( arb:TarbreBin);
begin
  if arb<>nil then
  begin
   afficherParOrdre(FG(arb));
    write(' ',val(arb));
   afficherParOrdre(FD(arb));

  end;
end;

end.

