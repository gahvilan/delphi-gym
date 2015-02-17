unit UArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, UDatosDB,
  cxLookAndFeelPainters, cxLabel, cxControls, cxContainer, cxEdit, UPrincipal,
  cxTextEdit, cxButtons, DB, IBCustomDataSet, IBQuery;

type
  TFArticulos = class(TFUniversal)
    PDetalle: TPanel;
    DBGArticulos: TDBGrid;
    BAceptar: TcxButton;
    TECantidad: TcxTextEdit;
    cxLabel1: TcxLabel;
    IBQinsertStock: TIBQuery;
    IBQUpdateStock: TIBQuery;
    procedure BAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArticulos: TFArticulos;

implementation

{$R *.dfm}

procedure TFArticulos.BAceptarClick(Sender: TObject);
var
  Cantidad, id : Integer;
begin
  inherited;
  id := DMGimnasio.IBTArticulos.FieldValues['id_articulo'];
  cantidad := DMGimnasio.IBTArticulos.FieldValues['cantidad'];
  IBQInsertStock.Close;
  IBQInsertStock.ParamByName('id_articulo').AsInteger := DMGimnasio.IBTArticulos.FieldValues['id_articulo'];
  IBQInsertStock.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  IBQInsertStock.ParamByName('cantidad').AsInteger := StrToInt(TECantidad.Text);
  IBQInsertStock.ParamByName('fecha').AsString := DateToStr(Date());
  IBQInsertStock.Open;
  DMGimnasio.IBTGimnasio.CommitRetaining;

  DMGimnasio.IBTArticulos.Active := false;

  IBQUpdateStock.Close;
  IBQUpdateStock.ParamByName('id').AsInteger := id;
  IBQUpdateStock.ParamByName('cant').AsInteger := Cantidad-StrToInt(TECantidad.Text);
  IBQUpdateStock.Open;
  DMGimnasio.IBTGimnasio.CommitRetaining;

  DMGimnasio.IBTArticulos.Active := true;;
end;

procedure TFArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTArticulos.Active := true;
end;

end.
