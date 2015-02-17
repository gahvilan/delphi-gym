unit UResumenMensual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, URepResumenMensual,
  cxLookAndFeelPainters, cxButtons, Grids, DBGrids, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, UDatosDB, DB,
  IBCustomDataSet, IBStoredProc, IBQuery, pngimage;

type
  TFResumenMensual = class(TFUniversal)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image2: TImage;
    BPreliminar: TcxButton;
    BSalida: TcxButton;
    CBMes: TcxComboBox;
    cxAnio: TcxTextEdit;
    Label3: TLabel;
    Label2: TLabel;
    DBGDatos: TDBGrid;
    DSArmarReporte: TDataSource;
    IBQArmarReporte: TIBQuery;
    IBQArmarReporteINGRESO: TIBStringField;
    IBQArmarReporteDISIPLINA: TIBStringField;
    IBQArmarReporteSALDO: TIBBCDField;
    procedure BPreliminarClick(Sender: TObject);
    procedure BSalidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CBMesPropertiesCloseUp(Sender: TObject);
    procedure cxAnioPropertiesChange(Sender: TObject);
  private
    procedure ActConsulta(Mes, Anio : Integer);
  public
    { Public declarations }
  end;

var
  FResumenMensual: TFResumenMensual;

implementation

{$R *.dfm}

procedure TFResumenMensual.ActConsulta(Mes, Anio : Integer);
begin
  try
    IBQArmarReporte.Close;
    IBQArmarReporte.ParamByName('mes').AsInteger := Mes;
    IBQArmarReporte.ParamByName('anio').AsInteger := Anio;
    IBQArmarReporte.ParamByName('tipo').AsInteger := 1;
    IBQArmarReporte.Open;
  except
  end;
end;


procedure TFResumenMensual.BPreliminarClick(Sender: TObject);
var
  F : TFRepResumenMensual;
begin
  inherited;
  F := TFRepResumenMensual.Create(self);
  F.mes := CBMes.ItemIndex+1;
  F.anio := StrToInt(cxAnio.Text);
  F.QuickRep1.Preview;
  F.Destroy;
end;

procedure TFResumenMensual.BSalidaClick(Sender: TObject);
begin
  inherited;
  Close();
end;

procedure TFResumenMensual.FormCreate(Sender: TObject);
var
  dia, mes, anio : word;
begin
  inherited;
  DecodeDate(Date(),anio,mes,dia);
  CBMes.ItemIndex := mes-1;
  cxAnio.Text := IntToStr(anio);
  ActConsulta(mes,anio);
end;

procedure TFResumenMensual.CBMesPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  ActConsulta(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;

procedure TFResumenMensual.cxAnioPropertiesChange(Sender: TObject);
begin
  inherited;
  ActConsulta(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;

end.
