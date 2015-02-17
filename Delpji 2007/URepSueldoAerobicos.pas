unit URepSueldoAerobicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, UPrincipal, DB,
  IBCustomDataSet, IBQuery, UDatosDB, QRExport, QRPDFFilt;

type
  TFRepSueldoAerobicos = class(TFRepGenerico)
    IBQSueldos: TIBQuery;
    IBQSueldosPROFESOR: TIBStringField;
    IBQSueldosDISIPLINA: TIBStringField;
    IBQSueldosCANT_CLASES: TIntegerField;
    IBQSueldosSUELDO_MENSUAL: TIBBCDField;
    QRLabel9: TQRLabel;
    QuickRep2: TQuickRep;
    IBQResumen: TIBQuery;
    QRCRSueldos: TQRCompositeReport;
    IBQResumenPROFE: TIBStringField;
    IBQResumenSUELDO: TIBBCDField;
    IBQResumenTOTAL_HORAS: TLargeintField;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLMes: TQRLabel;
    QRLabel4: TQRLabel;
    QRLAnio: TQRLabel;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand6: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand5: TQRBand;
    QRLabel10: TQRLabel;
    QRBand7: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRCRSueldosAddReports(Sender: TObject);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepSueldoAerobicos: TFRepSueldoAerobicos;

implementation

{$R *.dfm}

procedure TFRepSueldoAerobicos.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  IBQResumen.Close;
  IBQResumen.ParamByName('mes').AsInteger := StrToInt(QRLMes.Caption);
  IBQResumen.ParamByName('anio').AsInteger := StrToInt(QRLAnio.Caption);
  IBQResumen.Open;
end;

procedure TFRepSueldoAerobicos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+Value;
end;

procedure TFRepSueldoAerobicos.QuickRep2BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  IBQSueldos.Close;
  IBQSueldos.ParamByName('mes').AsInteger := StrToInt(QRLMes.Caption);
  IBQSueldos.ParamByName('anio').AsInteger := StrToInt(QRLAnio.Caption);
  IBQSueldos.Open;
end;

procedure TFRepSueldoAerobicos.QRCRSueldosAddReports(Sender: TObject);
begin
  inherited;
  QRCRSueldos.Reports.Clear;
  QRCRSueldos.Reports.Add(QuickRep1);
  QRCRSueldos.Reports.Add(QuickRep2);
end;

procedure TFRepSueldoAerobicos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+Value;
end;

end.
