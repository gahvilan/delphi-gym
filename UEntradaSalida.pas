unit UEntradaSalida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ExtCtrls, StdCtrls, jpeg, UDatosDB, DBCtrls, Grids,
  DBGrids, cxControls, cxContainer, cxEdit, cxCheckBox, UPrincipal,
  cxLookAndFeelPainters, cxButtons, cxTextEdit, DB, IBCustomDataSet,
  IBQuery, cxMaskEdit, cxLabel, DateUtils, UHoraReserva, UArticulos,
  UPagoGimnasio, Types, pngimage, JvExControls, JvLabel;

type
  TFEntradaSalida = class(TFUniversal)
    GBGeneral: TGroupBox;
    Label1: TLabel;
    LFecha: TLabel;
    Label3: TLabel;
    DBLCBResponsable: TDBLookupComboBox;
    Label4: TLabel;
    LHora: TLabel;
    PBotones: TPanel;
    Image2: TImage;
    PGrillaTodos: TPanel;
    DBGListado: TDBGrid;
    GBAerobicos: TGroupBox;
    GBAparatos: TGroupBox;
    Label2: TLabel;
    DBLCBDisiplina: TDBLookupComboBox;
    BIngresoSystem: TcxButton;
    Label6: TLabel;
    cxNombre: TcxTextEdit;
    BIngresoAparatos: TcxButton;
    IBQAparatos: TIBQuery;
    DSAparatos: TDataSource;
    Panel1: TPanel;
    DBGrid2: TDBGrid;
    IBQIngresoNumero: TIBQuery;
    IBQIngresoFecha: TIBQuery;
    DSIngresoFecha: TDataSource;
    Label7: TLabel;
    cxApellido: TcxTextEdit;
    PSinReserva: TPanel;
    LLeyenda: TcxLabel;
    MEPrimerNumero: TcxMaskEdit;
    BPrimerNumero: TcxButton;
    BAceptarPN: TcxButton;
    LPrimerNumero: TcxLabel;
    CBPago: TcxCheckBox;
    Label5: TLabel;
    LCantidad: TLabel;
    PConReserva: TPanel;
    DBGReservas: TDBGrid;
    DSReservas: TDataSource;
    IBQReservas: TIBQuery;
    IBQReservasNOMBRE: TIBStringField;
    IBQReservasDISIPLINA: TIBStringField;
    IBQVerSiReserva: TIBQuery;
    IBQIngresoAparatos: TIBQuery;
    IBQIngresoFechaNOMBRE: TIBStringField;
    IBQIngresoFechaHORA: TIBStringField;
    IBQIngresoFechaDISIPLINA: TIBStringField;
    IBQIngresoFechaPAGO: TIBStringField;
    IBQReservasCLIENTE: TIntegerField;
    IBQTipoAparatos: TIBQuery;
    BReservas: TcxButton;
    BCNuevo: TcxButton;
    IBQInsertResponsable: TIBQuery;
    BArticulos: TcxButton;
    BTroquelados: TcxButton;
    BSalida: TcxButton;
    IBQVerificarPago: TIBQuery;
    BEntradas: TcxButton;
    BPago: TcxButton;
    IBQAparatosID_CLIENTE: TIntegerField;
    IBQAparatosNOMBRE: TIBStringField;
    IBQAparatosAPELLIDO: TIBStringField;
    IBQAparatosEDAD: TIntegerField;
    IBQVerificarPagoFECHA_INGRESO: TIBStringField;
    IBQUltimoPago: TIBQuery;
    cxButton1: TcxButton;
    cxBPilates: TcxButton;
    Panel2: TPanel;
    Image4: TImage;
    BSalir: TcxButton;
    IBQSalida: TIBQuery;
    IBQSalidaINGRESO: TIBStringField;
    IBQSalidaDESCRIPCION: TIBStringField;
    IBQSalidaVALOR: TIBBCDField;
    IBQEntrada: TIBQuery;
    IBQEntradaINGRESO: TIBStringField;
    IBQEntradaDISIPLINA: TIBStringField;
    IBQEntradaSALDO: TIBBCDField;
    Label8: TLabel;
    LCaja: TLabel;
    IBQCerrarCaja: TIBQuery;
    cxButton2: TcxButton;
    BIngTroquelado: TcxButton;
    cxBCaja: TcxButton;
    IBQIngresoCrossfit: TIBQuery;
    IBQVerificarPagoCrossfit: TIBQuery;
    IBStringField1: TIBStringField;
    LArticulos: TJvLabel;
    LClientesNuevos: TJvLabel;
    LEntradas: TJvLabel;
    LFPagos: TJvLabel;
    LPagoAparatos: TJvLabel;
    LPagoCrossfit: TJvLabel;
    LPilates: TJvLabel;
    LReservas: TJvLabel;
    LSalidas: TJvLabel;
    LTroquelados: TJvLabel;
    LCierreCaja: TJvLabel;
    IBQIngresoFechaFECHA_A: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBLCBResponsableCloseUp(Sender: TObject);
    procedure DBLCBDisiplinaCloseUp(Sender: TObject);
    procedure BPrimerNumeroClick(Sender: TObject);
    procedure BAceptarPNClick(Sender: TObject);
    procedure BIngresoSystemClick(Sender: TObject);
    procedure BIngresoAparatosClick(Sender: TObject);
    procedure IBQReservasAfterOpen(DataSet: TDataSet);
    procedure IBQAparatosAfterOpen(DataSet: TDataSet);
    procedure BArticulosClick(Sender: TObject);
    procedure cxNombrePropertiesChange(Sender: TObject);
    procedure cxApellidoPropertiesChange(Sender: TObject);
    procedure BReservasClick(Sender: TObject);
    procedure BCNuevoClick(Sender: TObject);
    procedure BPagoClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure BIngTroqueladoClick(Sender: TObject);
    procedure cxBCajaClick(Sender: TObject);
  private
    primer_numero : integer;
    numeros_reservas : Integer;
    cantidad_system : integer;
    cantidad_troquelados : integer;
    ConReserva : Boolean;
    HoraClase : TTime;
    Nombre, Apellido : String;
    RectTestigo : TRect;
    TotalCaja : Double;
    procedure ActualizarDatos();
    procedure ActualizarListadoAparatos();
    function VerSiDebe(id_usuario : Integer) : Boolean;
    function VerSiDebeCrossfit(id_usuario : Integer) : Boolean;
    procedure CalcularCaja();
    procedure GuardarCaja();
    function CalcularFecha(Fecha : TDate) : TDate;
    procedure InicProfesor();
    procedure CerrarCaja();
  public
    { Public declarations }
  end;

