unit AlcFree;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, llculib,llculibplus;
const
  memsize=32768;


procedure initMemory(var M:liste);
function firstFit(var M : liste;T:integer):integer;
procedure libere(var m:liste;A,T:integer);
procedure chack(var m:liste);
implementation
procedure initMemory(var M:liste);
  begin
    new(m);
    aff_fadr(m,0);
    aff_taille(m,memsize);
  end;
procedure libere(var m:liste;A,T:integer);
var p,c,q:liste; s:integer;
begin
    p:=m;
    s:=-1 ;
    initListe(c);
    new(q);
    aff_taille(q,T);
    aff_fadr(q,A);
    aff_adr(q,nil);
    while(p<>nil) and (s <0) do
      begin
           if fadr(p)>A then
           begin
           s:=1;
           end
           else begin
                    c:=p;
                    p:=adr(p);
                end;

      end;
      if p<>nil then
       aff_adr(q,p);
       if p<>m then
       aff_adr(c,q)
       else begin
       m:=q;
       end;

  //need to add check
   chack(m);

end;
procedure chack(var m:liste);
var p,q:liste; doSameThink:boolean;
  begin
      q:=m;
      p:=adr(m);
      doSameThink:=false;
      while p<>nil do
        begin
        if ((fadr(q)+taille(q))>fadr(p)) then
        begin
          aff_taille(q,taille(q)+ fadr(p)+taille(p)-fadr(q)-taille(q));
          aff_taille(p,0);
          doSameThink:=true;
        end;
        if fadr(q)+taille(q)>memsize then
        aff_taille(q,memsize-fadr(q));
        q:=p;
        p:=adr(p);
        end;
      Supprimer(m,0);
      if doSamethink then
      chack(m);
  end;

function firstFit(var M : liste;T:integer):integer;
  var p:liste; s:integer;
  begin
    p:=m;
    s:=-1 ;
    while(p<>nil) and (s <0) do
      begin
           if taille(p)>=T then
           begin
           s:=fadr(p);
           aff_taille(p, taille(p)-T);
           aff_fadr(p, fadr(p)+T);
           end;
           p:=adr(p);
      end;

    Supprimer(m,0);
    firstFit:=s;
  end;

end.

