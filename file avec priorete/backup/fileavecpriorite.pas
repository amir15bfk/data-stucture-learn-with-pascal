unit fileAvecPriorite;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,llc;
type
  fileP= record
    t,qp,q:liste;

  end;
procedure emfiler(var f:fileP;x:integer;p:boolean);
procedure dismfiler(var f:fileP;x:integer;p:boolean);

implementation



end.