var
  FEntradaSalida: TFEntradaSalida;

implementation

uses
  UCajaPreview;

{$R *.dfm}

procedure TFEntradaSalida.FormCreate(Sender: TObject);
begin
  inherited;
  Nombre := '%';
  Apellido := '%';
  RectTestigo.Bottom := -1;
  DMGimnasio.IBTPersonal.Active := true;
  DMGimnasio.IBQActividades.Active := false;
  DMGimnasio.IBQActividades.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  DMGimnasio.IBQActividades.Active := true;
  LFecha.Caption := DateToStr(Date());
  primer_numero := 0;
  cantidad_system := 0;
  cantidad_troquelados := 0;
  PSinReserva.Visible := false;
  PConReserva.Visible := false;
  ActualizarDatos();

  InicProfesor;
end;

procedure TFEntradaSalida.ActualizarListadoAparatos();
begin
  IBQAparatos.Close;
  IBQAparatos.ParamByName('esta').AsInteger :=  FPrincipal.Establecimiento;
  IBQAparatos.ParamByName('nombre').AsString := Nombre;
  IBQAparatos.ParamByName('apellido').AsString := Apellido;
  IBQAparatos.Open;
end;

procedure TFEntradaSalida.DBLCBResponsableCloseUp(Sender: TObject);
begin
  inherited;
  if (DBLCBResponsable.KeyValue <> null) then
  begin
    LHora.Caption := TimeToStr(Time());
    ActualizarListadoAparatos();
    IBQInsertResponsable.Close;
    IBQInsertResponsable.ParamByName('id_profesor').Value := DBLCBResponsable.KeyValue;
    IBQInsertResponsable.ParamByName('fecha').AsString := DateToStr(Date());
    IBQInsertResponsable.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
    IBQInsertResponsable.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    GBAparatos.Enabled := true;
    GBAerobicos.Enabled := true;
    PBotones.Enabled := true;
  end;
