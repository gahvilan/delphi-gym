unit UClientesNuevos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ExtCtrls, StdCtrls, UDatosDB, DBCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, Buttons, jpeg, cxLookAndFeelPainters, DB, UDis,
  IBCustomDataSet, IBQuery, cxButtons, ComCtrls, UPrincipal;

type
  TFClientesNuevos = class(TFUniversal)
    GBDatosPersonales: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    ENombre: TEdit;
    EApellido: TEdit;
    Label3: TLabel;
    EEdad: TEdit;
    Label4: TLabel;
    EDireccion: TEdit;
    ETelefono: TEdit;
    Label5: TLabel;
    GBFamiliarConocido: TGroupBox;
    ENombreRelacion: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    EApellidoRelacion: TEdit;
    Label8: TLabel;
    ETelefonoRelacion: TEdit;
    Label9: TLabel;
    ERelacion: TEdit;
    GBSalud: TGroupBox;
    CBDiabetes: TCheckBox;
    CBAfeccionCorazon: TCheckBox;
    CBEpilepsia: TCheckBox;
    CBAsma: TCheckBox;
    CBIpertension: TCheckBox;
    CBColumna: TCheckBox;
    CBLuxaciones: TCheckBox;
    CBCuidadoMedico: TCheckBox;
    CBMedicamento: TCheckBox;
    CBOtros: TCheckBox;
    EArticulacion: TEdit;
    LArticulaciones: TLabel;
    LMedicamentos: TLabel;
    EMedicamento: TEdit;
    LOtra: TLabel;
    EOtra: TEdit;
    ERegimen: TEdit;
    Label10: TLabel;
    Panel1: TPanel;
    Image2: TImage;
    BAceptar: TcxButton;
    BCancelar: TcxButton;
    IBQInsertCliente: TIBQuery;
    IBQInsertEnfermedad: TIBQuery;
    IBQInsertDisiplinas: TIBQuery;
    Label12: TLabel;
    DTPFechaNacimiento: TDateTimePicker;
    IBQGetCliente: TIBQuery;
    BActividades: TcxButton;
    ECaracteristica: TEdit;
    ECarFamiliar: TEdit;
    procedure CBLuxacionesClick(Sender: TObject);
    procedure CBMedicamentoClick(Sender: TObject);
    procedure CBOtrosClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure BActividadesClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
  private

  public
    { Public declarations }
  protected
    Actividades : TArrActividades;
  end;

var
  FClientesNuevos: TFClientesNuevos;

implementation

{$R *.dfm}

procedure TFClientesNuevos.CBLuxacionesClick(Sender: TObject);
begin
  inherited;
  if (CBLuxaciones.Checked) then
  begin
    LArticulaciones.Enabled := true;
    EArticulacion.Enabled := true;
  end
  else
  begin
    LArticulaciones.Enabled := false;
    EArticulacion.Enabled := false;
  end;
end;

procedure TFClientesNuevos.CBMedicamentoClick(Sender: TObject);
begin
  inherited;
  if (CBMedicamento.Checked) then
  begin
    LMedicamentos.Enabled := true;
    EMedicamento.Enabled := true;
  end
  else
  begin
    LMedicamentos.Enabled := false;
    EMedicamento.Enabled := false;
  end;
end;

procedure TFClientesNuevos.CBOtrosClick(Sender: TObject);
begin
  inherited;
  if (CBOtros.Checked) then
  begin
    LOtra.Enabled := true;
    EOtra.Enabled := true;
  end
  else
  begin
    LOtra.Enabled := false;
    EOtra.Enabled := false;
  end;
end;

procedure TFClientesNuevos.BAceptarClick(Sender: TObject);
var
  id, disiplina : integer;
