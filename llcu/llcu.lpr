program llcu;

uses llculib, llcuavanceelib;

var
   x,n:integer;
   l:liste;
begin
     write('Donnez le nombre d''elements de la liste : ');
     readln(n);
     InitListe(l);
     while n>0 do
     begin
          readln(x);
          AjouterEnTete(l,x);
          n := n-1;
     end;
     writeln;
     AfficherListe(l);
     writeln('C''est fini!');

end.