end;

procedure TFEntradaSalida.DBLCBDisiplinaCloseUp(Sender: TObject);
var
  F : TFHora;
begin
  inherited;
  if (DBLCBDisiplina.KeyValue <> null) then
  begin
    PSinReserva.Visible := false;
    PConReserva.Visible := false;
    IBQVerSiReserva.Close;
    IBQVerSireserva.ParamByName('id').AsInteger := DBLCBDisiplina.KeyValue;
    IBQVerSiReserva.Open;
    if (IBQVerSiReserva.fieldByName('reserva').AsString = 'S') then
      PConReserva.Visible := true
    else
      PSinReserva.Visible := true;
    ConReserva := PConReserva.Visible;
    LLeyenda.Visible := true;
    primer_numero := 0;
    cantidad_system := 0;
    cantidad_troquelados := 0;
    LLeyenda.Caption := 'Primer Número: 0';
    LLeyenda.Style.Font.Color := clRed;
    BIngresoSystem.Enabled := not ConReserva;
    BIngTroquelado.Enabled := not ConReserva;
    if (ConReserva) then
    begin
      numeros_reservas := 0;
      F := TFHora.Create(self);
      F.ShowModal;
      HoraClase := F.TEHora.Time;
      F.Destroy;
      IBQReservas.Close;
      IBQReservas.ParamByName('id').AsInteger := DBLCBDisiplina.KeyValue;
      IBQReservas.ParamByName('fecha').AsString := DateToStr(Date());
      IBQReservas.ParamByName('hora').AsString := FormatDateTime('hh:mm',HoraClase);
      IBQReservas.Open;
    end;
  end;
end;

procedure TFEntradaSalida.BPrimerNumeroClick(Sender: TObject);
begin
  inherited;
  BPrimerNumero.Visible :=false;
  BIngresoSystem.Visible := false;
  BIngTroquelado.Visible := false;
  LLeyenda.Visible := false;
  BAceptarPN.Visible := true;
  LPrimerNumero.Visible := true;
  MEPrimerNumero.Visible := true;
end;

procedure TFEntradaSalida.BAceptarPNClick(Sender: TObject);
begin
  inherited;
  BPrimerNumero.Visible := true;
  BIngresoSystem.Visible := true;
  BIngTroquelado.Visible := true;
  BAceptarPN.Visible := false;
  LPrimerNumero.Visible := false;
  MEPrimerNumero.Visible := false;
  primer_numero := MEPrimerNumero.EditValue;
  LCantidad.Caption := IntToStr(cantidad_system);
  LLeyenda.Caption := 'Primer Número: '+IntToStr(primer_numero);
  LLeyenda.Visible := true;
  LLeyenda.Style.Font.Color := clBlack;
end;

procedure TFEntradaSalida.BIngresoSystemClick(Sender: TObject);
begin
  inherited;
  try
    with IBQIngresoNumero do
    begin
      Close;
      ParamByName('numero').AsInteger := primer_numero + cantidad_system;
      ParamByName('disiplina').Value := DBLCBDisiplina.KeyValue;
      if (CBPago.Checked) then
        ParamByName('pago').AsString := 'S'
      else
        ParamByName('pago').AsString := 'N';
      ParamByName('cliente').Value := null;
      if (ConReserva) then
      begin
        ParamByName('numero').AsInteger := numeros_reservas;
        ParamByName('pago').AsString := 'S';
        ParamByName('cliente').AsInteger := DBGReservas.DataSource.DataSet.fieldByName('cliente').AsInteger;
        Inc(numeros_reservas);
      end;
      ParamByName('fecha').AsString := DateToStr(Date());
      ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
      Open;
      DMGimnasio.IBTGimnasio.CommitRetaining;
    end;
    cantidad_system := cantidad_system + 1;
    LCantidad.Caption := IntToStr(cantidad_system);
    ActualizarDatos();
  except
    on e : Exception do
    begin
      if (ConReserva) then
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13
                  +'Probablemente quizo ingresar dos veces la misma reserva',mtError,[mbOk],0)
      else
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13
                  +'Probablemente quizo ingresar dos veces el mismo numero para la mmisma clase',mtError,[mbOk],0);
      DMGimnasio.IBTGimnasio.RollbackRetaining;
    end;
  end;
