unit UEstadisticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDatosDB, UUniversal, DB, IBCustomDataSet, IBQuery, MXPIVSRC,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, jpeg, Types,
  ExtCtrls, IBTable, cxControls, cxContainer, cxEdit, cxTextEdit, DateUtils,
  cxMaskEdit, DBGrids, cxLookAndFeelPainters, cxButtons,  UEstadisticasPreview,
  QRCtrls, UMensaje, pngimage;

type

  TDatos = record
    Cantidad : Integer;
    Dia : Integer;
    Hora : TTime;
    Disp : Integer;
    Disp_1 : Integer;
    Nombre_Dis : String;
    Nombre_Dis_1 : String;
    Profesor : String;
  end;
  TArrSemana = Array [0..5] of TDatos;
  TDatosSemana = record
    Semana : TArrSemana;
    Total : Integer;
    CantClases : Integer;
    Promedio : Double;
    Franja : Integer;
  end;
  TArrMes = Array of TDatosSemana;

  TFEstadisticas = class(TFUniversal)
    PFiltro: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    CBMeses: TComboBox;
    IBQGetEstadisticas: TIBQuery;
    PGrilla: TPanel;
    DSGetEstadisticas: TDataSource;
    EAnio: TEdit;
    PBotones: TPanel;
    Image2: TImage;
    BPreliminar: TcxButton;
    BSalir: TcxButton;
    SGEstadisticas: TStringGrid;
    IBQBorrarAux: TIBQuery;
    IBQCrono: TIBQuery;
    IBQClases: TIBQuery;
    procedure CBMesesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EAnioExit(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure BPreliminarClick(Sender: TObject);
  private
    Mes, Anio : Integer;
    Estadisticas : Array of TDatos;
    Crono : TArrMes;
    PromF1, PromF2, PromF3, AjusteF1, AjusteF2, AjusteF3 : Double;
    procedure ArmarCuadro(var F : TFEstadisticasPreview);
    procedure InicCrono();
    procedure InicTabla();
    procedure ArmarTabla();
    procedure CalcularAjustes();
    procedure CargarGrid();
    procedure CalculosPostConsulta();
  public
    { Public declarations }
  end;

var
  FEstadisticas: TFEstadisticas;

implementation

{$R *.dfm}

procedure TFEstadisticas.CalcularAjustes;
var
  Indice : Integer;
  SumaF1, SumaF2, SumaF3 : Double;
  CantF1, CantF2, CantF3 : Integer;
begin
  PromF1 := 0;
  PromF2 := 0;
  PromF3 := 0;
  AjusteF1 := 0;
  AjusteF2 := 0;
  AjusteF3 := 0;
  SumaF1 := 0;
  SumaF2 := 0;
  SumaF3 := 0;
  CantF1 := 0;
  CantF2 := 0;
  CantF3 := 0;
  for Indice := 0 to Length(Crono)-1 do
    case Crono[Indice].Franja of
      1 : begin
            Inc(CantF1);
            SumaF1 := SumaF1 + Crono[Indice].Promedio;
          end;
      2 : begin
            Inc(CantF2);
            SumaF2 := SumaF2 + Crono[Indice].Promedio;
          end;
      3 : begin
            Inc(CantF3);
            SumaF3 := SumaF3 + Crono[Indice].Promedio;
          end;
    end;
  if CantF1 > 0 then
  begin
    PromF1 := SumaF1 / CantF1;
    AjusteF1 := 1;
  end;
  if CantF2 > 0 then
  begin
    PromF2 := SumaF2 / CantF2;
    AjusteF2 := PromF1 / PromF2;
  end;
  if CantF3 > 0 then
  begin
    PromF3 := SumaF3 / CantF3;
    AjusteF3 := PromF1 / PromF3;
  end;

end;

procedure TFEstadisticas.InicCrono;
var
  Indice, I : Integer;
begin
  for Indice := 0 to Length(Crono)-1 do
  begin
    for I := 0 to 5 do
    begin
      Crono[Indice].Semana[I].Cantidad := 0;
      Crono[Indice].Semana[I].Dia := 0;
      Crono[Indice].Semana[I].Disp := 0;
      Crono[Indice].Semana[I].Disp_1 := 0;
      Crono[Indice].Semana[I].Hora := 0;
      Crono[Indice].Semana[I].Nombre_Dis := '';
      Crono[Indice].Semana[I].Nombre_Dis_1 := '';
      Crono[Indice].Semana[I].Profesor := '';
    end;
    Crono[Indice].Franja := 0;
    Crono[Indice].CantClases := 0;
    Crono[Indice].Promedio := 0;
    Crono[Indice].Total := 0;
  end;
end;

procedure TFEstadisticas.InicTabla;
var
  F,C : Integer;
begin
  for C := 0 to SGEstadisticas.ColCount-1 do
    for F := 0 to SGEstadisticas.RowCount-1 do
      SGEstadisticas.Cells[C,F] := '';
end;

procedure TFEstadisticas.CalculosPostConsulta;
var
  Y, X : Integer;
  Cant, Suma : Integer;
  Maximo : Double;
begin
  Maximo := 0;
  for Y := 0 to Length(Crono)-1 do
  begin
    Cant := 0;
    Suma := 0;
    for X := 0 to 5 do
      if Crono[Y].Semana[X].Nombre_Dis <> '' then
      begin
        Cant := Cant + Crono[Y].Semana[X].Cantidad;
        Inc(Suma);
      end;
    Crono[Y].CantClases := Cant;
    Crono[Y].Total := Suma;
    Crono[Y].Promedio := Cant / Suma;
    if Crono[Y].Promedio > Maximo then
      Maximo := Crono[Y].Promedio;
  end;
  Maximo := Maximo / 3;
  for Y := 0 to Length(Crono)-1 do
  begin
    if (Crono[Y].Promedio > 0) and (Crono[Y].Promedio <= Maximo) then
      Crono[Y].Franja := 3;
    if (Crono[Y].Promedio > Maximo) and (Crono[Y].Promedio <= (Maximo*2)) then
      Crono[Y].Franja := 2;
    if (Crono[Y].Promedio > (Maximo*2)) then
      Crono[Y].Franja := 1;
  end;
end;

procedure TFEstadisticas.ArmarTabla;
var
  I, cantDias, Indice, MaxMes, DiaSemana : Integer;
  Fecha, DiaS, MesS : String;
  H : TTime;
  F : TFMensaje;
  procedure InicArreglo(I : Integer);
  var
    Ind : Integer;
  begin
    Crono[I].CantClases := 0;
    Crono[I].Franja := 0;
    Crono[I].Promedio := 0;
    Crono[I].Total := 0;
    for Ind := 0 to 5 do
    begin
      Crono[I].Semana[Ind].Cantidad := 0;
      Crono[I].Semana[Ind].Dia := 0;
      Crono[I].Semana[Ind].Disp := 0;
      Crono[I].Semana[Ind].Disp_1 := 0;
      Crono[I].Semana[Ind].Hora := 0;
      Crono[I].Semana[Ind].Nombre_Dis := '';
      Crono[I].Semana[Ind].Nombre_Dis_1 := '';
      Crono[I].Semana[Ind].Profesor := '';
    end;
  end;
begin
  F := TFMensaje.Create(nil,'Calculando Cantidades para el mes de '+CBMeses.Text);
  F.Show;
  Application.ProcessMessages;
  try
   { Crono := nil;
    SetLength(Crono,1);
    InicCrono;}
    SetLength(Crono,0);

    IBQCrono.Close;
    IBQCrono.SQL.Clear;
    IBQCrono.SQL.Add('SELECT MAX(MES) AS MES FROM ACARGO WHERE ANIO = :ANIO AND MES <= :MES');
    IBQCrono.ParamByName('ANIO').AsInteger := Anio;
    IBQCrono.ParamByName('MES').AsInteger := Mes;
    IBQCrono.Open;
    MaxMes := IBQCrono.FieldValues['MES'];

    IBQCrono.Close;
    IBQCrono.SQL.Clear;
    IBQCrono.SQL.Add('SELECT A.ID_DISIPLINA, D.NOMBRE, A.DIA, A.HORA FROM ACARGO A JOIN DISIPLINAS D ON A.ID_DISIPLINA = D.ID_DISIPLINA WHERE A.MES = :MES AND A.ANIO = :ANIO AND A.ID_DISIPLINA <> 26 ORDER BY A.HORA, A.DIA ASC');
    IBQCrono.ParamByName('ANIO').AsInteger := Anio;
    IBQCrono.ParamByName('MES').AsInteger := MaxMes;
    IBQCrono.Open;
    IBQCrono.First;
    Indice := 0;
    SetLength(Crono,Indice+1);
    H := StrToTime(IBQCrono.FieldByName('HORA').AsString);
    while not IBQCrono.Eof do
    begin
      if H <> StrToTime(IBQCrono.FieldByName('HORA').AsString) then
      begin
        Inc(Indice);
        SetLength(Crono,Indice+1);
        H := StrToTime(IBQCrono.FieldByName('HORA').AsString);
        InicArreglo(Indice);
      end;
      Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Dia := IBQCrono.FieldByName('DIA').AsInteger;
      Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Hora := StrToTime(IBQCrono.FieldByName('HORA').AsString);
      if Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Disp = 0 then
      begin
        Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Disp := IBQCrono.FieldByName('ID_DISIPLINA').AsInteger;
        Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Nombre_Dis := IBQCrono.FieldByName('NOMBRE').AsString;
      end
      else
      begin
        Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Disp_1 := IBQCrono.FieldByName('ID_DISIPLINA').AsInteger;
        Crono[Indice].Semana[IBQCrono.FieldByName('DIA').AsInteger-1].Nombre_Dis_1 := IBQCrono.FieldByName('NOMBRE').AsString;
      end;
      IBQCrono.Next;
    end;

    cantDias := DaysInAMonth(Anio,Mes);
    for I := 1 to cantDias do
    begin
      if Mes >= 10 then
        MesS := IntToStr(Mes)
      else
        MesS := '0'+IntToStr(Mes);

      if I >= 10 then
        DiaS := IntToStr(I)
      else
        DiaS := '0'+IntToStr(I);

      DiaSemana := DayOfWeek(EncodeDate(Anio,Mes,I))-2;
      Fecha := DiaS+'/'+MesS+'/'+IntToStr(Anio);

      //Consulta a la BD con Fecha
      IBQClases.Close;
      IBQClases.ParamByName('FECHA').AsString := Fecha;
      IBQClases.Open;
      IBQClases.First;
      while not IBQClases.Eof do
      begin
        H := StrToTime(IBQClases.FieldByName('HORA').AsString);
        Indice := 0;
        while Indice < Length(Crono) do
        begin
          if (CompareTime(IncHour(Crono[Indice].Semana[DiaSemana].Hora,-1),H) = LessThanValue)
              and (CompareTime(IncHour(Crono[Indice].Semana[DiaSemana].Hora,1),H) = GreaterThanValue) then
            break;
          Inc(Indice);
        end;
        Crono[Indice].Semana[DiaSemana].Cantidad := Crono[Indice].Semana[DiaSemana].Cantidad + IBQClases.FieldByName('CANT').AsInteger;
        IBQClases.Next;
      end;
      //
    end;
    CargarGrid;
    CalculosPostConsulta;
    CalcularAjustes;
  except
    SetLength(Crono,0);
  end;
  F.Close;
  F.Destroy;
end;

procedure TFEstadisticas.CargarGrid;
var
  DiaS, HoraS : Integer;
begin
  SGEstadisticas.RowCount := 1;
  InicTabla();
  SGEstadisticas.RowCount := Length(Crono);
  for HoraS := 0 to Length(Crono)-1 do
    for DiaS := 0 to 5 do
    begin
      if (Crono[HoraS].Semana[DiaS].Dia = 0) or (Crono[HoraS].Semana[DiaS].Nombre_Dis = '') then
        SGEstadisticas.Cells[DiaS,HoraS] := ''
      else
        SGEstadisticas.Cells[DiaS,HoraS] := Crono[HoraS].Semana[DiaS].Nombre_Dis+' '+Crono[HoraS].Semana[DiaS].Nombre_Dis_1+' Cant: '+IntToStr(Crono[HoraS].Semana[DiaS].Cantidad);
    end;
end;

procedure TFEstadisticas.CBMesesChange(Sender: TObject);
begin
  inherited;
  Mes := CBMeses.ItemIndex+1;
  ArmarTabla();
end;

procedure TFEstadisticas.FormCreate(Sender: TObject);
begin
  inherited;
  Mes := MonthOf(Today());
  Anio := YearOf(Today());
  EAnio.Text := IntToStr(Anio);
  CBMeses.ItemIndex := Mes-1;
  ArmarTabla();
end;

procedure TFEstadisticas.EAnioExit(Sender: TObject);
begin
  inherited;
  TryStrToInt(EAnio.Text,Anio);
  ArmarTabla();
end;

procedure TFEstadisticas.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFEstadisticas.BPreliminarClick(Sender: TObject);
var
  F : TFEstadisticasPreview;
begin
  inherited;
  F := TFEstadisticasPreview.Create(nil);
  ArmarCuadro(F);
  F.QRLAnio.Caption := IntToStr(Anio);
  F.QRLMes.Caption := CBMeses.Text;
  F.QRLPromAsistF1.Caption := FormatFloat('##.##',PromF1);
  F.QRLPromAsistF2.Caption := FormatFloat('##.##',PromF2);
  F.QRLPromAsistF3.Caption := FormatFloat('##.##',PromF3);
  F.QRLAjusteF1.Caption := FormatFloat('##.##',AjusteF1);
  F.QRLAjusteF2.Caption := FormatFloat('##.##',AjusteF2);
  F.QRLAjusteF3.Caption := FormatFloat('##.##',AjusteF3);
  F.QREstadisticas.Preview;
  F.Destroy;
end;

procedure TFEstadisticas.ArmarCuadro(var F : TFEstadisticasPreview);
var
  PosX, PosY, Indice, Ancho, Alto, IndAux, I, Fil, Col: Integer;
  Hora, HoraAux : TTime;
begin
  PosX := F.QRLHora.Left+F.QRLHora.Width;
  PosY := F.QRLHora.Top+F.QRLHora.Height;
  Ancho := F.QRLHora.Width;
  Alto := F.QRLHora.Height;
  IndAux := 0;

  ///Cargar las horas
  for Indice := 0 to Length(Crono)-1 do
  begin
    for I := 0 to 5 do
      if Crono[Indice].Semana[I].Hora <> 0 then
        break;

    with (TQRLabel(F.QRBCuadro.AddPrintable(TQRLabel))) do
    begin
      Left := F.QRLHora.Left;
      Top := PosY;
      Width := Ancho;
      Height := Alto;
      AutoSize := false;
      AutoStretch := true;
      Alignment := taCenter;
      if (IndAux Mod 2) = 0 then
        Color := $00B4B4B4
      else
        Color := clGray;
      Caption := TimeToStr(Crono[Indice].Semana[I].Hora);
      Font.Size := 10;
    end;
    PosY := PosY + Alto;
    Inc(IndAux);
  end;
  /////////////////////////////////////////////////
  PosX := F.QRLHora.Left+F.QRLHora.Width;
  PosY := F.QRLHora.Top+F.QRLHora.Height;
  Ancho := F.QRLHora.Width;
  Alto := F.QRLHora.Height;
  IndAux := 0;
  for Col := 0 to SGEstadisticas.ColCount -1 do
  begin
    for Fil := 0 to SGEstadisticas.RowCount -1 do
    begin
      with (TQRLabel(F.QRBCuadro.AddPrintable(TQRLabel))) do
      begin
        Left := PosX;
        Top := PosY;
        Width := Ancho;
        Height := Alto;
        AutoSize := false;
        AutoStretch := true;
        Caption := SGEstadisticas.Cells[Col,Fil];
        Font.Size := 6;
        Alignment := taCenter;
        if (IndAux Mod 2) = 0 then
          Color := $00B4B4B4
        else
          Color := clGray;
      end;
      PosY := PosY + Alto;
      Inc(IndAux);
    end;
    PosX := PosX + Ancho;
    PosY := F.QRLHora.Top+F.QRLHora.Height;
    IndAux := 0;
  end;
  ////////////////////////////////////////////////////////
  PosX := F.QRLTotal.Left;
  Ancho := F.QRLTotal.Width;
  for Indice := 0 to Length(Crono)-1 do
  begin
    for IndAux := 0 to 3 do
    begin
      with (TQRLabel(F.QRBCuadro.AddPrintable(TQRLabel))) do
      begin
        Left := PosX;
        Top := PosY;
        Width := Ancho;
        Height := Alto;
        AutoSize := false;
        AutoStretch := true;
        case IndAux of
          0 : Caption := IntToStr(Crono[Indice].CantClases);
          1 : Caption := IntToStr(Crono[Indice].Total);
          2 : Caption := FormatFloat('##,##',Crono[Indice].Promedio);
          3 : Caption := IntToStr(Crono[Indice].Franja);
        end;
        Font.Size := 6;
        Alignment := taCenter;
        if (Indice mod 2) = 0 then
          Color := $00464646
        else
          Color := clBlack;
        Font.Color := clWhite;
      end;
      PosX := PosX + Ancho;
    end;
    PosX := F.QRLTotal.Left;
    PosY := PosY + Alto; 
  end;
end;

end.
