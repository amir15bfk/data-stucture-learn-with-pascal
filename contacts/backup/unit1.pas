unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type
  contect = record
   nom : string;
   prenom : string;
   telephone : string;

  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;
  contacts : array [ 1..50] of contect;
  i,j : integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  contacts[i].nom:=Edit1.Text;
  contacts[i].prenom:=Edit2.Text;
  contacts[i].telephone:=Edit3.Text;
  i:=i+1;

  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  j:=1;
  while (j<i) do
  begin
  if
  ((contacts[j].nom=Edit1.Text) and (contacts[j].prenom=Edit2.Text) and (contacts[j].telephone=Edit3.Text) )
   then
  begin
  label4.Caption:=' EXIST ';
  Edit1.Text:=contacts[j].nom;
  Edit2.Text:=contacts[j].prenom;
  Edit3.Text:=contacts[j].telephone;
  break;
  end;
  j:=j+1;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  j:=1;
  while (j<i) do
  begin
  if
  ((contacts[j].nom=Edit1.Text) and (contacts[j].prenom=Edit2.Text) and (contacts[j].telephone=Edit3.Text) )
    then
  begin
  ShowMessage (' nom :'+contacts[j].nom+' prenom : '+ contacts[j].prenom+' num telephne : '+contacts[j].telephone + ' is delete');
  break;
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  end;
  j:=j+1;
  end;
  i:=i-1;
  while (j<i) do
  begin
   contacts[j] := contacts[j+1];
  end;
  end;



procedure TForm1.Button4Click(Sender: TObject);
begin
  j:=1;
  while (j<i) do
  begin
  if
  (contacts[j].nom=Edit1.Text)
    then
  begin
  label4.Caption:=' EXIST ';
  Edit1.Text:=contacts[j].nom;
  Edit2.Text:=contacts[j].prenom;
  Edit3.Text:=contacts[j].telephone;
  break;
  end;
  j:=j+1;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  j:=1;
  while (j<i) do
  begin
  if
  (contacts[j].prenom=Edit2.Text)
   then
  begin
  label4.Caption:=' EXIST ';
  Edit1.Text:=contacts[j].nom;
  Edit2.Text:=contacts[j].prenom;
  Edit3.Text:=contacts[j].telephone;
  break;
  end;
  j:=j+1;
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  j:=1;
  while (j<i) do
  begin
  if
  (contacts[j].telephone=Edit3.Text)
    then
  begin
  label4.Caption:=' EXIST ';
  Edit1.Text:=contacts[j].nom;
  Edit2.Text:=contacts[j].prenom;
  Edit3.Text:=contacts[j].telephone;
  break;
  end else begin label4.Caption:='NOT EXIST ';end;
  j:=j+1;
  end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';

end;





begin
  i:=1;


end.

