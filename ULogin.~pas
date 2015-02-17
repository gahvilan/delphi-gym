unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, UDatosDB, DB,
  IBCustomDataSet, IBQuery, UPrincipal, pngimage;

type
  TFLogin = class(TFUniversal)
    PBotones: TPanel;
    Image2: TImage;
    PIngreso: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    TEPassword: TcxTextEdit;
    TEusuario: TcxTextEdit;
    BIngreso: TcxButton;
    BSalir: TcxButton;
    Image4: TImage;
    IBQCheckUsuario: TIBQuery;
    IBQCheckUsuarioNOMBRE: TIBStringField;
    IBQCheckUsuarioROL: TIBStringField;
    IBQCheckUsuarioPROFE: TIBStringField;
    procedure BIngresoClick(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TEPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

procedure TFLogin.BIngresoClick(Sender: TObject);
begin
  inherited;
  try
    IBQCheckUsuario.Close;
    IBQCheckUsuario.ParamByName('usuario').AsString := TEUsuario.Text;
    IBQCheckUsuario.ParamByName('pass').AsString := TEPassword.Text;
    IBQCheckUsuario.ParamByName('esta').AsInteger := Fprincipal.Establecimiento;
    IBQCheckUsuario.Open;
    if (IBQCheckUsuario.IsEmpty) then
      MessageDlg('Nombre de Usuario o Contraseña Incorrecto',mtError,[mbOk],0)
    else
    begin
      FPrincipal.Usuario := IBQCheckUsuario.fieldByName('nombre').AsString;
      FPrincipal.Rol := IBQCheckUsuario.fieldByName('rol').AsString;
      FPrincipal.Profesor := IBQCheckUsuario.fieldByName('Profe').AsString;
      Close();
    end;
  except on e : Exception do
      MessageDlg('Se ha producido un error en la Base de Datos'+#13+e.Message,mtError,[mbOk],0);
  end;
end;

procedure TFLogin.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  inherited;
  FPrincipal.Usuario := 'N';
  FPrincipal.Rol := 'N';
end;

procedure TFLogin.TEPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    BIngreso.Click;  
end;

end.
