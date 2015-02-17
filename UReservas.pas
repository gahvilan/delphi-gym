unit UReservas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, UDatosDB, DBCtrls, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, UPrincipal, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxTimeEdit, pngimage;

type
  TFReservas = class(TFUniversal)
    Panel1: TPanel;
    GBDisiplina: TGroupBox;
    DBLCBDisiplina: TDBLookupComboBox;
    Label1: TLabel;
    IBQClientes: TIBQuery;
    DSClientes: TDataSource;
    cxDEFechaClase: TcxDateEdit;
    cxLabel1: TcxLabel;
    IBQCantReservas: TIBQuery;
    IBQMaximoRes: TIBQuery;
    cxLCantidad: TcxLabel;
    cxLabel2: TcxLabel;
    IBQReservas: TIBQuery;
    DSReservas: TDataSource;
    GBReservas: TGroupBox;
    DBGReservas: TDBGrid;
    GBResNuevas: TGroupBox;
    DBGClientes: TDBGrid;
    BAgregar: TcxButton;
    BEliminar: TcxButton;
    IBQInsert: TIBQuery;
    IBQEliminar: TIBQuery;
    PBotones: TPanel;
    Image2: TImage;
    BAceptar: TcxButton;
    cxTEHoraClase: TcxTimeEdit;
    cxLabel3: TcxLabel;
    TENombre: TcxTextEdit;
    TEApellido: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    procedure IBQClientesBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cxDEFechaClasePropertiesCloseUp(Sender: TObject);
    procedure BAgregarClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure cxTEHoraClasePropertiesChange(Sender: TObject);
    procedure DBLCBDisiplinaCloseUp(Sender: TObject);
    procedure TENombrePropertiesChange(Sender: TObject);
    procedure TEApellidoPropertiesChange(Sender: TObject);
  private
    cantidad_reservas : Integer;
    maximo_reservas : Integer;
    fecha_clase : TDate;
    hora_clase : TTime;
    Nombre, Apellido : String;
    procedure ActualizarDatos();
    procedure ActualizarClientes();
  public
    { Public declarations }
  end;

var
  FReservas: TFReservas;

implementation

{$R *.dfm}

procedure TFReservas.IBQClientesBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  IBQClientes.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
end;

procedure TFReservas.FormCreate(Sender: TObject);
begin
  inherited;
  fecha_clase := Date();
  hora_clase := Time();
  Nombre := '%';
  Apellido := '%';
  cxDEFechaClase.Date := fecha_clase;
  cxTEHoraClase.Time := hora_clase;
  DMGimnasio.IBQActividadesReserva.Close;
  DMGimnasio.IBQActividadesReserva.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  DMGimnasio.IBQActividadesReserva.Open;
  DBLCBDisiplina.KeyValue := 1;
  ActualizarDatos();
end;

procedure TFReservas.cxDEFechaClasePropertiesCloseUp(Sender: TObject);
begin
  inherited;
  fecha_clase := cxDEFechaClase.Date;
  ActualizarDatos();
end;

procedure TFReservas.ActualizarDatos();
begin
  IBQCantReservas.Close;
  IBQCantReservas.ParamByName('id').Value := DBLCBDisiplina.KeyValue;
  IBQCantReservas.ParamByName('fecha').AsString := DateToStr(fecha_clase);
  IBQCantReservas.ParamByName('hora').AsString := FormatDateTime('hh:mm',hora_clase);
  IBQCantReservas.Open;
  cantidad_reservas := IBQCantReservas.FieldByName('cant').AsInteger;
  IBQMaximoRes.Close;
  IBQMaximoRes.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  IBQMaximoRes.ParamByName('id').Value := DBLCBDisiplina.KeyValue;
  IBQMaximoRes.Open;

  maximo_reservas := IBQMaximoRes.fieldByName('cantreservas').AsInteger;
  cantidad_reservas := maximo_reservas - cantidad_reservas;
  cxLCantidad.Caption := IntToStr(cantidad_reservas);

  IBQReservas.Close;
  IBQReservas.ParamByName('id').Value := DBLCBDisiplina.KeyValue;
  IBQReservas.ParamByName('fecha').AsString := DateToStr(fecha_clase);
  IBQReservas.ParamByName('hora').AsString := FormatDateTime('hh:mm',hora_clase);
  IBQReservas.Open;

  if (cantidad_reservas = 0) then BAgregar.Enabled := false
  else Bagregar.Enabled := true;
  if (cantidad_reservas = maximo_reservas) then BEliminar.Enabled := false
  else BEliminar.Enabled := true;
end;

procedure TFReservas.BAgregarClick(Sender: TObject);
begin
  inherited;

    IBQInsert.Close;
    IBQInsert.ParamByName('id_c').AsInteger := IBQClientes.fieldByName('id_cliente').AsInteger;
    IBQInsert.ParamByName('id_d').Value := DBLCBDisiplina.KeyValue;
    IBQInsert.ParamByName('fecha_clase').AsString := DateToStr(fecha_clase);
    IBQInsert.ParamByName('hora_clase').AsString := FormatDateTime('hh:mm',hora_clase);
    IBQInsert.ParamByName('fecha_reserva').AsString := DateToStr(Date());
    IBQInsert.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    ActualizarDatos();

end;

procedure TFReservas.BEliminarClick(Sender: TObject);
begin
  inherited;
  IBQEliminar.Close;
  IBQEliminar.ParamByName('id_c').AsInteger := IBQReservas.fieldByName('id_cliente').AsInteger;
  IBQEliminar.ParamByName('id_d').Value := DBLCBDisiplina.KeyValue;
  IBQEliminar.ParamByName('fecha_c').AsString := DateToStr(fecha_clase);
  IBQEliminar.ParamByName('hora_c').AsString := FormatDateTime('hh:mm',hora_clase);
  IBQEliminar.Open;
  DMGimnasio.IBTGimnasio.CommitRetaining;
  ActualizarDatos();
end;

procedure TFReservas.BAceptarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFReservas.cxTEHoraClasePropertiesChange(Sender: TObject);
begin
  inherited;
  hora_clase := cxTEHoraClase.Time;
  ActualizarDatos();
end;

procedure TFReservas.ActualizarClientes();
begin
  IBQClientes.Close;
  IBQClientes.ParamByName('disiplina').AsInteger := DBLCBDisiplina.KeyValue;
  IBQClientes.ParamByName('nombre').AsString := Nombre;
  IBQClientes.ParamByName('apellido').AsString := Apellido;
  IBQClientes.Open;
end;

procedure TFReservas.DBLCBDisiplinaCloseUp(Sender: TObject);
begin
  inherited;
  ActualizarDatos();
  ActualizarClientes();
end;

procedure TFReservas.TENombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := TENombre.Text+'%';
  ActualizarClientes();
end;

procedure TFReservas.TEApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := TEApellido.Text+'%';
  ActualizarClientes();
end;

end.
