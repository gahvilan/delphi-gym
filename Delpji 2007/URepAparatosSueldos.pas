unit URepAparatosSueldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, UDatosDB, DB,
  IBCustomDataSet, IBQuery, QRExport, QRPDFFilt;

type
  TFRepAparatosSueldos = class(TFRepGenerico)
    QRLabel3: TQRLabel;
    IBQGetPorcentajes: TIBQuery;
    IBQGetPorcentajesNOMBRE: TIBStringField;
    IBQGetPorcentajesPORCENTAJE: TIBBCDField;
    QuickRep2: TQuickRep;
    IBQGetAparatos: TIBQuery;
    IBQGetAparatosNOMBRE: TIBStringField;
    IBQGetAparatosDISIPLINA: TIBStringField;
    IBQGetAparatosTOTAL: TIBBCDField;
    QRCRComp1: TQRCompositeReport;
    QRBand4: TQRBand;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRBand5: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLAcumulado: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRCRComp1AddReports(Sender: TObject);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRLAcumuladoPrint(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
  private
    acumulado : integer;
  public
    mes, anio : integer;
  end;

var
  FRepAparatosSueldos: TFRepAparatosSueldos;

implementation

{$R *.dfm}

procedure TFRepAparatosSueldos.QuickRep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  acumulado := 0;
  IBQGetAparatos.Close;
  IBQGetAparatos.ParamByName('mes').AsInteger := mes;
  IBQGetAparatos.ParamByName('anio').AsInteger := anio;
  IBQGetAparatos.Open;
end;

procedure TFRepAparatosSueldos.QuickRep2BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  IBQGetPorcentajes.Close;
  IBQGetPorcentajes.ParamByName('mes').AsInteger := mes;
  IBQGetPorcentajes.ParamByName('anio').AsInteger := anio;
  IBQGetPorcentajes.Open;
end;

procedure TFRepAparatosSueldos.QRCRComp1AddReports(Sender: TObject);
begin
  inherited;
  QRCRComp1.Reports.Clear;
  QRCRComp1.Reports.Add(QuickRep1);
  QRCRComp1.Reports.Add(QuickRep2);
end;

procedure TFRepAparatosSueldos.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := Value+' %';
end;

procedure TFRepAparatosSueldos.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  inherited;
  acumulado := acumulado+StrToInt(Value);
  Value := '$ '+Value;
end;

procedure TFRepAparatosSueldos.QRExpr1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+Value;
end;

procedure TFRepAparatosSueldos.QRLAcumuladoPrint(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+IntToStr(acumulado);
end;

procedure TFRepAparatosSueldos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := FloatToStr((acumulado*0.4)*(StrToFloat(Value)/100));
end;

end.
