unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    edt1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uOddDetailUtils;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  od: IOddDetails;
  I: Integer;
begin
  for I := 1 to 10000 do begin
    od := ParseOD(edt1.Text);
    od.Add(2, 36.52);
  end;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(od.ToString);
  Memo1.Lines.Add(od.ToString(ouMetre, 4));

  Memo1.Lines.Add(od.ToStringWithUnit);
  Memo1.Lines.Add(od.ToStringWithUnit(ouMetre, 4));

  Memo1.Lines.Add(od.TotalPieces.ToString);
  Memo1.Lines.Add(od.TotalQty.ToString);
  Memo1.Lines.Add(od.TotalQtyConvertTo(ouMetre).ToString);

  od[0] := TOdd.Create(2, 50.36);

  Memo1.Lines.Add(od.ToString);
  Memo1.Lines.Add(od.ToString(ouMetre));

  Memo1.Lines.Add(od.ToStringWithUnit);
  Memo1.Lines.Add(od.ToStringWithUnit(ouMetre));

  Memo1.Lines.Add(od.TotalPieces.ToString);
  Memo1.Lines.Add(od.TotalQty.ToString);
  Memo1.Lines.Add(od.TotalQtyConvertTo(ouMetre).ToString);

  od.ConvertTo(ouMetre);

  Memo1.Lines.Add(od.ToString);
  Memo1.Lines.Add(od.ToString(ouMetre));

  Memo1.Lines.Add(od.ToStringWithUnit);
  Memo1.Lines.Add(od.ToStringWithUnit(ouMetre));

  Memo1.Lines.Add(od.TotalPieces.ToString);
  Memo1.Lines.Add(od.TotalQty.ToString);
  Memo1.Lines.Add(od.TotalQtyConvertTo(ouYard).ToString);
end;

end.