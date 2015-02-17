unit UEliminarPilates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, Grids, DBGrids, DB, IBCustomDataSet,
  IBQuery, UPrincipal, UDatosDB;

type
  TFEliminarPilates = class(TFUniversal)
    PBotones: TPanel;
    Image2: TImage;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    PDatos: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBGClientes: TDBGrid;
    TEApellido: TcxTextEdit;
    GroupBox2: TGroupBox;
    DEFecha: TcxDateEdit;
    LDetalleNombre: TLabel;
    IBQClientes: TIBQuery;
    DSClientes: TDataSource;
    IBQConsultaCliente: TIBQuery;
    LDetalleFecha: TLabel;
    LDetallePrecio: TLabel;
    IBQEliminar: TIBQuery;
    procedure TEApellidoPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DEFechaPropertiesChange(Sender: TObject);
    procedure DBGClientesCellClick(Column: TColumn);
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private
    Apellido : String;
    Fecha : TDate;
    ID_Cliente : Integer;
    procedure ActualizarClientes;
    procedure ActualizarConsulta;
  public
    { Public declarations }
  end;

var
  FEliminarPilates: TFEliminarPilates;

implementation

{$R *.dfm}

procedure TFEliminarPilates.ActualizarClientes();
begin
  IBQClientes.Close;
  IBQClientes.ParamByName('APELLIDO').AsString := Apellido;
  IBQClientes.Open;
end;


procedure TFEliminarPilates.TEApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := TEApellido.Text + '%';
  ActualizarClientes;
end;


procedure TFEliminarPilates.FormCreate(Sender: TObject);
begin
  inherited;
  Apellido := '%';
  Fecha := Date();
  DEFecha.Date := Date();
  ActualizarClientes;
  ID_Cliente := 0;
  IBQClientes.First;
end;

procedure TFEliminarPilates.DEFechaPropertiesChange(Sender: TObject);
begin
  inherited;
  Fecha := DEFecha.Date;
end;

procedure TFEliminarPilates.DBGClientesCellClick(Column: TColumn);
begin
  inherited;
  if IBQClientes.FieldValues['ID_CLIENTE'] <> null then
    ID_Cliente := IBQClientes.FieldValues['ID_CLIENTE'];
  ActualizarConsulta;
end;

procedure TFEliminarPilates.ActualizarConsulta;
begin
  IBQConsultaCliente.Close;
  IBQConsultaCliente.ParamByName('ID_CLIENTE').Value := ID_Cliente;
  IBQConsultaCliente.ParamByName('FECHA').AsDate := Fecha;
  IBQConsultaCliente.Open;
  if not IBQConsultaCliente.IsEmpty then
  begin
    IBQConsultaCliente.First;
    LDetalleNombre.Caption := 'Cliente : '+IBQClientes.FieldValues['NOMBRE']+' '+IBQClientes.FieldValues['APELLIDO']+#13;
    LDetalleFecha.Caption := 'Fecha : '+DateToStr(Fecha);
    LDetallePrecio.Caption := 'Cantidad Abonada ($): '+FloatToStr(IBQConsultaCliente.FieldValues['PRECIO']);
  end
  else
  begin
    LDetalleNombre.Caption := 'No se registro ningun ingreso a pilates';
    LDetalleFecha.Caption := '';
    LDetallePrecio.Caption := '';
  end;
end;

procedure TFEliminarPilates.BAceptarClick(Sender: TObject);
begin
  inherited;
  if not IBQConsultaCliente.IsEmpty then
  begin
    try
      IBQEliminar.Close;
      IBQEliminar.ParamByName('CLIENTE').Value := ID_Cliente;
      IBQEliminar.ParamByName('FECHA').AsDate := Fecha;
      IBQEliminar.Open;
      DMGimnasio.IBTGimnasio.CommitRetaining;
    except
      DMGimnasio.IBTGimnasio.RollbackRetaining;
    end;
    Close;
  end
  else
    if MessageDlg('No se selecciono ningun cliente. Desea Salir?',mtError,[mbYes,mbNo],0) = mrYes then
      Close
end;

procedure TFEliminarPilates.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
