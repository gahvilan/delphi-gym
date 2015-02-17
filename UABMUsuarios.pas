unit UABMUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDatosDB, UABMGeneral, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxDBExtLookupComboBox, UPrincipal,
  DBCtrls, cxLookAndFeelPainters, cxButtons, pngimage;

type
  TFABMUsuarios = class(TFABMGeneral)
    Label1: TLabel;
    Label2: TLabel;
    LPassNuevo: TLabel;
    LConfPassNuevo: TLabel;
    cxNombre: TcxTextEdit;
    cxPassNuevo: TcxTextEdit;
    cxConfPassNuevo: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    LPassViejo: TLabel;
    LNuevoPassViejo: TLabel;
    LConfPassVieja: TLabel;
    cxConfirmPassViejo: TcxTextEdit;
    DBLCBRoles: TDBLookupComboBox;
    DBLCBPersonal: TDBLookupComboBox;
    IBQEliminar: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure BInsertarClick(Sender: TObject);
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
  FABMUsuarios: TFABMUsuarios;

implementation

{$R *.dfm}

procedure TFABMUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTRoles.Active := true;
  DMGimnasio.IBTPersonal.Active := true;
  DMGimnasio.IBQUsuariosSistema.Close;
  DMGimnasio.IBQUsuariosSistema.Open;
end;

procedure TFABMUsuarios.BInsertarClick(Sender: TObject);
begin
  inherited;
  LPassViejo.Visible := false;
  LNuevoPassViejo.Visible := false;
  LConfPassVieja.Visible := false;
  cxConfirmPassViejo.Visible := false;
  LPassNuevo.Visible := true;
  LConfPassNuevo.Visible := true;
  cxConfPassNuevo.Clear;
  cxNombre.Clear;
  cxPassNuevo.Clear;
end;

procedure TFABMUsuarios.BModificarClick(Sender: TObject);
begin
  inherited;
  LPassViejo.Visible := true;
  LNuevoPassViejo.Visible := true;
  LConfPassVieja.Visible := true;
  cxConfirmPassViejo.Visible := true;
  LPassNuevo.Visible := false;
  LConfPassNuevo.Visible := false;
  cxNombre.Text := DBGDatosGenerales.DataSource.DataSet.FieldValues['nombre'];
  cxPassNuevo.Text :='';//DBGDatosGenerales.DataSource.DataSet.FieldValues['pass'];
  DBLCBRoles.KeyValue := DBGDatosGenerales.DataSource.DataSet.FieldValues['id_rol'];
  DBLCBPersonal.KeyValue := DBGDatosGenerales.DataSource.DataSet.FieldValues['id_personal'];
  cxConfPassNuevo.Clear;
  cxConfirmPassViejo.Clear;
end;

procedure TFABMUsuarios.CargarParametrosInsertar();
begin
  IBQInsert.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQInsert.ParamByName('pass').AsString := cxPassNuevo.Text;
  IBQInsert.ParamByName('rol').Value := DBLCBRoles.KeyValue;
  IBQInsert.ParamByName('personal').Value := DBLCBPersonal.KeyValue;
  IBQInsert.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
end;

procedure TFABMUsuarios.CargarParametrosModificacion();
begin
  IBQModificar.ParamByName('nombre').AsString := Trim(cxNombre.Text);
  IBQModificar.ParamByName('pass').AsString := cxConfPassNuevo.Text;
  IBQModificar.ParamByName('rol').Value := DBLCBRoles.KeyValue;
  IBQModificar.ParamByName('personal').Value := DBLCBPersonal.KeyValue;
  IBQModificar.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  IBQModificar.ParamByName('id').AsInteger := DBGDatosGenerales.DataSource.DataSet.FieldValues['id_usuario'];
end;

procedure TFABMUsuarios.BGuardarClick(Sender: TObject);
begin
    if (modo = mEditar) then
    begin
      if (cxPassNuevo.Text = DBGDatosGenerales.DataSource.DataSet.FieldValues['pass']) then
        if (cxPassNuevo.Text <> cxConfirmPassViejo.Text) then
        begin
          if (cxConfPassNuevo.Text = cxConfirmPassViejo.Text) then
            inherited
          else
            MessageDlg('La Contraseña Nueva no es Igual a la Confirmación de la misma',mtError,[mbOk],0);
        end
        else
          MessageDlg('La Contraseña Nueva debe ser Distinta a la Contraseña Vieja',mtError,[mbOk],0)
      else
        MessageDlg('La Contraseña Vieja no es Valida',mtError,[mbOk],0)
    end;
    if (modo = mInsertar) then
    begin
      if (cxPassNuevo.Text = cxConfPassNuevo.Text) then
        inherited
      else
        MessageDlg('La Contraseña no es Igual a la Confirmación de la misma',mtError,[mbOk],0);
    end;
  DMGimnasio.IBQUsuariosSistema.Close;
  DMGimnasio.IBQUsuariosSistema.Open;
end;

procedure TFABMUsuarios.BEliminarClick(Sender: TObject);
begin
  inherited;
  IBQEliminar.Close;
  IBQEliminar.ParamByName('id').AsInteger := DBGDatosGenerales.DataSource.DataSet.FieldValues['id_usuario'];
  IBQEliminar.Open;
  DMGimnasio.IBTGimnasio.CommitRetaining;

  DMGimnasio.IBQUsuariosSistema.Close;
  DMGimnasio.IBQUsuariosSistema.Open;
end;

end.
