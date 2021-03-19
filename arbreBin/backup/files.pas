unit files;

{$mode objfpc}{$H+}

interface

const
     TMAX = 100;
type
    TypeQQ = string;
    TFile = record
      t:array[1..TMAX] of TypeQQ;
      queue : integer;
    end;


procedure InitFile(var F:TFile);
function FilePleine(var F: TFile):boolean;
procedure Enfiler(var F:TFile; x:TypeQQ);
function FileVide(var F: TFile):boolean;
procedure desenfiler(var F:TFile; var x:TypeQQ);

implementation

procedure InitFile(var F:TFile);
begin
     F.queue:=0;
end;

procedure Enfiler(var F:TFile; x:TypeQQ);
begin
     if not FilePleine(F) then
        begin
          F.queue := F.queue + 1;
          F.T[F.Queue] := x;
        end;
end;

procedure desenfiler(var F:TFile; var x:TypeQQ);
var
          i:integer;
begin
     if not FileVide(F) then
        begin
             x:=F.T[1];
             for i:=1 to F.queue do
                 F.T[i-1] := F.T[i];
             F.queue := F.queue -1;
        end
end;

function FileVide(var F: TFile):boolean;
var
   s:boolean;
begin
     if F.queue = 0 then S:= true else S:= false;
     FileVide := S;
end;

function FilePleine(var F: TFile):boolean;
var
   s:boolean ;
begin
     if F.queue = Tmax then S:= true else S:= false;
     FilePleine := S;
end;

end.

