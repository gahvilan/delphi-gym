unit UABMProfesores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UABMGeneral, DB, IBCustomDataSet, dxMasterView, StdCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, Grids, DBGrids,
  Buttons, ExtCtrls, UDatosDB, jpeg, IBQuery, UPrincipal,
  cxLookAndFeelPainters, cxButtons;

type
  TFABMProfesores = class(TFABMGeneral)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxNombre: TcxTextEdit;
    cxApellido: TcxTextEdit;
    cxEdad: TcxTextEdit;
    cxDNI: TcxTextEdit;
    cxSueldo: TcxTextEdit;
    RGTipoSueldo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure BInsertarClick(Sender: TObject);
    procedure EliminarClick(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
  private
    procedure CargarParametrosInsertar(); override;
    procedure CargarParametrosModificacion(); override;
  public
    { Public declarations }
  end;

var
  FABMProfesores: TFABMProfesores;

implementation

{$R *.dfm}

procedure TFABMProfesores.FormCreate(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTPersonal.Active := true;
end;

procedure TFABMProfesores.BInsertarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Clear;
  cxApellido.Clear;
  cxEdad.Clear;
  cxDNI.Clear;
  cxSueldo.Clear;
end;

procedure TFABMProfesores.EliminarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTPersonal.Delete;
end;

procedure TFABMProfesores.BModificarClick(Sender: TObject);
begin
  inherited;
  cxNombre.Text := DMGimnasio.IBTPersonal.FieldValues['nombre'];
  cxApellido.Text := DMGimnasio.IBTPersonal.FieldValues['apellido'];
  cxEdad.Text := DMGimnasio.IBTPersonal.FieldValues['edad'];
  cxDNI.Text := DMGimnasio.IBTPersonal.FieldValues['dni'];
  cxSueldo.Text := DMGimnasio.IBTPersonal.FieldValues['sueldo'];
  if (DMGimnasio.IBTPersonal.FieldValues['tipo_sueldo'] = 'C') then
    RGTipoSueldo.ItemIndex := 0
  else
    RGTipoSueldo.ItemIndex := 1;
end;

procedure TFABMProfesores.CargarParametrosInsertar();
begin
  IBQInsert.ParamByName('nombre').AsString := Trim(cxNombre.EditValue);
  IBQInsert.ParamByName('apellido').AsString := Trim(cxApellido.EditValue);
  IBQInsert.ParamByName('edad').AsInteger := cxEdad.EditValue;
  IBQInsert.ParamByName('dni').AsInteger := cxDNI.EditValue;
  IBQInsert.ParamByName('sueldo').AsFloat := cxSueldo.EditValue;
  IBQInsert.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  if (RGTipoSueldo.ItemIndex = 0) then
    IBQInsert.ParamByName('TS').AsString := 'C'
  else
    IBQInsert.ParamByName('TS').AsString := 'P';
end;

procedure TFABMProfesores.CargarParametrosModificacion();
begin
  IBQModificar.ParamByName('nombre').AsString := Trim(cxNombre.EditValue);
  IBQModificar.ParamByName('apellido').AsString := Trim(cxApellido.EditValue);
  IBQModificar.ParamByName('edad').AsInteger := cxEdad.EditValue;
  IBQModificar.ParamByName('dni').AsInteger := cxDNI.EditValue;
  IBQModificar.ParamByName('sueldo').AsFloat := cxSueldo.EditValue;
  if (RGTipoSueldo.ItemIndex = 0) then
    IBQModificar.ParamByName('TS').AsString := 'C'
  else
    IBQModificar.ParamByName('TS').AsString := 'P';
  IBQModificar.ParamByName('id').AsInteger := DMGimnasio.IBTPersonal.FieldValues['id_personal'];
  IBQModificar.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
end;

procedure TFABMProfesores.BGuardarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTPersonal.Active := false;
  DMGimnasio.IBTPersonal.Active := true;
end;

procedure TFABMProfesores.BEliminarClick(Sender: TObject);
begin
  inherited;
  try
    DMGimnasio.IBTPersonal.Delete;
    DMGimnasio.IBTGimnasio.CommitRetaining;
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
    MessageDlg('El Profesor tiene datos relacionados y no se puede borrar',mtError,[mbOk],0);
  end;
end;

end.