end;

procedure TFEntradaSalida.ActualizarDatos();
begin
  try
    IBQIngresoFecha.Close ;
    IBQIngresoFecha.ParamByName('fecha').AsString := DateToStr(Date());
    IBQIngresoFecha.ParamByName('fecha_D').AsDate := Date();
    IBQIngresoFecha.Open ;
    CalcularCaja;
  except
    on e : Exception do
      MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message,mtError,[mbOk],0);
  end;
end;

procedure TFEntradaSalida.BIngresoAparatosClick(Sender: TObject);
begin
  inherited;
    IBQTipoAparatos.Close;
    IBQTipoAparatos.ParamByName('id').AsInteger := DBGrid2.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
    IBQTipoAparatos.Open;


    if IBQTipoAparatos.FieldByName('id_disiplina').AsInteger = 33 then
    begin
      if (VerSiDebeCrossfit(DBGrid2.DataSource.DataSet.fieldByName('id_cliente').AsInteger)) then
        ShowMessage('El Usuario se Paso de la Fecha de Pago');
      try
        IBQIngresoCrossfit.Close;
        IBQIngresoCrossfit.ParamByName('disiplina').AsInteger := IBQTipoAparatos.fieldByName('id_disiplina').AsInteger;
        IBQIngresoCrossfit.ParamByName('cliente').AsInteger := DBGrid2.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
        //  IBQIngresoAparatos.ParamByName('pago').AsString := 'N';
        IBQIngresoCrossfit.ParamByName('fecha').AsString := FormatDateTime('dd/mm/yyyy',Today());
        IBQIngresoCrossfit.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
        IBQIngresoCrossfit.Open;
        DMGimnasio.IBTGimnasio.CommitRetaining;
        ActualizarDatos();
      except
        on e : Exception do
          MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13+
          'Probablemente quizo ingresar dos veces a la misma persona ',mtError,[mbOk],0);
      end;
    end
    else
    begin
      if (VerSiDebe(DBGrid2.DataSource.DataSet.fieldByName('id_cliente').AsInteger)) then
        ShowMessage('El Usuario se Paso de la Fecha de Pago');
      try
        IBQIngresoAparatos.Close;
        IBQingresoAparatos.ParamByName('disiplina').AsInteger := IBQTipoAparatos.fieldByName('id_disiplina').AsInteger;
        IBQIngresoAparatos.ParamByName('cliente').AsInteger := DBGrid2.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
        //  IBQIngresoAparatos.ParamByName('pago').AsString := 'N';
        IBQIngresoAparatos.ParamByName('fecha').AsString := FormatDateTime('dd/mm/yyyy',Today());
        IBQIngresoAparatos.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
        IBQIngresoAparatos.Open;
        DMGimnasio.IBTGimnasio.CommitRetaining;
        ActualizarDatos();
      except
        on e : Exception do
          MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13+
          'Probablemente quizo ingresar dos veces a la misma persona ',mtError,[mbOk],0);
      end;
    end;
end;

procedure TFEntradaSalida.IBQReservasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BIngresoSystem.Enabled := not IBQReservas.IsEmpty;
  BIngTroquelado.Enabled := not IBQReservas.IsEmpty;
end;

procedure TFEntradaSalida.IBQAparatosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  BIngresoAparatos.Enabled := not IBQAparatos.IsEmpty;
end;

procedure TFEntradaSalida.BArticulosClick(Sender: TObject);
var
  F : TFArticulos;
begin
  inherited;
  F := TFArticulos.Create(self);
  F.ShowModal;
  F.Destroy;
end;

procedure TFEntradaSalida.cxNombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := cxNombre.Text+'%';
  ActualizarListadoAparatos();
end;

procedure TFEntradaSalida.cxApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := cxApellido.Text+'%';
  ActualizarListadoAparatos();
end;

