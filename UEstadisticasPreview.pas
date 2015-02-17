unit UEstadisticasPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, QuickRpt, StdCtrls, jpeg, ExtCtrls, QRCtrls,
  QRExport, QRPDFFilt, pngimage;

type
  TFEstadisticasPreview = class(TFUniversal)
    QREstadisticas: TQuickRep;
    QRBand1: TQRBand;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRBCuadro: TQRBand;
    QRLHora: TQRLabel;
    QRLLunes: TQRLabel;
    QRLMartes: TQRLabel;
    QRLMiercoles: TQRLabel;
    QRLJueves: TQRLabel;
    QRLViernes: TQRLabel;
    QRLSabado: TQRLabel;
    QRLabel4: TQRLabel;
    QRLMes: TQRLabel;
    QRLabel5: TQRLabel;
    QRLAnio: TQRLabel;
    QRLTotal: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLabel6: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLPromAsistF1: TQRLabel;
    QRLPromAsistF2: TQRLabel;
    QRLPromAsistF3: TQRLabel;
    QRLAjusteF3: TQRLabel;
    QRLAjusteF2: TQRLabel;
    QRLAjusteF1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadisticasPreview: TFEstadisticasPreview;

implementation

{$R *.dfm}

end.
