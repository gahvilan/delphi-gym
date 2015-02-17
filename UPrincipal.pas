unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, Menus, ExtCtrls, StdCtrls, jpeg, ComCtrls,
  dxsbar, dxNavBarCollns, dxNavBarBase, dxNavBar, ImgList, Buttons, DB,
  IBCustomDataSet, IBQuery, IBTable, DateUtils, Types, IniFiles, Registry,
  pngimage, JvExExtCtrls, JvImage;

type
  TFPrincipal = class(TFUniversal)
    ActionList1: TActionList;
    AEntradaSalida: TAction;
    AClienteNuevo: TAction;
    ABMProfesores: TAction;
    ABMClases: TAction;
    ABMUsuarios: TAction;
    ABMArticulos: TAction;
    AReservas: TAction;
    ACronograma: TAction;
    AListadoClientes: TAction;
    ATroquelados: TAction;
    ASalida: TAction;
    ARepPlanillaES: TAction;
    ARepStock: TAction;
    AEntrada: TAction;
    ARepProfesoresAerobicos: TAction;
    APagoGimnasio: TAction;
    ARepPagoAparatos: TAction;
    AEliminarRegistro: TAction;
    ImageList1: TImageList;
    AResumenMensual: TAction;
    AAvisos: TAction;
    AParametros: TAction;
    IBQCumple: TIBQuery;
    AFechasPago: TAction;
    IBTable: TIBTable;
    IBQAparatos: TIBQuery;
    IBQClientes: TIBQuery;
    IBQUltimoPago: TIBQuery;
    APilates: TAction;
    AListadoPilates: TAction;
    AEliminarPilates: TAction;
    AEstadisticas: TAction;
    APagoCrossfit: TAction;
    PTabs: TPanel;
    JvIAdmin: TJvImage;
    JvIConsultas: TJvImage;
    JvIConfig: TJvImage;
    PAdmin: TPanel;
    IAdmin: TImage;
    JvIClienteNuevo: TJvImage;
    JvIEliminarRegAparatos: TJvImage;
    JvIEliminarRegPilates: TJvImage;
    JvIFechaPagoAparato: TJvImage;
    JvIPlanillaCliente: TJvImage;
    JvIPlanillaES: TJvImage;
    JvIReservas: TJvImage;
    LClienteNuevo: TLabel;
    LEliminarRegAparatos: TLabel;
    LEliminarRegPilates: TLabel;
    LFechaPagoAparatos: TLabel;
    LPlanillaClientes: TLabel;
    LPlanillaES: TLabel;
    LReservas: TLabel;
    PConsultas: TPanel;
    IConsultas: TImage;
    JvIListaPilates: TJvImage;
    JvIAerobicos: TJvImage;
    JvIAparatos: TJvImage;
    JvICumpleanios: TJvImage;
    JvIPlanillaESConsult: TJvImage;
    JvIResumenMensual: TJvImage;
    JvIStockArticulos: TJvImage;
    LListaPilates: TLabel;
    LAerobicos: TLabel;
    LAparatos: TLabel;
    LCumpleanios: TLabel;
    LPlanillaESConsult: TLabel;
    LResumenMensual: TLabel;
    LStockArticulos: TLabel;
    PConnfig: TPanel;
    IConfig: TImage;
    JvIArticulos: TJvImage;
    JvICronograma: TJvImage;
    JvIDisciplinas: TJvImage;
    JvIParametros: TJvImage;
    JvIProfesores: TJvImage;
    JvIUsuarios: TJvImage;
    LArticulos: TLabel;
    LCronograma: TLabel;
    LDisciplinas: TLabel;
    LParametros: TLabel;
    LProfesores: TLabel;
    LUsuarios: TLabel;
    PBienvenida: TPanel;
    IFondoBienvenida: TImage;
    ILogoTrans: TImage;
    IPestDis: TImage;
    procedure AClienteNuevoExecute(Sender: TObject);
    procedure AEntradaSalidaExecute(Sender: TObject);
    procedure ABMProfesoresExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ABMClasesExecute(Sender: TObject);
    procedure ABMUsuariosExecute(Sender: TObject);
    procedure ABMArticulosExecute(Sender: TObject);
    procedure AReservasExecute(Sender: TObject);
    procedure ACronogramaExecute(Sender: TObject);
    procedure AListadoClientesExecute(Sender: TObject);
    procedure ATroqueladosExecute(Sender: TObject);
    procedure ASalidaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ARepPlanillaESExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARepStockExecute(Sender: TObject);
    procedure AEntradaExecute(Sender: TObject);
    procedure ARepProfesoresAerobicosExecute(Sender: TObject);
    procedure APagoGimnasioExecute(Sender: TObject);
    procedure ARepPagoAparatosExecute(Sender: TObject);
    procedure AEliminarRegistroExecute(Sender: TObject);
    procedure AResumenMensualExecute(Sender: TObject);
    procedure AAvisosExecute(Sender: TObject);
    procedure AParametrosExecute(Sender: TObject);
    procedure AFechasPagoExecute(Sender: TObject);
    procedure APilatesExecute(Sender: TObject);
    procedure AListadoPilatesExecute(Sender: TObject);
    procedure AEliminarPilatesExecute(Sender: TObject);
    procedure AEstadisticasExecute(Sender: TObject);
    procedure APagoCrossfitExecute(Sender: TObject);
    procedure JvITabClick(Sender: TObject);
    procedure JvIBotonClick(Sender: TObject);
    procedure LabelClick(Sender: TObject);
  private
    procedure ArreglarTabla();
    procedure AbrirFormulario(Formulario : TFUniversal);
    function Verificar() : Boolean;
    procedure CambiarTab(Tag : integer);
    procedure CambiarPanel(Tag : Integer);
    procedure EjecutarAccion(Tag : Integer);
    procedure ConectarBD();
  public
    Establecimiento : Integer;
    Usuario, Rol, Profesor : String;
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  UClientesNuevos, UEntradaSalida, UABMProfesores, UABMClases, UABMUsuarios, UABMArticulos,
  UReservas, UCronograma, UListadoClientes, UIngresosVarios, USalida, ULogin, URepPlanillaES,
  URepStock, UEntradasVarias, URepProfesoresAerobicos, UPagoGimnasio, URepAparatos, UEliminarRegAparatos,
  UResumenMensual, UAvisos, UParametros, UDatosDB, UFechaPago, UPilates, URepListadoPilates,
  UEliminarPilates, UEstadisticas, UPagoCrosfit;
{$R *.dfm}

