unit UPagoCrosfit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, DB, IBCustomDataSet, IBQuery, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxContainer, cxEdit, cxTextEdit, Grids, DBGrids,
  DBCtrls, pngimage;

type
  TFPagoCrossfit = class(TFUniversal)
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DBText1: TDBText;
    DBGrid1: TDBGrid;
    cxApellido: TcxTextEdit;
    cxNombre: TcxTextEdit;
    DEFechaPago: TcxDateEdit;
    PBotones: TPanel;
    Image2: TImage;
    BCancelar: TcxButton;
    BAceptar: TcxButton;
    IBQUltimoPago: TIBQuery;
    DSUltimoPago: TDataSource;
    IBQVerSiIngreso: TIBQuery;
    IBQPago: TIBQuery;
    IBQAparatos: TIBQuery;
    IBQAparatosID_CLIENTE: TIntegerField;
    IBQAparatosNOMBRE: TIBStringField;
    IBQAparatosAPELLIDO: TIBStringField;
    IBQAparatosEDAD: TIntegerField;
    DSAparatos: TDataSource;
    IBQInsertPaga: TIBQuery;
    IBQTipoAparatos: TIBQuery;
    IBQActPago: TIBQuery;
    IBQUltimoPagoFECHA_PAGO: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure cxApellidoPropertiesChange(Sender: TObject);
    procedure cxNombrePropertiesChange(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BCancelarClick(Sender: TObject);
  private
    Apellido, Nombre : String;
    MesPago, AnioPago : Word;
    Disiplina : Integer;
    procedure ActualizarDatos();
  public
    { Public declarations }
  end;

var
  FPagoCrossfit: TFPagoCrossfit;

implementation

uses UPrincipal, UDatosDB;

{$R *.dfm}

procedure TFPagoCrossfit.FormCreate(Sender: TObject);
var
  dia : Word;
begin
  inherited;
  Apellido := '%';
  Nombre := '%';
  DEFechaPago.Date := Date();
  Disiplina := 33;
  ActualizarDatos();
end;

procedure TFPagoCrossfit.ActualizarDatos();
begin
  try
    IBQAparatos.Close;
    IBQAparatos.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
    IBQAparatos.ParamByName('apellido').AsString := Apellido;
    IBQAparatos.ParamByName('nombre').AsString := Nombre;
    IBQAparatos.Open;
  except
  end;
end;

procedure TFPagoCrossfit.cxApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := cxApellido.Text+'%';
  ActualizarDatos();
end;

procedure TFPagoCrossfit.cxNombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := cxNombre.Text+'%';
  ActualizarDatos();
end;

procedure TFPagoCrossfit.BAceptarClick(Sender: TObject);
var
  FechaPago : TDate;
begin
  inherited;
  try
    IBQVerSiIngreso.Close;
    IBQVerSiIngreso.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
    IBQVerSiIngreso.ParamByName('disiplina').AsInteger := Disiplina;
    IBQVerSiIngreso.ParamByName('fecha').AsDate := DEFechaPago.Date;
    IBQVerSiingreso.Open;

    if (IBQVerSiingreso.IsEmpty) then
    begin
      IBQPago.Close;
      IBQPago.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
      IBQPago.ParamByName('fecha_pago').AsDate := DEFechaPago.Date;
      IBQPago.ParamByName('fecha_efectivo').AsDate := Date();
      IBQPago.ParamByName('dis').AsInteger := Disiplina;
      IBQPago.Open;

      IBQInsertPaga.Close;
      IBQInsertPaga.ParamByName('disiplina').AsInteger := Disiplina;
      IBQInsertPaga.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
      IBQInsertPaga.ParamByName('fecha').AsDate := DEFechaPago.Date;
      IBQInsertPaga.ParamByName('hora').AsTime :=Time();
      IBQInsertPaga.Open;
    end
    else
      MessageDlg('Ya se ha registrado el pago para la fecha '+DateToStr(DEFechaPago.Date)+' para este cliente ',mtError,[mbOk],0);

    DMGimnasio.IBTGimnasio.CommitRetaining;
    ActualizarDatos();
    Close();
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

procedure TFPagoCrossfit.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  try
    IBQUltimoPago.Close;
    IBQUltimoPago.ParamByName('cli').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQUltimoPago.Open;
  except
  end;
end;

procedure TFPagoCrossfit.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
