unit URepListadoPilates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Grids, DBGrids, jpeg, ExtCtrls, UPrincipal, DB,
  IBCustomDataSet, IBQuery, UDatosDB, URepListadoPilatesPrev, pngimage;

type
  TFListadoPilates = class(TFUniversal)
    PBotones: TPanel;
    PFiltros: TPanel;
    PDatos: TPanel;
    Image2: TImage;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    DBGClientes: TDBGrid;
    DEFecha: TcxDateEdit;
    BPreliminar: TcxButton;
    BSalir: TcxButton;
    IBQClientes: TIBQuery;
    IBQClientesNOMBRE: TIBStringField;
    IBQClientesAPELLIDO: TIBStringField;
    IBQClientesPRECIO: TFloatField;
    IBQClientesTIPO: TIBStringField;
    DSClientes: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DEFechaPropertiesChange(Sender: TObject);
    procedure BSalirClick(Sender: TObject);
    procedure BPreliminarClick(Sender: TObject);
  private
    fecha : TDate;
    procedure ActConsulta();
  public
    { Public declarations }
  end;

var
  FListadoPilates: TFListadoPilates;

implementation

{$R *.dfm}

procedure TFListadoPilates.FormCreate(Sender: TObject);
begin
  inherited;
  fecha := Date();
  DEFecha.Date := fecha;
  ActConsulta();
end;

procedure TFListadoPilates.ActConsulta();
begin
  IBQClientes.Close;
  IBQClientes.ParamByName('FECHA').AsDate := fecha;
  IBQClientes.Open;
end;

procedure TFListadoPilates.DEFechaPropertiesChange(Sender: TObject);
begin
  inherited;
  fecha := DEFecha.Date;
  ActConsulta();
end;

procedure TFListadoPilates.BSalirClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFListadoPilates.BPreliminarClick(Sender: TObject);
var
  F : TFRepListadoPilates;
begin
  inherited;
  F := TFRepListadoPilates.Create(self);
  F.fecha := fecha;
  F.QuickRep1.Preview;
  F.Destroy;
end;

end.
