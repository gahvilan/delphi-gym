unit UIngresosVarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxRadioGroup, UPrincipal, DB, IBCustomDataSet, IBQuery, UDatosDB,
  cxCurrencyEdit;

type
  TFIngresosVarios = class(TFUniversal)
    GBTroquelados: TGroupBox;
    CBCombat: TcxRadioButton;
    CBPump: TcxRadioButton;
    TECantidad: TcxTextEdit;
    cxLabel1: TcxLabel;
    PBotones: TPanel;
    Image2: TImage;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    IBQTroquelados: TIBQuery;
    CEPresio: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIngresosVarios: TFIngresosVarios;

implementation

{$R *.dfm}

procedure TFIngresosVarios.BAceptarClick(Sender: TObject);
begin
  inherited;
  try
    IBQTroquelados.Close;
    if (CBCombat.Checked) then
      IBQTroquelados.ParamByName('disiplina').AsInteger := 11
    else
      IBQTroquelados.ParamByName('disiplina').AsInteger := 8;
    IBQTroquelados.ParamByName('fecha').AsString := DateToStr(Date());
    if (TECantidad.Text = '') then
      IBQTroquelados.ParamByName('cantidad').AsInteger := 0
    else
      IBQTroquelados.ParamByName('cantidad').AsInteger := StrToInt(TECantidad.Text);
    IBQTroquelados.ParamByName('precio').AsFloat := CEpresio.Value;
    IBQTroquelados.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
  Close();
end;

procedure TFIngresosVarios.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
