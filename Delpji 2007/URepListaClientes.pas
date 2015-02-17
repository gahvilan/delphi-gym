unit URepListaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URepGenerico, QRCtrls, QuickRpt, ExtCtrls, DB, IBCustomDataSet,
  IBQuery, UPrincipal, UDatosDB, QRExport, QRPDFFilt;

type
  TFRepListaClientes = class(TFRepGenerico)
    QRExpr3: TQRExpr;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    IBQListadoClientes: TIBQuery;
    DSListadoClientes: TDataSource;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRExpr1: TQRExpr;
    QRPDFFilter1: TQRPDFFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    Edad1, Edad2 : Integer;
    Nombre, Apellido : String;
  end;

var
  FRepListaClientes: TFRepListaClientes;

implementation

{$R *.dfm}

procedure TFRepListaClientes.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  IBQListadoClientes.Close;
  IBQListadoClientes.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  IBQListadoClientes.ParamByName('edad1').AsInteger := Edad1;
  IBQListadoClientes.ParamByName('edad2').AsInteger := Edad2;
  IBQListadoClientes.ParamByName('nombre').AsString := Nombre;
  IBQListadoClientes.ParamByName('apellido').AsString := Apellido;
  IBQListadoClientes.Open;
end;

end.
