unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  a, b, c:real;
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
try
 a:=strtofloat(edit1.Text);
 b:=strtofloat(edit2.Text);
 c:=a/b;

except
//��� ������� �� ����, ���� ��� ������ ���� ����� ��������� ������ ��������� � �������
showmessage('�������� ������');
exit;
end;

 edit3.Text:=floattostr(c);
end;

end.
