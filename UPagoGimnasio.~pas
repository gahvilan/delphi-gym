unit UPagoGimnasio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, DB, IBCustomDataSet,
  Grids, DBGrids, IBQuery, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, UDatosDB, DateUtils, UPrincipal,
  cxMaskEdit, cxDropDownEdit, cxCalendar, DBCtrls, pngimage;

type
  TFPagoGimnasio = class(TFUniversal)
    IBQAparatos: TIBQuery;
    DSAparatos: TDataSource;
    GroupBox1: TGroupBox;
    PBotones: TPanel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    IBQAparatosID_CLIENTE: TIntegerField;
    IBQAparatosNOMBRE: TIBStringField;
    IBQAparatosAPELLIDO: TIBStringField;
    IBQAparatosEDAD: TIntegerField;
    cxApellido: TcxTextEdit;
    Label7: TLabel;
    Label6: TLabel;
    cxNombre: TcxTextEdit;
    IBQInsertPaga: TIBQuery;
    BCancelar: TcxButton;
    BAceptar: TcxButton;
    IBQTipoAparatos: TIBQuery;
    IBQActPago: TIBQuery;
    IBQVerSiIngreso: TIBQuery;
    Label1: TLabel;
    IBQPago: TIBQuery;
    DEFechaPago: TcxDateEdit;
    IBQUltimoPago: TIBQuery;
    Label2: TLabel;
    DBText1: TDBText;
    DSUltimoPago: TDataSource;
    IBQUltimoPagoFECHA_ULTIMO_PAGO: TDateField;
    procedure FormCreate(Sender: TObject);
    procedure cxApellidoPropertiesChange(Sender: TObject);
    procedure cxNombrePropertiesChange(Sender: TObject);
    procedure BCancelarClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    Apellido, Nombre : String;
    MesPago, AnioPago : Word;
    procedure ActualizarDatos();
  public
    { Public declarations }
  end;

var
  FPagoGimnasio: TFPagoGimnasio;

implementation

{$R *.dfm}

procedure TFPagoGimnasio.FormCreate(Sender: TObject);
var
  dia : Word;
begin
  inherited;
  Apellido := '%';
  Nombre := '%';
  DEFechaPago.Date := Date();

  ActualizarDatos();
end;

procedure TFPagoGimnasio.ActualizarDatos();
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

procedure TFPagoGimnasio.cxApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := cxApellido.Text+'%';
  ActualizarDatos();
end;

procedure TFPagoGimnasio.cxNombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := cxNombre.Text+'%';
  ActualizarDatos();
end;

procedure TFPagoGimnasio.BCancelarClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFPagoGimnasio.BAceptarClick(Sender: TObject);
var
  FechaPago : TDate;
begin
  inherited;
  try

    IBQTipoAparatos.Close;
    IBQTipoAparatos.ParamByName('id').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
    IBQTipoAparatos.Open;

    IBQVerSiIngreso.Close;
    IBQVerSiIngreso.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
    IBQVerSiIngreso.ParamByName('disiplina').AsInteger := IBQTipoAparatos.fieldByName('id_disiplina').AsInteger;
    IBQVerSiIngreso.ParamByName('fecha').AsDate := DEFechaPago.Date;
    IBQVerSiingreso.Open;

    if (IBQVerSiingreso.IsEmpty) then
    begin
      IBQPago.Close;
      IBQPago.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
      IBQPago.ParamByName('fecha_pago').AsDate := DEFechaPago.Date;
      IBQPago.ParamByName('fecha_efectivo').AsDate := Date();
      IBQPago.ParamByName('dis').AsInteger := IBQTipoAparatos.fieldByName('id_disiplina').AsInteger;
      IBQPago.Open;

      IBQInsertPaga.Close;
      IBQInsertPaga.ParamByName('disiplina').AsInteger := IBQTipoAparatos.fieldByName('id_disiplina').AsInteger;
      IBQInsertPaga.ParamByName('cliente').AsInteger := DBGrid1.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
      IBQInsertPaga.ParamByName('fecha').AsString := FormatDateTime('dd/mm/yyyy',DEFechaPago.Date);
      IBQInsertPaga.ParamByName('hora').AsString := FormatDateTime('hh:mm',Time());
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

procedure TFPagoGimnasio.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  try
    IBQUltimoPago.Close;
    IBQUltimoPago.ParamByName('cli').AsInteger := IBQAparatos.FieldValues['id_cliente'];
    IBQUltimoPago.Open;
  except
  end;
end;

end.
