unit UABMClases;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UABMGeneral, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Buttons, jpeg, ExtCtrls, UDatosDB, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, UPrincipal, cxLookAndFeelPainters,
  cxButtons, cxCheckBox, pngimage;

type
  TFABMClases = class(TFABMGeneral)
    cxNombre: TcxTextEdit;
    cxPrecio: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLCantReservas: TcxLabel;
    cxCantReservas: TcxTextEdit;
    CBConReserva: TcxCheckBox;
    CBAparatos: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure BInsertarClick(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure CBConReservaClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
  private
    procedure CargarParametrosInsertar(); override;
    procedure CargarParametrosModificacion(); override;
  public
    { Public declarations }
  end;

var
  FABMClases: TFABMClases;

implementation

{$R *.dfm}

procedure TFABMClases.FormCreate(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTClases.Active := true;
end;

procedure TFABMClases.BInsertarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Clear;
  cxPrecio.Clear;
  cxCantReservas.Clear;
end;

procedure TFABMClases.CargarParametrosInsertar();
begin
  IBQInsert.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQInsert.ParamByName('precio').AsFloat := StrToFloat(cxPrecio.Text);
  IBQInsert.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  if (CBConReserva.Checked) then
  begin
    IBQInsert.ParamByName('res').AsString := 'S';
    IBQinsert.ParamByName('cant').AsInteger := StrToInt(cxCantReservas.Text);
  end
  else
    IBQInsert.ParamByName('res').AsString := 'N';
  if (CBAparatos.Checked) then
    IBQInsert.ParamByName('conAparatos').AsString := 'S'
  else
    IBQInsert.ParamByName('conAparatos').AsString := 'N';
end;

procedure TFABMClases.CargarParametrosModificacion();
begin
  IBQModificar.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQModificar.ParamByName('precio').AsFloat := StrToFloat(cxPrecio.Text);
  IBQModificar.ParamByName('id').AsInteger := DMGimnasio.IBTClases.FieldValues['id_disiplina'];
  IBQModificar.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  if (CBConReserva.Checked) then
  begin
    IBQModificar.ParamByName('res').AsString := 'S';
    IBQModificar.ParamByName('cant').AsInteger := StrToInt(cxCantReservas.Text);
  end
  else
    IBQModificar.ParamByName('res').AsString := 'N';
  if (CBAparatos.Checked) then
    IBQModificar.ParamByName('conAparatos').AsString := 'S'
  else
    IBQModificar.ParamByName('conAparatos').AsString := 'N';
end;

procedure TFABMClases.BModificarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Text := DMGimnasio.IBTClases.FieldValues['nombre'];
  cxPrecio.Text := DMGimnasio.IBTClases.FieldValues['precio_clase'];
  if (DMGimnasio.IBTClases.FieldValues['reserva'] = 'S') then
  begin
    CBConReserva.Checked := true;
    CBConReservaClick(Sender);
    cxCantReservas.Text := IntToStr(DMGimnasio.IBTClases.FieldValues['cantreservas']);
  end
  else
  begin
    CBConReserva.Checked := false;
    CBConReservaClick(Sender);
  end;
  if (DMGimnasio.IBTClases.FieldValues['conaparatos'] = 'S') then
    CBAparatos.Checked := true
  else
    CBAparatos.Checked := false;
end;

procedure TFABMClases.BGuardarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTClases.Active := false;
  DMGimnasio.IBTClases.Active := true;
end;

procedure TFABMClases.CBConReservaClick(Sender: TObject);
begin
  inherited;
  if (CBConReserva.Checked) then
  begin
    cxCantReservas.Enabled := true;
    cxLCantReservas.Enabled := true;
  end
  else
  begin
    cxCantReservas.Clear;
    cxCantReservas.Enabled := false;
    cxLCantReservas.Enabled := false;
  end;
end;

procedure TFABMClases.BEliminarClick(Sender: TObject);
begin
  inherited;
  try
    DMGimnasio.IBTClases.Delete;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

end.