procedure TFPrincipal.AbrirFormulario(Formulario : TFUniversal);
begin
  Formulario.ShowModal;
  Formulario.Destroy;
end;

procedure TFPrincipal.AClienteNuevoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFClientesNuevos.Create(self));
end;

procedure TFPrincipal.AEntradaSalidaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFEntradaSalida.Create(self));
end;

procedure TFPrincipal.ABMProfesoresExecute(Sender: TObject);
begin
  inherited;
 AbrirFormulario(TFABMProfesores.Create(self));
end;

function TFPrincipal.Verificar : Boolean;
var
  INI : TIniFile;
  Reg : TRegistry;
begin
  INI := TIniFile.Create(ExtractFilePath(Application.ExeName)+'Gimnasio.INI');
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    if INI.ReadInteger('INSTDESC','AppDesc',1) = 0 then
    begin
      Reg.OpenKey('Software\Gimnasio',true);
      Reg.WriteInteger('AppDesc',1);
      INI.WriteInteger('INSTDESC','AppDesc',1);
      Result := true;
    end
    else
    begin
      if Reg.KeyExists('Software\Gimnasio') then
      begin
        Reg.OpenKey('Software\Gimnasio',false);
        if Reg.ReadInteger('AppDesc') = 1 then
          Result := true
        else
          Result := false;
      end
      else
        Result := false;
    end;
  finally
    Reg.Free;
    INI.Free;
  end;
end;

procedure TFPrincipal.ConectarBD;
var
  dir : String;
begin
  dir := ExtractFilePath(Application.ExeName)+'GIMNASIO.FDB';
  try
    UDatosDB.DMGimnasio.IBDGimnasio.Connected := false;
    UDatosDB.DMGimnasio.IBDGimnasio.DatabaseName := dir;
    UDatosDB.DMGimnasio.IBDGimnasio.Connected := true;
  except
  end;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  F : TFLogin;
begin
  inherited;
  ConectarBD;
  if Verificar then
  begin
    CopyFile(PChar('Gimnasio.fdb'),PChar('Gimnasio_1.fdb'),false);
    Establecimiento := 1;
    F := TFLogin.Create(self);
    F.ShowModal();
    if ((Usuario = 'N') and (Rol = 'N')) then
    begin
      F.Destroy;
      Application.Terminate;
    end
    else
      F.Destroy;
    {FPrincipal.Usuario := 'admin';
    FPrincipal.Rol := 'Administrador';
    FPrincipal.Profesor := 'juan';  }
    ArreglarTabla();
  end
  else
  begin
    MessageDlg('La Aplicacion no fue instalada correctamente',mtError,[mbOk],0);
    Application.Terminate;
  end;
end;

procedure TFPrincipal.ABMClasesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFABMClases.Create(self));
end;