procedure TFEntradaSalida.BReservasClick(Sender: TObject);
begin
  inherited;
  FPrincipal.AReservasExecute(Sender);
  if (DBLCBDisiplina.KeyValue <> null) then
  begin
    IBQReservas.Close;
    IBQReservas.ParamByName('id').AsInteger := DBLCBDisiplina.KeyValue;
    IBQReservas.ParamByName('fecha').AsString := DateToStr(Date());
    IBQReservas.ParamByName('hora').AsString := FormatDateTime('hh:mm',HoraClase);
    IBQReservas.Open;
  end;
end;

procedure TFEntradaSalida.BCNuevoClick(Sender: TObject);
begin
  inherited;
  FPrincipal.AClienteNuevoExecute(Sender);
  ActualizarListadoAparatos();
end;

function TFEntradaSalida.VerSiDebeCrossfit(id_usuario : Integer) : Boolean;
var
  dia_hoy, dia_pago, anio, mes_hoy, mes_anterior, mes_ultimo_pago, dia_ultimo_pago : Word;
  Fecha_ingreso, Fecha_ultimo, Fecha_ultimo_pago, Fecha : TDate;
  Fecha_aux : String;
begin

    IBQVerificarPagoCrossfit.Close;
    IBQVerificarPago.ParamByName('id').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQVerificarPagoCrossfit.Open;

    //Primer Pago
    Fecha_ingreso := Date();
    Fecha_ultimo_pago := StrToDate('01/01/2000');
    IBQVerificarPagoCrossfit.First;
    while not IBQVerificarPagoCrossfit.Eof do
    begin
      Fecha_aux := IBQVerificarPagoCrossfit.fieldByName('fecha').AsString;
      Fecha := StrToDate(Fecha_aux);
      if (CompareDate(Fecha_ingreso,Fecha) = GreaterThanValue) then
        Fecha_ingreso := Fecha;
      IBQVerificarPagoCrossfit.Next;
    end;

    //Fecha Ultimo
    IBQVerificarPagoCrossfit.First;
    while not IBQVerificarPagoCrossfit.Eof do
    begin
      Fecha_aux := IBQVerificarPagoCrossfit.fieldByName('fecha').AsString;
      Fecha := StrToDate(Fecha_aux);
      if (CompareDate(Fecha_ultimo_pago,Fecha) = LessThanValue) then
        Fecha_ultimo_pago := Fecha;
      IBQVerificarPagoCrossfit.Next;
    end;

    DecodeDate(Fecha_ingreso,anio,mes_hoy,dia_pago);
    DecodeDate(Fecha_ultimo_pago,anio,mes_ultimo_pago,dia_ultimo_pago);
    DecodeDate(Date,anio,mes_hoy,dia_hoy);

    if (mes_hoy = 1) then mes_anterior := 12
    else mes_anterior := mes_hoy-1;

    Fecha_Ultimo := EncodeDate(anio,mes_anterior,dia_pago);

    if (mes_ultimo_pago < mes_hoy) then
      if (DaysBetween(Date(),Fecha_ultimo) > 30) then
        Result := true
      else
        Result := false
    else
      Result := false;

    {IBQUltimoPago.Close;
    IBQUltimoPago.ParamByName('cliente').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQUltimoPago.Open;
    if (IBQVerificarPago.fieldByName('fecha_ingreso').asString <> '') then
    begin
      Fecha := StrToDate(IBQVerificarPago.fieldByName('fecha_ingreso').AsString);
      cantMeses := MonthsBetween(Date(),Fecha)-1;
      MesPasado := IncMonth(Fecha,cantMeses);
      Dias := DaysBetween(Date(),MesPasado);
      if (Dias > 30) then
        Resultado := true;
    end;
    Result := Resultado;}

end;

function TFEntradaSalida.VerSiDebe(id_usuario : Integer) : Boolean;
var
  dia_hoy, dia_pago, anio, mes_hoy, mes_anterior, mes_ultimo_pago, dia_ultimo_pago : Word;
  Fecha_ingreso, Fecha_ultimo, Fecha_ultimo_pago, Fecha : TDate;
  Fecha_aux : String;
