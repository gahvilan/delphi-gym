unit UABMArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDatosDB, UABMGeneral, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons,
  cxLabel;

type
  TFABMArticulos = class(TFABMGeneral)
    cxNombre: TcxTextEdit;
    cxPrecio: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TECantidad: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BInsertarClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
  private
    procedure CargarParametrosInsertar(); override;
    procedure CargarParametrosModificacion(); override;
  public
    { Public declarations }
  end;

var
  FABMArticulos: TFABMArticulos;

implementation

{$R *.dfm}

procedure TFABMArticulos.FormCreate(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTArticulos.Active := true;
end;

procedure TFABMArticulos.CargarParametrosInsertar();
begin
  IBQInsert.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQInsert.ParamByName('precio').AsFloat := cxPrecio.Value;
  if (TECantidad.Text = '') then
    IBQInsert.ParamByName('cantidad').AsInteger := 0
  else
    IBQInsert.ParamByName('cantidad').AsInteger := StrToInt(TECantidad.Text);
end;

procedure TFABMArticulos.CargarParametrosModificacion();
begin
  IBQModificar.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQModificar.ParamByName('precio').AsFloat:= cxPrecio.Value;
  if (TECantidad.Text = '') then
    IBQmodificar.ParamByName('cantidad').AsInteger := 0
  else
    IBQmodificar.ParamByName('cantidad').AsInteger := StrToInt(TECantidad.Text);
  IBQModificar.ParamByName('id').AsInteger := DMGimnasio.IBTArticulos.FieldValues['id_articulo'];
end;

procedure TFABMArticulos.BModificarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Text := DMGimnasio.IBTArticulos.FieldValues['nombre'];
  cxPrecio.Value := DMGimnasio.IBTArticulos.FieldValues['precio'];
  TECantidad.Text := DMGimnasio.IBTArticulos.FieldValues['cantidad'];
end;

procedure TFABMArticulos.BGuardarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTArticulos.Active := false;
  DMGimnasio.IBTArticulos.Active := true;
end;

procedure TFABMArticulos.BInsertarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Clear;
  cxPrecio.Clear;
end;

procedure TFABMArticulos.BEliminarClick(Sender: TObject);
begin
  inherited;
  try
    DMGimnasio.IBTArticulos.Delete;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
    MessageDlg('El Articulo tiene datos relacionados y no se puede borrar',mtError,[mbOk],0);
  end;
end;

end.
