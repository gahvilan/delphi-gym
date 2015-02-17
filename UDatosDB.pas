Unit UDatosDB;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBQuery, IBTable;

type
  TDMGimnasio = class(TDataModule)
    IBDGimnasio: TIBDatabase;
    IBTGimnasio: TIBTransaction;
    IBQActividades: TIBQuery;
    DSActividades: TDataSource;
    IBTPersonal: TIBTable;
    DSPersonal: TDataSource;
    IBTClases: TIBTable;
    DSClases: TDataSource;
    IBTUsuarios: TIBTable;
    DSUsuarios: TDataSource;
    IBTArticulos: TIBTable;
    DSArticulos: TDataSource;
    IBTRoles: TIBTable;
    DSRoles: TDataSource;
    IBTRolesID_ROL: TIntegerField;
    IBTRolesNOMBRE: TIBStringField;
    IBTPersonalID_PERSONAL: TIntegerField;
    IBTPersonalNOMBRE: TIBStringField;
    IBTPersonalAPELLIDO: TIBStringField;
    IBTPersonalEDAD: TIntegerField;
    IBTPersonalDNI: TIntegerField;
    IBTPersonalSUELDO: TIBBCDField;
    IBTPersonalID_USUARIO: TIntegerField;
    IBTPersonalESTABLECIMIENTO: TIntegerField;
    IBQRolesQ: TIBQuery;
    IBTDisiplinas: TIBTable;
    DSDisiplinas: TDataSource;
    IBQActividadesReserva: TIBQuery;
    DSActividadesReserva: TDataSource;
    IBQUsuariosSistema: TIBQuery;
    IBQUsuariosSistemaNOMBRE: TIBStringField;
    IBQUsuariosSistemaROL: TIBStringField;
    IBQUsuariosSistemaPROFE: TIBStringField;
    DSUsuariosSistema: TDataSource;
    IBQUsuariosSistemaPASS: TIBStringField;
    IBQUsuariosSistemaID_USUARIO: TIntegerField;
    IBQUsuariosSistemaID_ROL: TIntegerField;
    IBQUsuariosSistemaID_PERSONAL: TIntegerField;
    IBTPersonalTIPO_SUELDO: TIBStringField;
    procedure IBTPersonalAfterOpen(DataSet: TDataSet);
    procedure IBQActividadesAfterOpen(DataSet: TDataSet);
    procedure IBQActividadesReservaAfterOpen(DataSet: TDataSet);
    procedure IBTRolesAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGimnasio: TDMGimnasio;

implementation

{$R *.dfm}

procedure TDMGimnasio.IBTPersonalAfterOpen(DataSet: TDataSet);
begin
  IBTPersonal.Last;
  IBTPersonal.First;
end;

procedure TDMGimnasio.IBQActividadesAfterOpen(DataSet: TDataSet);
begin
  IBQActividades.Last;
  IBQActividades.First;
end;

procedure TDMGimnasio.IBQActividadesReservaAfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;
  DataSet.First
end;

procedure TDMGimnasio.IBTRolesAfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;
  DataSet.First;
end;

end.
