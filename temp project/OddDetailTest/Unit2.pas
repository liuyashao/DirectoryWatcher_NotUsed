unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, Vcl.StdCtrls,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Datasnap.DBClient, cxFontNameComboBox,
  dxCore, cxMaskEdit, cxDropDownEdit, dxColorEdit;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1str: TStringField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1str: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxColorEdit1: TdxColorEdit;
    procedure FormCreate(Sender: TObject);
    procedure dxColorEdit1PropertiesChange(Sender: TObject);
    procedure cxGrid1DBTableView1EditKeyPress(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
  private
    { Private declarations }
  protected
    procedure UpdateActions; override;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses uOddTextEditProperties;

{$R *.dfm}

type
  TmyTextEdit = class(TcxTextEdit)
  protected
    function GetInnerEditClass: TControlClass; override;
  end;

  TmyCustomInnerTextEdit = class(TcxCustomInnerTextEdit)
  private
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure WMPrintClient(var Message: TWMPrintClient); message WM_PRINTCLIENT;
    procedure InternalPaint(ADC: THandle);
  end;

{ TForm2 }

procedure TForm2.cxGrid1DBTableView1EditKeyPress(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Char);
begin
  Caption := AEdit.ClassName;
end;

procedure TForm2.dxColorEdit1PropertiesChange(Sender: TObject);
begin
  OddBackgroudColor := dxColorEdit1.ColorValue;
  cxGrid1DBTableView1.Invalidate;
  Caption := ColorToString(dxColorEdit1.ColorValue);
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  TextEdit: TmyTextEdit;
begin
  TextEdit := TmyTextEdit.Create(Self);
  TextEdit.Parent := Self;
  TextEdit.SetBounds(10, 10, 100, 25);
  cxGrid1DBTableView1str.PropertiesClass := TcxOddTextEditProperties;
  ClientDataSet1.Append;
  ClientDataSet1['str'] := '4*32.92+51.21+18.29+2*33.39+5*30';
  ClientDataSet1.Append;
  ClientDataSet1['str'] := '69.25';
  ClientDataSet1.Append;
  ClientDataSet1['str'] := '(2*26.36+68+48.3+3*20)��';
end;

procedure TForm2.UpdateActions;
begin
  inherited;
//  if ActiveControl <> nil then
//    Caption := ActiveControl.ClassName;
end;

{ TmyTextEdit }

function TmyTextEdit.GetInnerEditClass: TControlClass;
begin
  inherited GetInnerEditClass;
  Result := TmyCustomInnerTextEdit;
end;

{ TmyCustomInnerTextEdit }

procedure TmyCustomInnerTextEdit.WMPaint(var Message: TWMPaint);
var
  DC: HDC;
  PS: TPaintStruct;
  ACanvas: TCanvas;
begin
  inherited;
  DC := Message.DC;
  if DC = 0 then
    DC := BeginPaint(Handle, PS);
  InternalPaint(DC);
  if Message.DC = 0 then
    EndPaint(Handle, PS);
end;

procedure TmyCustomInnerTextEdit.WMPrintClient(var Message: TWMPrintClient);
var
  DC: HDC;
  PS: TPaintStruct;
  ACanvas: TCanvas;
begin
//  inherited;
//  DC := Message.DC;
//  if DC = 0 then
//    DC := BeginPaint(Handle, PS);
//  InternalPaint(DC);
//  if Message.DC = 0 then
//    EndPaint(Handle, PS);
end;

procedure TmyCustomInnerTextEdit.InternalPaint(ADC: THandle);
var
  R: TRect;
  S: string;
  ALeftMargin, ARightMargin: Word;
  AMargings: DWORD;
  APasswordChar: Char;
  ACanvas: TCanvas;
begin
  AMargings := Perform(EM_GETMARGINS, 0, 0);
  ARightMargin := HiWord(AMargings);
  ALeftMargin := LoWord(AMargings);
  S := Text;

  R := ClientRect;
//  case Container.ActiveProperties.Alignment.Horz of
//    taCenter:
//      R.Left := (ClientWidth - ARightMargin - ALeftMargin - cxTextSize(Font, S).cx) div 2 + ALeftMargin;
//    taRightJustify:
//      R.Left := ClientWidth - cxTextSize(Font, S).cx - ARightMargin + ALeftMargin;
//  end;

  ACanvas := TCanvas.Create;
  try
    ACanvas.Handle := ADC;
    try
      ACanvas.Font := Font;
      ACanvas.Font.Color := clRed;
//      if (APasswordChar <> #0) and ShowPasswordCharAsBullet(Container.LookAndFeel.NativeStyle) then
//        ACanvas.Font.Name := 'Segoe UI';
      ACanvas.Brush.Color := clRed;//Color;
      ACanvas.FillRect(ClientRect);
      cxDrawText(ACanvas, S, R, 0);
    finally
      ACanvas.Handle := 0;
    end;
  finally
    ACanvas.Free;
  end;
end;

end.