begin

    IBQVerificarPago.Close;
    IBQVerificarPago.ParamByName('id').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQVerificarPago.Open;

    //Primer Pago
    Fecha_ingreso := Date();
    Fecha_ultimo_pago := StrToDate('01/01/2000');
    IBQVerificarPago.First;
    while not IBQVerificarPago.Eof do
    begin
      Fecha_aux := IBQVerificarPago.fieldByName('fecha_ingreso').AsString;
      Fecha := StrToDate(Fecha_aux);
      if (CompareDate(Fecha_ingreso,Fecha) = GreaterThanValue) then
        Fecha_ingreso := Fecha;
      IBQVerificarPago.Next;
    end;

    //Fecha Ultimo
    IBQVerificarPago.First;
    while not IBQVerificarPago.Eof do
    begin
      Fecha_aux := IBQVerificarPago.fieldByName('fecha_ingreso').AsString;
      Fecha := StrToDate(Fecha_aux);
      if (CompareDate(Fecha_ultimo_pago,Fecha) = LessThanValue) then
        Fecha_ultimo_pago := Fecha;
      IBQVerificarPago.Next;
    end;

    DecodeDate(Fecha_ingreso,anio,mes_hoy,dia_pago);
    DecodeDate(Fecha_ultimo_pago,anio,mes_ultimo_pago,dia_ultimo_pago);
    DecodeDate(Date,anio,mes_hoy,dia_hoy);

    if (mes_hoy = 1) then mes_anterior := 12
    else mes_anterior := mes_hoy-1;

    Fecha_Ultimo := EncodeDate(anio,mes_anterior,dia_pago);

    if (mes_ultimo_pago < mes_hoy) then
      if (DaysBetween(Date(),Fecha_ultimo) > 30) then
        Result := true
      else
        Result := false
    else
      Result := false;

    {IBQUltimoPago.Close;
    IBQUltimoPago.ParamByName('cliente').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQUltimoPago.Open;
    if (IBQVerificarPago.fieldByName('fecha_ingreso').asString <> '') then
    begin
      Fecha := StrToDate(IBQVerificarPago.fieldByName('fecha_ingreso').AsString);
      cantMeses := MonthsBetween(Date(),Fecha)-1;
      MesPasado := IncMonth(Fecha,cantMeses);
      Dias := DaysBetween(Date(),MesPasado);
      if (Dias > 30) then
        Resultado := true;
    end;
    Result := Resultado;}

end;

procedure TFEntradaSalida.BPagoClick(Sender: TObject);
begin
  inherited;
  FPrincipal.APagoGimnasioExecute(self);
  ActualizarDatos();
end;

procedure TFEntradaSalida.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFEntradaSalida.LabelMouseEnter(Sender: TObject);
begin
  inherited;
  (Sender as TJvLabel).Font.Color := clTeal;
  (Sender as TJvLabel).Cursor := crHandPoint;
  (Sender as TJvLabel).Font.Style := [fsBold];
end;

procedure TFEntradaSalida.LabelMouseLeave(Sender: TObject);
begin
  inherited;
  (Sender as TJvLabel).Font.Color := clWhite;
  (Sender as TJvLabel).Cursor := crDefault;
  (Sender as TJvLabel).Font.Style := [fsBold];
end;

procedure TFEntradaSalida.LabelClick(Sender: TObject);
begin
  inherited;
  case (Sender as TJvLabel).Tag of
    1 : BArticulosClick(nil);
    2 : FPrincipal.AClienteNuevoExecute(nil);
    3 : FPrincipal.AEntradaExecute(nil);
    4 : FPrincipal.AFechasPagoExecute(nil);
    5 : FPrincipal.APagoGimnasioExecute(nil);
    6 : FPrincipal.APilatesExecute(nil);
    7 : FPrincipal.AReservasExecute(nil);
    8 : FPrincipal.ASalidaExecute(nil);
    9 : FPrincipal.ATroqueladosExecute(nil);
   10 : FPrincipal.APagoCrossfitExecute(nil);
   11 : CerrarCaja;
  end;
  CalcularCaja;
end;

procedure TFEntradaSalida.CalcularCaja;
var
  Entrada, Salida : Double;
