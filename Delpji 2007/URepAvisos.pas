unit URepAvisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, UDatosDB, DB,
  IBCustomDataSet, IBQuery, DateUtils;

type
  TFRepAvisos = class(TFRepGenerico)
    QRLabel3: TQRLabel;
    IBQCumple: TIBQuery;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRLFecha: TQRLabel;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    Fecha : TDate;
    Mes, Tipo : Integer;
  end;

var
  FRepAvisos: TFRepAvisos;

implementation

{$R *.dfm}

procedure TFRepAvisos.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  mesf, dia, anio : Word;
begin
  inherited;
  IBQCumple.Close;
  case Tipo of
    0 : begin
          DecodeDate(Fecha,anio,mesf,dia);
          IBQCumple.ParamByName('dia').AsInteger := dia;
          IBQCumple.ParamByName('mes').AsInteger := mesf;
        end;
    1 : begin
          IBQCumple.ParamByName('dia').Value := null;
          IBQCumple.ParamByName('mes').AsInteger := Mes;
        end;
  end;
  IBQCumple.Open;
end;

end.