procedure TFPrincipal.ABMUsuariosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFABMUsuarios.Create(self));
end;

procedure TFPrincipal.ABMArticulosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFABMArticulos.Create(self));
end;

procedure TFPrincipal.AReservasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFReservas.Create(self));
end;

procedure TFPrincipal.ACronogramaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFCronograma.Create(self));
end;

procedure TFPrincipal.AListadoClientesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFListadoClientes.Create(self));
end;

procedure TFPrincipal.ATroqueladosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFIngresosVarios.Create(self));
end;

procedure TFPrincipal.ASalidaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFSalida.Create(self));
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  if (Rol <> 'Administrador') then
  begin
    JvIConfig.Picture := IPestDis.Picture;
    JvIConfig.Enabled := false;
    JvIConfig.Cursor := crArrow;
    JvIConfig.Pictures.PicEnter := nil;

    JvIAparatos.Picture := JvIAparatos.Pictures.PicClicked2;
    JvIAparatos.Enabled := false;
    JvIAparatos.Cursor := crArrow;
    JvIAparatos.Pictures.PicEnter := nil;
    LAparatos.Font.Color := clGray;
    LAparatos.Enabled := false;
    LAparatos.Cursor := crArrow;

    JvIAerobicos.Picture := JvIAerobicos.Pictures.PicClicked2;
    JvIAerobicos.Enabled := false;
    JvIAerobicos.Cursor := crArrow;
    JvIAerobicos.Pictures.PicEnter := nil;
    LAerobicos.Font.Color := clGray;
    LAerobicos.Enabled := false;
    LAerobicos.Cursor := crArrow;


    JvIResumenMensual.Picture := JvIResumenMensual.Pictures.PicClicked2;
    JvIResumenMensual.Enabled := false;
    JvIResumenMensual.Cursor := crArrow;
    JvIResumenMensual.Pictures.PicEnter := nil;
    LResumenMensual.Font.Color := clGray;
    LResumenMensual.Enabled := false;
    LResumenMensual.Cursor := crArrow;

  end;
  IBQCumple.Close;
  IBQCumple.Open;
  if IBQCumple.FieldByName('valor').AsInteger = 1 then
    AAvisos.Execute;
end;

procedure TFPrincipal.ARepPlanillaESExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFRepPlanillaES.Create(self));
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CopyFile(PChar('Gimnasio.fdb'),PChar('Gimnasio_2.fdb'),false);
end;

procedure TFPrincipal.ARepStockExecute(Sender: TObject);
var
  F : TFRepStock;
begin
  inherited;
  F := TFRepStock.Create(self);
  F.QuickRep1.Preview;
  F.Destroy;
end;

procedure TFPrincipal.AEntradaExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFEntradasVarias.Create(self));
end;

procedure TFPrincipal.ARepProfesoresAerobicosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFRepProfesoresAerobicos.Create(self));
end;

procedure TFPrincipal.APagoGimnasioExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFPagoGimnasio.Create(self));
end;

procedure TFPrincipal.ARepPagoAparatosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFRepAparatos.Create(self));
end;

procedure TFPrincipal.AEliminarRegistroExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFEliminarRegAparatos.Create(self));
end;

procedure TFPrincipal.AResumenMensualExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFResumenMensual.Create(self));
end;

procedure TFPrincipal.AAvisosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFAvisos.Create(self));
end;

procedure TFPrincipal.AParametrosExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFParametros.Create(self));
end;

procedure TFPrincipal.AFechasPagoExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFFechaPago.Create(self));
end;

procedure TFPrincipal.ArreglarTabla();
var
  fecha, fecha_aux : TDate;
  fecha_str : String;
  disiplina : integer;
begin
 { if IBTable.IsEmpty then
  begin
    IBQClientes.Close;
    IBQClientes.ParamByName('esta').AsInteger := self.Establecimiento;
    IBQClientes.Open;
    IBQClientes.First;
    while not IBQClientes.Eof do
    begin
      IBQAparatos.Close;
      IBQAparatos.ParamByName('cli').AsInteger := IBQClientes.FieldValues['id_cliente'];
      IBQAparatos.Open;
      IBQAparatos.First;
      fecha := StrToDate('01/01/2000');
      while not IBQAparatos.Eof do
      begin
        fecha_str := IBQAparatos.FieldValues['fecha_ingreso'];
        fecha_aux := StrToDate(fecha_str);
        if (CompareDate(fecha,fecha_aux)=LessThanValue) then
        begin
          fecha := fecha_aux;
          disiplina := IBQAparatos.FieldValues['disiplina'];
        end;
        IBQAparatos.Next;
      end;
      if not IBQAparatos.IsEmpty then
      begin
        try
          IBQUltimoPago.Close;
          IBQUltimoPago.ParamByName('cliente').AsInteger := IBQClientes.FieldValues['id_cliente'];
          IBQUltimoPago.ParamByName('fecha1').AsDate := fecha;
          IBQUltimoPago.ParamByName('fecha2').AsDate := fecha;
          IBQUltimoPago.ParamByName('dis').AsInteger := disiplina;
          IBQUltimoPago.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        except
          DMGimnasio.IBTGimnasio.RollbackRetaining;
        end;
      end;
      IBQClientes.Next;
    end;

  end; }
