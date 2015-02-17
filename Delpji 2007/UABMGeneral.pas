unit UABMGeneral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, ExtCtrls, UDatosDB, DB, IBCustomDataSet,
  dxMasterView, StdCtrls, Buttons, Grids, DBGrids, IBTable, jpeg, IBQuery,
  cxLookAndFeelPainters, cxButtons;

type

  TModo = (mInsertar, mEditar);

  TFABMGeneral = class(TFUniversal)
    PBotones: TPanel;
    PGrilla: TPanel;
    PDatos: TPanel;
    DBGDatosGenerales: TDBGrid;
    IBQInsert: TIBQuery;
    IBQModificar: TIBQuery;
    Image2: TImage;
    BInsertar: TcxButton;
    BEliminar: TcxButton;
    BModificar: TcxButton;
    BAceptar: TcxButton;
    BGuardar: TcxButton;
    BCancelar: TcxButton;
    BDeshacer: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure BModificarClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BInsertarClick(Sender: TObject);
    procedure BGuardarClick(Sender: TObject);
    procedure BDeshacerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    Modo : TModo;
    procedure CargarParametrosInsertar(); virtual;
    procedure CargarParametrosModificacion(); virtual; 
  end;

var
  FABMGeneral: TFABMGeneral;

implementation

{$R *.dfm}

procedure TFABMGeneral.FormCreate(Sender: TObject);
begin
  inherited;
  PGrilla.Align := alClient;
  PDatos.Visible := false;
  BGuardar.Visible := false;
  BDeshacer.Visible := false;
end;

procedure TFABMGeneral.BModificarClick(Sender: TObject);
begin
  inherited;
  PDatos.Visible := true;
  PDatos.Align := alClient;
  PGrilla.Visible := false;
  BModificar.Visible := false;
  BInsertar.Visible := false;
  BEliminar.Visible := false;
  BGuardar.Visible := true;
  BDeshacer.Visible := true;
  BAceptar.Visible := false;
  BCancelar.Visible := false;
  Modo := mEditar;
end;

procedure TFABMGeneral.BAceptarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTGimnasio.CommitRetaining;
  Close();
end;

procedure TFABMGeneral.BCancelarClick(Sender: TObject);
begin
  inherited;
  DMGimnasio.IBTGimnasio.RollbackRetaining;
  Close();
end;

procedure TFABMGeneral.BInsertarClick(Sender: TObject);
begin
  inherited;
  PDatos.Visible := true;
  PDatos.Align := alClient;
  PGrilla.Visible := false;
  BModificar.Visible := false;
  BInsertar.Visible := false;
  BEliminar.Visible := false;
  BGuardar.Visible := true;
  BDeshacer.Visible := true;
  BAceptar.Visible := false;
  BCancelar.Visible := false;
  Modo := mInsertar;
end;

procedure TFABMGeneral.BGuardarClick(Sender: TObject);
begin
  inherited;
  if (modo = mInsertar) then
  begin
    try
      IBQInsert.Close;
      CargarParametrosInsertar();
      IBQInsert.Open;
      DMGimnasio.IBTGimnasio.CommitRetaining;
    except
      on e : Exception do
      begin
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message,mtError,[mbOk],0);
        DMGimnasio.IBTGimnasio.RollbackRetaining;
      end;
    end;
  end;
  if (modo = mEditar) then
  begin
    try
      IBQModificar.Close;
      CargarParametrosModificacion();
      IBQModificar.Open;
      DMGimnasio.IBTGimnasio.CommitRetaining;
    except
      on e : Exception do
      begin
        MessageDlg('Se ha Producido un Error en la Base de Datos: '+#13+e.Message,mtError,[mbOk],0);
        DMGimnasio.IBTGimnasio.RollbackRetaining;
      end;
    end;
  end;
  PGrilla.Visible := true;
  PDatos.Visible := false;
  PGrilla.Align := alClient;
  BModificar.Visible := true;
  BInsertar.Visible := true;
  BEliminar.Visible := true;
  BGuardar.Visible := false;
  BDeshacer.Visible := false;
  BAceptar.Visible := true;
  BCancelar.Visible := true;
end;

procedure TFABMGeneral.BDeshacerClick(Sender: TObject);
begin
  inherited;
  PGrilla.Visible := true;
  PDatos.Visible := false;
  PGrilla.Align := alClient;
  BModificar.Visible := true;
  BInsertar.Visible := true;
  BEliminar.Visible := true;
  BGuardar.Visible := false;
  BDeshacer.Visible := false;
  BAceptar.Visible := true;
  BCancelar.Visible := true;
end;

{Este metodo lo redefine cada uno de los q heredan}
procedure TFABMGeneral.CargarParametrosInsertar();
begin
end;

{Este metodo lo redefine cada uno de los q heredan}
procedure TFABMGeneral.CargarParametrosModificacion();
begin
end;

end.
