unit UFechaPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Grids, DBGrids, cxButtons, UDatosDB, DB, IBCustomDataSet,
  IBQuery, DateUtils, Types, pngimage;

type
  TFFechaPago = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GBCliente: TGroupBox;
    GBFecha: TGroupBox;
    Image2: TImage;
    BSalir: TcxButton;
    RGFiltro: TRadioGroup;
    DEFecha: TcxDateEdit;
    EApellido: TcxTextEdit;
    ENombre: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    IBQConsulta: TIBQuery;
    IBQVerificarPago: TIBQuery;
    IBQVerificarPagoFECHA_INGRESO: TIBStringField;
    SGDatos: TStringGrid;
    IBQDatos: TIBQuery;
    IBQDatosNOMBRE: TIBStringField;
    IBQDatosAPELLIDO: TIBStringField;
    IBQConsultaFECHA_INGRESO: TIBStringField;
    IBQConsultaCLIENTE: TIntegerField;
    procedure RGFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EApellidoPropertiesChange(Sender: TObject);
    procedure ENombrePropertiesChange(Sender: TObject);
    procedure DEFechaPropertiesChange(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
  private
    SQL, Nombre, Apellido : String;
    procedure ActConsulta();
    function ConvFecha(F : String) : TDate;
    function FechaPago(id_usuario : integer) : TDate;
  public
  end;

var
  FFechaPago: TFFechaPago;

implementation

{$R *.dfm}

procedure TFFechaPago.RGFiltroClick(Sender: TObject);
begin
  inherited;
  case RGFiltro.ItemIndex of
    1 : begin
          GBFecha.Enabled := false;
          GBCliente.Enabled := true;
          SQL := 'select distinct(a.fecha_ingreso), a.cliente from aparatos a, clientes c where c.apellido like :A and c.nombre like :N and c.id_cliente=a.cliente and a.paga=''S''';
        end;
    0 : begin
          GBFecha.Enabled := true;
          GBCliente.Enabled := false;
          SQL := 'select distinct(fecha_ingreso), cliente from aparatos where paga=''S''';
        end;
    end;
end;

function TFFechaPago.ConvFecha(F : String) : TDate;
var
  i : integer;
  anio, dia, mes : Word;
  d , m: String;
begin
  i := 1;
  while (F[i] <> '/') do
  begin
    d := d + F[i];
    Inc(i);
  end;
  Inc(i);
  while (F[i] <> '/') do
  begin
    m := m + F[i];
    Inc(i);
  end;
  DecodeDate(Date(),anio,mes,dia);
  dia := StrToInt(d);
  mes := StrToInt(m);
  Result := EncodeDate(anio,mes,dia);
end;

function TFFechaPago.FechaPago(id_usuario : Integer) : TDate;
var
  Fecha_ingreso, Fecha : TDate;
  cant_m : integer;
begin

    IBQVerificarPago.Close;
    IBQVerificarPago.ParamByName('id').AsInteger := id_usuario;
    IBQVerificarPago.Open;

    //Primer Pago
    Fecha_ingreso := Date();
    IBQVerificarPago.First;
    while not IBQVerificarPago.Eof do
    begin
      Fecha := ConvFecha(IBQVerificarPago.fieldByName('fecha_ingreso').AsString);
      if (CompareDate(Fecha_ingreso,Fecha) = GreaterThanValue) then
        Fecha_ingreso := Fecha;
      IBQVerificarPago.Next;
    end;

    cant_m := MonthsBetween(Date(),Fecha_ingreso);
    Result := IncMonth(Fecha_ingreso,cant_m);
end;

procedure TFFechaPago.ActConsulta();
var
  fila, cliente : integer;
  Fecha : TDate;
  por_fecha : boolean;
begin
  IBQConsulta.Close;
  IBQConsulta.SQL.Clear;
  IBQConsulta.SQL.Add(SQL);
  case RGFiltro.ItemIndex of
    1 : begin
          IBQConsulta.ParamByName('A').AsString := Apellido;
          IBQConsulta.ParamByName('N').AsString := Nombre;
        end;
  end;
  IBQConsulta.Open;
  SGDatos.RowCount := 2;
  fila := 1;
  while not IBQConsulta.Eof do
  begin
    por_fecha := false;
    cliente := IBQConsulta.fieldByName('cliente').AsInteger;
    Fecha := FechaPago(cliente);
    if (RGFiltro.ItemIndex = 0) then
      if (DEFecha.Date = Fecha) then
        por_fecha := true;
    if (por_fecha or (RGFiltro.ItemIndex = 1)) then
    begin
      IBQDatos.Close;
      IBQDatos.ParamByName('cliente').AsInteger := cliente;
      IBQDatos.Open;
      SGDatos.Cells[0,fila] := IBQDatos.fieldByName('apellido').AsString;
      SGDatos.Cells[1,fila] := IBQDatos.fieldByName('nombre').AsString;
      SGDatos.Cells[2,fila] := DateToStr(Fecha);
      SGDatos.RowCount := SGDatos.RowCount + 1;
      Inc(fila);
    end;
    IBQConsulta.Next;
  end;

end;

procedure TFFechaPago.FormCreate(Sender: TObject);
begin
  inherited;
  RGFiltroClick(nil);
  Nombre := '%';
  Apellido := '%';
  DEFecha.Date := Date();
  SGDatos.Cells[0,0] := 'Apellido';
  SGDatos.Cells[1,0] := 'Nombre';
  SGDatos.Cells[2,0] := 'Fecha de Pago';
end;

procedure TFFechaPago.EApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := EApellido.Text+'%';
  ActConsulta();
end;

procedure TFFechaPago.ENombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := ENombre.Text+'%';
  ActConsulta();
end;

procedure TFFechaPago.DEFechaPropertiesChange(Sender: TObject);
begin
  inherited;
  ActConsulta();
end;

procedure TFFechaPago.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
