unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ActnList, Menus, ExtCtrls, StdCtrls, jpeg, ComCtrls,
  dxsbar, dxNavBarCollns, dxNavBarBase, dxNavBar, ImgList, Buttons, DB,
  IBCustomDataSet, IBQuery, IBTable, DateUtils, Types, IniFiles, Registry;

type
  TFPrincipal = class(TFUniversal)
    MMPrincipal: TMainMenu;
    ActionList1: TActionList;
    Administracion1: TMenuItem;
    Consultas1: TMenuItem;
    Configuracion1: TMenuItem;
    AEntradaSalida: TAction;
    AClienteNuevo: TAction;
    PlanilladeEntradaSalida1: TMenuItem;
    ClientesNuevos1: TMenuItem;
    ABMProfesores: TAction;
    Profesores1: TMenuItem;
    ABMClases: TAction;
    Disiplinas1: TMenuItem;
    ABMUsuarios: TAction;
    ABMArticulos: TAction;
    Usuarios1: TMenuItem;
    Articulos1: TMenuItem;
    Image2: TImage;
    AReservas: TAction;
    ReservacindeRPMyBodyJump1: TMenuItem;
    Cronograma1: TMenuItem;
    ACronograma: TAction;
    AListadoClientes: TAction;
    PlanilladeClientes1: TMenuItem;
    ATroquelados: TAction;
    ASalida: TAction;
    SBPrincipal: TStatusBar;
    PlanillaEntradaSalida1: TMenuItem;
    ARepPlanillaES: TAction;
    PlanilladeHoras1: TMenuItem;
    Mensual1: TMenuItem;
    PorProfesor1: TMenuItem;
    StockdeArticulos1: TMenuItem;
    ARepStock: TAction;
    AEntrada: TAction;
    ARepProfesoresAerobicos: TAction;
    APagoGimnasio: TAction;
    ARepPagoAparatos: TAction;
    EliminarRegistrodeAparatos1: TMenuItem;
    AEliminarRegistro: TAction;
    dxNavBar1: TdxNavBar;
    dxNavBar1Group1: TdxNavBarGroup;
    dxNavBar1Group2: TdxNavBarGroup;
    dxNavBar1Group3: TdxNavBarGroup;
    dxClientes: TdxNavBarItem;
    dxRegAparatos: TdxNavBarItem;
    dxPlanClientes: TdxNavBarItem;
    dxEntradaSalida: TdxNavBarItem;
    dxReservas: TdxNavBarItem;
    dxPEntradaSalida: TdxNavBarItem;
    dxPHorasAerobicos: TdxNavBarItem;
    dxPHorasAparatos: TdxNavBarItem;
    dxPStock: TdxNavBarItem;
    dxArticulos: TdxNavBarItem;
    dxCronograma: TdxNavBarItem;
    dxDisiplinas: TdxNavBarItem;
    dxProfesores: TdxNavBarItem;
    dxUsuarios: TdxNavBarItem;
    ImageList1: TImageList;
    AResumenMensual: TAction;
    ResumenMensual1: TMenuItem;
    dxResumenMensual: TdxNavBarItem;
    AAvisos: TAction;
    Cumpleaos1: TMenuItem;
    dxAvisos: TdxNavBarItem;
    AParametros: TAction;
    AParametros1: TMenuItem;
    dxAparametros: TdxNavBarItem;
    IBQCumple: TIBQuery;
    AFechasPago: TAction;
    dxFechaPago: TdxNavBarItem;
    FechasdePagoAparatos1: TMenuItem;
    IBTable: TIBTable;
    IBQAparatos: TIBQuery;
    IBQClientes: TIBQuery;
    IBQUltimoPago: TIBQuery;
    APilates: TAction;
    AListadoPilates: TAction;
    dxListadoPilates: TdxNavBarItem;
    ListadodePilates1: TMenuItem;
    AEliminarPilates: TAction;
    dxEliminarPilates: TdxNavBarItem;
    EliminarRegistrodePilates1: TMenuItem;
    Button1: TButton;
    AEstadisticas: TAction;
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
  private
    procedure ArreglarTabla();
    procedure AbrirFormulario(Formulario : TFUniversal);
    function Verificar() : Boolean;
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
  UEliminarPilates, UEstadisticas;
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

procedure TFPrincipal.FormCreate(Sender: TObject);
var
  F : TFLogin;
begin
  inherited;
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
    begin
      F.Destroy;
      SBprincipal.Panels[0].Text := 'Usuario: '+Usuario;
      SBPrincipal.Panels[1].Text := 'Profesor: '+Profesor;
    end;
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
    Configuracion1.Enabled := false;
    PlanilladeHoras1.Enabled := false;
    ResumenMensual1.Enabled := false;
    dxNavBar1Group3.Visible := false;
    dxPHorasAerobicos.Visible := false;
    dxPHorasAparatos.Visible := false;
    dxResumenMensual.Visible := false;
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

end.
