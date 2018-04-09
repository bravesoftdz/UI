unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var a,b:integer;
rez:extended;
begin
try
a:=strtoint(Edit1.Text);
b:=strtoint(Edit2.Text);
rez:=a/b;
except
on EZeroDivide do
begin
ShowMessage('������� ������� �� ����!');
Edit2.SetFocus;
memo1.Lines.Clear;
end;
on EConvertError do ShowMessage('������ ��������������!')
else ShowMessage('������ � ���������� �����!');
memo1.Lines.Clear;
end;
Memo1.Lines.Add('������ �����: '+Edit1.Text);
Memo1.Lines.Add('������ �����: '+Edit2.Text);
Memo1.Lines.Add('�����: '+inttostr(a+b));
Memo1.Lines.Add('��������� �������: '+floattostr(rez));

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
memo1.Lines.Clear;
end;

end.
