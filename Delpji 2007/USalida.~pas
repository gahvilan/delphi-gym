unit USalida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, cxLabel, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCurrencyEdit, DB, IBCustomDataSet, IBQuery, UPrincipal, UDatosDB;

type
  TFSalida = class(TFUniversal)
    PBotones: TPanel;
    Image2: TImage;
    PDatos: TPanel;
    CECantidad: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    IBQInsertSalida: TIBQuery;
    RBVarias: TRadioButton;
    RBSalida: TRadioButton;
    RBBebidas: TRadioButton;
    TEDescripcion: TcxTextEdit;
    cxLabel2: TcxLabel;
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSalida: TFSalida;

implementation

{$R *.dfm}

procedure TFSalida.BAceptarClick(Sender: TObject);
begin
  inherited;
  try
    IBQInsertSalida.Close;
    IBQInsertSalida.ParamByName('cant').AsFloat := CECantidad.Value;
    IBQInsertSalida.ParamByName('desc').AsString := TEDescripcion.Text;
    IBQInsertSalida.ParamByName('fecha').AsString := DateToStr(Date());
    if (RBVarias.Checked) then
      IBQInsertSalida.ParamByName('tipo').AsInteger := RBVarias.Tag;
    if (RBSalida.Checked) then
      IBQInsertSalida.ParamByName('tipo').AsInteger := RBSalida.Tag;
    if (RBBebidas.Checked) then
      IBQInsertSalida.ParamByName('tipo').AsInteger := RBBebidas.Tag;
    IBQinsertSalida.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    on e : Exception do
    begin
      MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message,mtError,[mbOk],0);
      DMGimnasio.IBTGimnasio.RollbackRetaining;
    end;
  end;
  Close();
end;

procedure TFSalida.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
