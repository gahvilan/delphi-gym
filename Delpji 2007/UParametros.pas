unit UParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxCheckBox, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxCurrencyEdit, cxLookAndFeelPainters,
  cxButtons, UDatosDB, DB, IBCustomDataSet, IBQuery, cxLabel, IBStoredProc;

type
  TFParametros = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EDescuento: TcxCurrencyEdit;
    Label2: TLabel;
    EPorcentaje: TcxTextEdit;
    CBCumple: TcxCheckBox;
    BAceptar: TcxButton;
    Image2: TImage;
    BCancelar: TcxButton;
    cxLabel1: TcxLabel;
    IBQGetParametros: TIBQuery;
    IBSPSetParametros: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParametros: TFParametros;

implementation

{$R *.dfm}

procedure TFParametros.FormCreate(Sender: TObject);
begin
  inherited;
  IBQGetParametros.Close;
  IBQGetParametros.Open;
  IBQGetParametros.First;
  while not IBQGetParametros.Eof do
  begin
    if IBQGetParametros.FieldByName('id_parametro').AsInteger = 1 then
      EDescuento.Value := IBQGetParametros.fieldByName('valor').AsInteger;
    if IBQGetParametros.FieldByName('id_parametro').AsInteger = 2 then
      EPorcentaje.Text := IntToStr(IBQGetParametros.fieldByName('valor').AsInteger);
    if IBQGetParametros.FieldByName('id_parametro').AsInteger = 3 then
      CBCumple.Checked := IBQGetParametros.fieldByName('valor').AsInteger = 1;
    IBQGetParametros.Next;
  end;
end;

procedure TFParametros.BAceptarClick(Sender: TObject);
begin
  inherited;
  IBSPSetParametros.Close;
  IBSPSetParametros.ParamByName('descuento').AsFloat := EDescuento.Value;
  IBSPSetParametros.ParamByName('porcentaje').AsInteger := StrToInt(EPorcentaje.Text);
  if CBCumple.Checked then
    IBSPSetParametros.ParamByName('cumple').AsInteger := 1
  else
    IBSPSetParametros.ParamByName('cumple').AsInteger := 0;
  IBSPSetParametros.ExecProc;
  DMGimnasio.IBTGimnasio.CommitRetaining;
  Close();
end;

procedure TFParametros.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
