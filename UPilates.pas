unit UPilates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxCurrencyEdit,
  cxRadioGroup, DB, IBCustomDataSet, IBQuery, UDatosDB, Grids, DBGrids,
  pngimage;

type
  TFPilates = class(TFUniversal)
    PDatos: TPanel;
    PBotones: TPanel;
    Image2: TImage;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    RBSimple: TcxRadioButton;
    RBDoble: TcxRadioButton;
    CESimple: TcxCurrencyEdit;
    CEDoble: TcxCurrencyEdit;
    IBQParametros: TIBQuery;
    IBQParametrosID_PARAMETRO: TIntegerField;
    IBQParametrosDESCRIPCION: TIBStringField;
    IBQParametrosVALOR: TIntegerField;
    IBQInserPilates: TIBQuery;
    IBQUpdateParam: TIBQuery;
    GroupBox1: TGroupBox;
    DBGClientes: TDBGrid;
    DSClientes: TDataSource;
    IBQClientes: TIBQuery;
    Label1: TLabel;
    TEApellido: TcxTextEdit;
    procedure RBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure CESimpleExit(Sender: TObject);
    procedure CEDobleExit(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
  private
    valor, valor_simple_viejo, valor_doble_viejo : real;
    valor_simple_nuevo, valor_doble_nuevo : real;
    tipo : integer;
    apellido : String;
    procedure ActualizarClientes();
  public
    { Public declarations }
  end;

var
  FPilates: TFPilates;

implementation

{$R *.dfm}

procedure TFPilates.ActualizarClientes();
begin
  IBQClientes.Close;
  IBQClientes.ParamByName('APELLIDO').AsString := apellido;
  IBQClientes.Open;
end;

procedure TFPilates.RBClick(Sender: TObject);
begin
  inherited;
  if RBSimple.Checked then
  begin
    CESimple.Enabled := true;
    valor := CESimple.Value;
    CEDoble.Enabled := false;
    tipo := 2;
  end
  else
  begin
    CESimple.Enabled := false;
    CEDoble.Enabled := true;
    valor := CEDoble.Value;
    tipo := 1;
  end;
end;

procedure TFPilates.FormCreate(Sender: TObject);
begin
  inherited;
  IBQParametros.Close;
  IBQParametros.Open;
  apellido := '%';
  ActualizarClientes;
  CESimple.Value := IBQParametros.Lookup('id_parametro',4,'valor');
  CEDoble.Value := IBQParametros.Lookup('id_parametro',5,'valor');
  valor_simple_viejo := CESimple.Value;
  valor_doble_viejo := CEDoble.Value;
  valor_simple_nuevo := valor_simple_viejo;
  valor_doble_nuevo := valor_doble_viejo;
  valor := valor_simple_viejo;
  tipo := 2;
end;

procedure TFPilates.BAceptarClick(Sender: TObject);
begin
  inherited;
  try
    IBQInserPilates.Close;
    IBQInserPilates.ParamByName('fecha').AsDate := Date();
    IBQInserPilates.ParamByName('valor').AsFloat := valor;
    IBQInserPilates.ParamByName('tipo').AsInteger := tipo;
    IBQInserPilates.ParamByName('cliente').AsInteger := IBQClientes.FieldValues['id_cliente'];
    IBQInserPilates.Open;
    if ((valor_simple_viejo <> valor_simple_nuevo) or (valor_doble_viejo <> valor_doble_nuevo)) then
    begin
      if MessageDlg('Cambiaron los valores de las clases, desea guardar los cambios?',mtConfirmation,[mbOk,mbCancel],0) = mrOk then
      begin
        IBQUpdateParam.Close;
        IBQUpdateParam.ParamByName('valor').AsFloat := valor_simple_nuevo;
        IBQUpdateParam.ParamByName('param').AsInteger := 4;
        IBQUpdateParam.Open;
        IBQUpdateParam.Close;
        IBQUpdateParam.ParamByName('valor').AsFloat := valor_doble_nuevo;
        IBQUpdateParam.ParamByName('param').AsInteger := 5;
        IBQUpdateParam.Open;
        MessageDlg('Los valores de las clases fueron guardados',mtInformation,[mbOk],0);
      end
      else
        MessageDlg('Los valores nuevos no se guardaron. Se seguiran usando los mismos valores',mtInformation,[mbOk],0);
    end;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
  Close();
end;

procedure TFPilates.CESimpleExit(Sender: TObject);
begin
  inherited;
  valor_simple_nuevo := CESimple.Value;
end;

procedure TFPilates.CEDobleExit(Sender: TObject);
begin
  inherited;
  valor_doble_nuevo := CEDoble.Value;
end;

procedure TFPilates.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFPilates.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  inherited;
  apellido := TEApellido.Text+'%';
  ActualizarClientes();
end;

end.
