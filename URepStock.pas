unit URepStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, UDatosDB, QRExport,
  QRPDFFilt;

type
  TFRepStock = class(TFRepGenerico)
    QRLabel15: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepStock: TFRepStock;

implementation

{$R *.dfm}

procedure TFRepStock.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  DMGimnasio.IBTArticulos.Close;
  DMGimnasio.IBTArticulos.Open;
end;

end.
