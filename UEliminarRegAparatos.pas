unit UEliminarRegAparatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Grids, DBGrids, ComCtrls, StdCtrls, jpeg, ExtCtrls,
  DB, IBCustomDataSet, IBQuery, UDatosDB, cxLookAndFeelPainters, cxButtons,
  pngimage;

type
  TFEliminarRegAparatos = class(TFUniversal)
    GBDatos: TGroupBox;
    Panel1: TPanel;
    GBClientes: TGroupBox;
    Label1: TLabel;
    DTPFechaPago: TDateTimePicker;
    DBGClientes: TDBGrid;
    IBQAparatosPagos: TIBQuery;
    IBQAparatosPagosNOMBRE: TIBStringField;
    IBQAparatosPagosDISIPLINA: TIBStringField;
    IBQAparatosPagosFECHA_INGRESO: TIBStringField;
    IBQAparatosPagosHORA_INGRESO: TIBStringField;
    DSAparatosPagos: TDataSource;
    LRegistro: TLabel;
    PBotones: TPanel;
    Image2: TImage;
    IBQAparatosPagosMONTO: TIBBCDField;
    BEliminar: TcxButton;
    BSalir: TcxButton;
    IBQEliminarReg: TIBQuery;
    IBQAparatosPagosIDC: TIntegerField;
    IBQAparatosPagosIDDIS: TIntegerField;
    IBQEliminarPago: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure DTPFechaPagoChange(Sender: TObject);
    procedure DBGClientesCellClick(Column: TColumn);
    procedure IBQAparatosPagosAfterOpen(DataSet: TDataSet);
    procedure BEliminarClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
  private
    procedure ActualizarClientes();
  public
    { Public declarations }
  end;

var
  FEliminarRegAparatos: TFEliminarRegAparatos;

implementation

{$R *.dfm}

procedure TFEliminarRegAparatos.FormCreate(Sender: TObject);
begin
  inherited;
  DTPFechaPago.Date := Date();
  ActualizarClientes();
end;

procedure TFEliminarRegAparatos.ActualizarClientes;
begin
  IBQAparatosPagos.Close;
  IBQAparatosPagos.ParamByName('fecha').AsString := FormatDateTime('dd/mm/yyyy',DTPFechaPago.DateTime);
  IBQAparatosPagos.Open;
end;

procedure TFEliminarRegAparatos.DTPFechaPagoChange(Sender: TObject);
begin
  inherited;
  ActualizarClientes();
end;

procedure TFEliminarRegAparatos.DBGClientesCellClick(Column: TColumn);
begin
  inherited;
  LRegistro.Caption := 'El Cliente '+DBGClientes.DataSource.DataSet.fieldByName('nombre').AsString+
                       ' pago el monto de $'+FloatToStr(DBGClientes.DataSource.DataSet.fieldByName('monto').AsFloat)+
                       ' el dia '+DBGClientes.DataSource.DataSet.fieldByName('fecha_ingreso').AsString+
                       ' a las '+DBGClientes.DataSource.DataSet.fieldByName('hora_ingreso').AsString+ ' horas';
end;

procedure TFEliminarRegAparatos.IBQAparatosPagosAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  BEliminar.Enabled := not (IBQAparatosPagos.IsEmpty);
end;

procedure TFEliminarRegAparatos.BEliminarClick(Sender: TObject);
begin
  inherited;
  try
    IBQEliminarReg.Close;
    IBQEliminarReg.ParamByName('cli').AsInteger := DBGClientes.DataSource.DataSet.fieldByName('idc').AsInteger;
    IBQEliminarReg.ParamByName('dis').AsInteger := DBGClientes.DataSource.DataSet.fieldByName('iddis').AsInteger;
    IBQEliminarReg.ParamByName('fecha').AsString := DBGClientes.DataSource.DataSet.fieldByName('fecha_ingreso').AsString;
    IBQEliminarReg.ParamByName('hora').AsString := DBGClientes.DataSource.DataSet.fieldByName('hora_ingreso').AsString;
    IBQEliminarReg.Open;
    IBQEliminarPago.Close;
    IBQEliminarPago.ParamByName('cli').AsInteger := DBGClientes.DataSource.DataSet.fieldByName('idc').AsInteger;
    IBQEliminarPago.ParamByName('dis').AsInteger := DBGClientes.DataSource.DataSet.fieldByName('iddis').AsInteger;
    IBQEliminarPago.ParamByName('fecha').AsDate := DTPFechaPago.Date;
    IBQEliminarPago.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    ActualizarClientes();
    showmessage('La transaccion fue eliminada');
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

procedure TFEliminarRegAparatos.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
