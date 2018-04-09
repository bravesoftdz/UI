unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    Button1: TButton;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ApplicationEvents1Exception(Sender: TObject; E: Exception);
var
  LogFile: TextFile; // ��������� ���-����
  FileName: string; // ���� � ��� ���-�����
begin
  // ��� ��� ����� ������� ����� �� ��� ��� ����������, ��
  // � ����������� log
  FileName := ChangeFileExt(Application.ExeName, 'log');

  AssignFile(LogFile, FileName);

  // ���� ���� ����������, ������������, ����� �������
  if FileExists(FileName) then
    Append(LogFile) // ������� ������������ ����
  else
    Rewrite(LogFile); // ������� ����� ����

  try
    // �������� ����+����� � ����� ������ � ���-����
    Writeln(LogFile, DateTimeToStr(Now) + ' ' + E.Message);
    // �������� ������
    Application.ShowException(E);
  finally
    CloseFile(LogFile); // ������� ����
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin

Raise Exception.Create('������!!!!');

end;

end.
