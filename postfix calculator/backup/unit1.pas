unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ActnList,piles;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);


  private

  public

  end;
  function toPostfix(infix:String):String;
  function isOperator(c:char):integer;
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'7';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'8';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'9';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'*';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'4';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'5';
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'0';
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  edit1.text:=toPostfix('1+1*2');

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   edit1.text:='';
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'1';
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'2';
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'3';
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'+';
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'^';
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'/';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'6';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  edit1.text:=edit1.text+'-';
end;
function isOperator(c:char):integer;
begin
  if (c = '+') or (c = '-')  then
     isOperator:=1
     else if (c = '*') or (c = '/')  then
        isOperator:=2
        else if (c = '(') or (c = ')')  then
           isOperator:=3
           else
                isOperator:=0;

end;

function toPostfix(infix:String):String;
var s:String;    p:pile; i:integer;
begin
  s:='';
  initPile(p);
  for i:= 1 to length(infix) do
     begin
     if (0=isOperator(infix[i]))then
     s:=s+ infix[i]
     else if (infix[i]='(')then
         empiler(p,'(');

     end;

     toPostfix:=s;
end;

end.