begin
  inherited;
  try
     with IBQInsertCliente do
     begin
        Close;
        ParamByName('nombre').Value := Trim(ENombre.Text);
        ParamByName('apellido').Value := Trim(EAPellido.Text);
        ParamByName('dir').Value := EDireccion.Text;
        if (ECaracteristica.Text = '') then
          ParamByName('caracteristica').Value := null
        else
          ParamByName('caracteristica').Value := StrToInt(ECaracteristica.Text);
        if (ETelefono.Text = '') then
          ParamByName('tel').Value := null
        else
          ParamByName('tel').Value := StrToInt(ETelefono.Text);
        if (EEdad.Text = '') then
          ParamByName('edad').Value := 0
        else
          ParamByName('edad').Value := StrToInt(EEdad.Text);
        ParamByName('fecha_nac').Value := DateToStr(DTPFechaNacimiento.Date);
        ParamByName('nomyap_familiar').Value := ENombreRelacion.Text+' '+EApellidoRelacion.Text;
        ParamByName('relac_familiar').Value := ERelacion.Text;
        if (ECarFamiliar.Text = '') then
          ParamByName('caracteristica_familiar').Value := null
        else
          ParamByName('caracteristica_familiar').Value := StrToInt(ECarFamiliar.Text);
        if (ETelefonoRelacion.Text = '') then
          ParamByName('tel_familiar').Value := null
        else
          ParamByName('tel_familiar').Value := StrToInt(ETelefonoRelacion.Text);
        ParamByName('regimen').Value := ERegimen.Text;
        ParamByName('esta').Value := FPrincipal.Establecimiento;
        Open;
        DMGimnasio.IBTGimnasio.CommitRetaining;

        IBQGetCliente.Close;
        IBQGetCliente.ParamByName('n').AsString := ENombre.Text;
        IBQGetCliente.ParamByName('a').AsString := EAPellido.Text;
        IBQGetCliente.ParamByName('f').AsString := DateToStr(DTPFechaNacimiento.Date);
        IBQGetCliente.Open;
        id := IBQGetCliente.fieldByName('id_cliente').AsInteger;
     end;
     //Enfermedades
        if (CBDiabetes.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBDiabetes.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBAfeccionCorazon.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBAfeccionCorazon.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBIpertension.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBIpertension.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBColumna.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBColumna.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBAsma.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBAsma.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBEpilepsia.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBEpilepsia.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBLuxaciones.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBLuxaciones.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := EArticulacion.Text;
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBCuidadoMedico.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBCuidadoMedico.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := ' ';
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBMedicamento.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBMedicamento.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := EMedicamento.Text;
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        if (CBOtros.Checked) then
        begin
          IBQInsertEnfermedad.Close;
          IBQInsertEnfermedad.ParamByName('id_enfermedad').Value := CBOtros.Tag;
          IBQInsertEnfermedad.ParamByName('id_cliente').Value := id;
          IBQInsertEnfermedad.ParamByName('descripcion').AsString := EOtra.Text;
          IBQInsertEnfermedad.Open;
          DMGimnasio.IBTGimnasio.CommitRetaining;
        end;
        //Actividades
        if (Length(Actividades) > 0) then
        begin
          disiplina := 0;
          while (disiplina < Length(Actividades)) do
          begin
            IBQInsertDisiplinas.Close;
            IBQInsertDisiplinas.ParamByName('id_cliente').AsInteger := id;
            IBQInsertDisiplinas.ParamByName('id_disiplina').AsInteger := Actividades[disiplina];
            IBQinsertDisiplinas.Open;
            DMGimnasio.IBTGimnasio.CommitRetaining;
            Inc(disiplina);
          end;
        end;

     ShowMessage('El Cliente ha sido dado de Alta Correctamente');
     Close();
  except
    on e : Exception do
    begin
      DMGimnasio.IBTGimnasio.RollbackRetaining;
      MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message,mtError,[mbOk],0);
    end;
  end;
end;

procedure TFClientesNuevos.BActividadesClick(Sender: TObject);
var
  F : TForm;
  indice, indiceArr : integer;
begin
  inherited;
  F := TFDis.Create(self);
  (F as TFDis).CargarActividades(Actividades);
  F.ShowModal;
  SetLength(Actividades,0);
  if ((F as TFDis).CantidadItems > 0) then
  begin
    indiceArr := 0;
    for indice := 0 to (F as TFDis).CantidadItems-1 do
      if (F as TFDis).CBLDisiplinas.Items.Items[indice].Checked then
      begin
        Inc(indiceArr);
        SetLength(Actividades,indiceArr);
        Actividades[indiceArr-1] := (F as TFDis).IDsActividades[indice];
      end;
  end;
  F.Destroy;
end;

procedure TFClientesNuevos.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

end.