end;

procedure TFPrincipal.APilatesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFPilates.Create(self));
end;

procedure TFPrincipal.AListadoPilatesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFListadoPilates.Create(self));
end;

procedure TFPrincipal.AEliminarPilatesExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFEliminarPilates.Create(self));
end;

procedure TFPrincipal.AEstadisticasExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFEstadisticas.Create(self));
end;

procedure TFPrincipal.APagoCrossfitExecute(Sender: TObject);
begin
  inherited;
  AbrirFormulario(TFPagoCrossfit.Create(self));
end;

procedure TFPrincipal.CambiarTab(Tag : Integer);
begin
  PBienvenida.Visible := false;
  case Tag of
    1 : begin
          JvIAdmin.Picture := JvIAdmin.Pictures.PicEnter;
          JvIConsultas.Picture := JvIConsultas.Pictures.PicClicked2;
          if (Rol = 'Administrador') then
            JvIConfig.Picture := JvIConfig.Pictures.PicClicked2;
        end;
    2 : begin
          JvIAdmin.Picture := JvIAdmin.Pictures.PicClicked2;
          JvIConsultas.Picture := JvIConsultas.Pictures.PicEnter;
          if (Rol = 'Administrador') then
            JvIConfig.Picture := JvIConfig.Pictures.PicClicked2;
        end;
    3 : begin
          JvIAdmin.Picture := JvIAdmin.Pictures.PicClicked2;
          JvIConsultas.Picture := JvIConsultas.Pictures.PicClicked2;
          JvIConfig.Picture := JvIConfig.Pictures.PicEnter;
        end;
  end;
end;

procedure TFPrincipal.CambiarPanel(Tag : Integer);
begin
  case Tag of
    1 : begin
          PConsultas.Align := alCustom;
          PConsultas.Visible := false;

          PConnfig.Align := alCustom;
          PConnfig.Visible := false;

          PAdmin.Visible := true;
          PAdmin.Align := alClient;
        end;
    2 : begin
          PConnfig.Align := alCustom;
          PConnfig.Visible := false;

          PAdmin.Align := alCustom;
          PAdmin.Visible := false;

          PConsultas.Visible := true;
          PConsultas.Align := alClient;
        end;
    3 : begin
          PConsultas.Align := alCustom;
          PConsultas.Visible := false;

          PAdmin.Align := alCustom;
          PAdmin.Visible := false;

          PConnfig.Visible := true;
          PConnfig.Align := alClient;
        end;
  end;
end;

procedure TFPrincipal.JvITabClick(Sender: TObject);
begin
  inherited;
  CambiarTab((Sender as TJvImage).Tag);
  CambiarPanel((Sender as TJvImage).Tag);
end;

procedure TFPrincipal.JvIBotonClick(Sender: TObject);
begin
  EjecutarAccion((Sender as TJvImage).Tag);
end;

procedure TFPrincipal.LabelClick(Sender: TObject);
begin
  EjecutarAccion((Sender as TLabel).Tag);
end;

procedure TFPrincipal.EjecutarAccion(Tag : Integer);
begin
  case Tag of
    1 : AClienteNuevo.Execute;
    2 : AEliminarRegistro.Execute;
    3 : AEliminarPilates.Execute;
    4 : AFechasPago.Execute;
    5 : AListadoClientes.Execute;
    6 : AEntradaSalida.Execute;
    7 : AReservas.Execute;
    8 : AListadoPilates.Execute;
    9 : ARepProfesoresAerobicos.Execute;
    10 : ARepPagoAparatos.Execute;
    11 : AAvisos.Execute;
    12 : ARepPlanillaES.Execute;
    13 : AResumenMensual.Execute;
    14 : ARepStock.Execute;
    15 : ABMArticulos.Execute;
    16 : ACronograma.Execute;
    17 : ABMClases.Execute;
    18 : AParametros.Execute;
    19 : ABMProfesores.Execute;
    20 : ABMUsuarios.Execute;
  end;
end;

end.
