unit UEntradasVarias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLabel, cxCurrencyEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters,
  cxButtons, UDatosDB, DB, IBCustomDataSet, IBQuery;

type
  TFEntradasVarias = class(TFUniversal)
    PDatos: TPanel;
    PBotones: TPanel;
    Image2: TImage;
    TEDescripcion: TcxTextEdit;
    TEMonto: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    IBQGuardar: TIBQuery;
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEntradasVarias: TFEntradasVarias;

implementation

{$R *.dfm}

procedure TFEntradasVarias.BAceptarClick(Sender: TObject);
begin
  inherited;
  try
    IBQGuardar.Close;
    IBQGuardar.ParamByName('desc').AsString := TEDescripcion.Text;
    IBQGuardar.ParamByName('precio').AsFloat := TEMonto.Value;
    IBQGuardar.ParamByName('fecha').AsString := DateToStr(Date());
    IBQGuardar.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
    IBQGuardar.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    Close();
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

procedure TFEntradasVarias.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