begin
  TotalCaja := 0;
  IBQEntrada.Close;
  IBQEntrada.ParamByName('fecha').AsString := DateToStr(Date());
  IBQEntrada.ParamByName('fecha_2').AsDate := Date();
  IBQentrada.Open;

  IBQSalida.Close;
  IBQSalida.ParamByName('fecha').AsString := DateToStr(Date());
  IBQSalida.Open;

  Entrada := 0;
  Salida := 0;

  IBQEntrada.First;
  while not IBQEntrada.Eof do
  begin
    if IBQEntrada.FieldValues['SALDO'] <> null then
      Entrada := Entrada+IBQEntrada.FieldValues['SALDO'];
    IBQEntrada.Next;
  end;
  IBQSalida.First;
  while not IBQSAlida.Eof do
  begin
    if IBQSalida.FieldValues['VALOR'] <> null then
      Salida := Salida+IBQSalida.FieldValues['VALOR'];
    IBQSalida.Next;
  end;

  TotalCaja := Entrada-Salida;
  LCaja.Caption := '$ '+FormatFloat('#.00',TotalCaja);
end;

procedure TFEntradaSalida.CerrarCaja();
begin
  if MessageDlg('Desea guardar la caja?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    GuardarCaja();
    CalcularCaja();
  end;
end;

function TFEntradaSalida.CalcularFecha(Fecha : TDate) : TDate;
begin
  if (DayOfWeek(Fecha) = 7) then
    Result := IncDay(Fecha,2)
  else
    Result := IncDay(Fecha,1);
end;

procedure TFEntradaSalida.GuardarCaja();
begin
  try
    IBQCerrarCaja.Close;
    IBQCerrarCaja.ParamByName('desc').AsString := 'Entrada de Caja';
    IBQCerrarCaja.ParamByName('precio').AsFloat := TotalCaja;
    IBQCerrarCaja.ParamByName('fecha').AsString := DateToStr(CalcularFecha(Date()));
    IBQCerrarCaja.ParamByName('hora').AsString := '07:00';
    IBQCerrarCaja.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

procedure TFEntradaSalida.BIngTroqueladoClick(Sender: TObject);
begin
  inherited;
  try
    with IBQIngresoNumero do
    begin
      Close;
      ParamByName('numero').AsInteger := cantidad_troquelados;
      ParamByName('disiplina').Value := DBLCBDisiplina.KeyValue;
      ParamByName('pago').AsString := 'N';
      ParamByName('cliente').Value := null;
      if (ConReserva) then
      begin
        ParamByName('numero').AsInteger := numeros_reservas;
        ParamByName('pago').AsString := 'S';
        ParamByName('cliente').AsInteger := DBGReservas.DataSource.DataSet.fieldByName('cliente').AsInteger;
        Inc(numeros_reservas);
      end;
      ParamByName('fecha').AsString := DateToStr(Date());
      ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
      Open;
      DMGimnasio.IBTGimnasio.CommitRetaining;
    end;
    cantidad_troquelados := cantidad_troquelados + 1;
    //LCantidad.Caption := IntToStr(cantidad_system);
    ActualizarDatos();
  except
    on e : Exception do
    begin
      if (ConReserva) then
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13
                  +'Probablemente quizo ingresar dos veces la misma reserva',mtError,[mbOk],0)
      else
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message+#13
                  +'Probablemente quizo ingresar dos veces el mismo numero para la mmisma clase',mtError,[mbOk],0);
      DMGimnasio.IBTGimnasio.RollbackRetaining;
    end;
  end;
end;

procedure TFEntradaSalida.InicProfesor;
begin

  DBLCBResponsable.KeyValue := 7;

  LHora.Caption := TimeToStr(Time());
  ActualizarListadoAparatos();
  IBQInsertResponsable.Close;
  IBQInsertResponsable.ParamByName('id_profesor').Value := DBLCBResponsable.KeyValue;
  IBQInsertResponsable.ParamByName('fecha').AsString := DateToStr(Date());
  IBQInsertResponsable.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
  IBQInsertResponsable.Open;
  DMGimnasio.IBTGimnasio.CommitRetaining;
  GBAparatos.Enabled := true;
  GBAerobicos.Enabled := true;
  PBotones.Enabled := true;

end;

procedure TFEntradaSalida.cxBCajaClick(Sender: TObject);
var
  F : TFCajaPreview;
begin
  inherited;
  F := TFCajaPreview.Create(self);
  F.ValorCaja := LCaja.Caption;
  F.ShowModal;
  F.Destroy;
end;

end.
