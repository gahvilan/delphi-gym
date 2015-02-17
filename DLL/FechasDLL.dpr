library FechasDLL;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Controls,
  DateUtils,
  Dialogs,
  Classes;

{$R *.res}

procedure CambiarFormatoFecha(Fecha : String; var FechaR : TDate);stdcall;
var
  A : TDate;
  Dia, Mes, Anio : Word;
begin
  Dia := StrToInt(Fecha[3]+Fecha[4]);
  Mes := StrToInt(Fecha[6]+Fecha[7]);
  Anio := StrToInt(Fecha[9]+Fecha[10]+Fecha[11]+Fecha[12]);
  FechaR := EncodeDate(Anio,Mes,Dia);
  //showmessage(DateToStr(Result));
end;

function CambiarFormatoHora(Hora : String) : TTime;
begin
end;

function ObtenerHora(Hora : String) : Integer;stdcall;
begin
  Result := StrToInt(Hora[3]+Hora[4]);
end;

function ObtenerMinutos(Hora : String) : Integer;stdcall;
begin
  Result := StrToInt(Hora[6]+Hora[7]);
end;

function ObtenerDia (Fecha : String) : Integer;stdcall;
begin
  Result := StrToInt(Fecha[3]+Fecha[4]);
end;

function ObtenerMes (Fecha : String) : Integer;stdcall;
begin
  Result := StrToInt(Fecha[6]+Fecha[7]);
end;

function ObtenerAnio (Fecha : String) : Integer;stdcall;
begin
  Result := StrToInt(Fecha[9]+Fecha[10]+Fecha[11]+Fecha[12]);
end;

function ObtenerDiaStr (Dia, Mes, Anio : Integer) : Integer;stdcall;
begin
  Result := DayOfTheWeek(EncodeDate(Anio,Mes,Dia));
end;

exports
  CambiarFormatoFecha,
  ObtenerDia,
  ObtenerMes,
  ObtenerAnio,
  ObtenerDiaStr,
  ObtenerHora,
  ObtenerMinutos,
  CambiarFormatoHora;

begin
end.
