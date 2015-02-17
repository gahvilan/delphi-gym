unit URepListadoPilatesPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, UDatosDB;

type
  TFRepListadoPilates = class(TFRepGenerico)
    QRLabel3: TQRLabel;
    IBQClientes: TIBQuery;
    IBQClientesNOMBRE: TIBStringField;
    IBQClientesAPELLIDO: TIBStringField;
    IBQClientesPRECIO: TFloatField;
    IBQClientesTIPO: TIBStringField;
    QRBand2: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText3Print(sender: TObject; var Value: String);
  private

  public
    fecha : TDate;
  end;

var
  FRepListadoPilates: TFRepListadoPilates;

implementation

{$R *.dfm}

procedure TFRepListadoPilates.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  IBQClientes.Close;
  IBQClientes.ParamByName('FECHA').AsDate := fecha;
  IBQClientes.Open;
end;

procedure TFRepListadoPilates.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  inherited;
  Value := '$ '+Value;
end;

end.
