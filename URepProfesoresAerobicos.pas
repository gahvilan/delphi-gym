unit URepProfesoresAerobicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, UDatosDB,
  DBCtrls, DB, IBCustomDataSet, IBQuery, ComCtrls, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, DateUtils, URepSueldoAerobicos,
  cxLookAndFeelPainters, cxButtons, TeEngine, Series, TeeProcs, Chart,
  DbChart, pngimage;

type
  TFRepProfesoresAerobicos = class(TFUniversal)
    PGrilla: TPanel;
    PBotones: TPanel;
    Image2: TImage;
    DBGDatos: TDBGrid;
    IBQGetCantidad: TIBQuery;
    IBQGetCantidadPROFESOR: TIBStringField;
    IBQGetCantidadDISIPLINA: TIBStringField;
    IBQGetCantidadCANT_CLASES: TIntegerField;
    DSGetCantidad: TDataSource;
    IBQGetCantidadSUELDO_MENSUAL: TIBBCDField;
    BPreview: TcxButton;
    PFiltros: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CBMes: TcxComboBox;
    cxAnio: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure CBMesPropertiesCloseUp(Sender: TObject);
    procedure cxAnioPropertiesChange(Sender: TObject);
    procedure BPreviewClick(Sender: TObject);
  private
    procedure ActDatos(mes, anio : Integer);
  public
    { Public declarations }
  end;

var
  FRepProfesoresAerobicos: TFRepProfesoresAerobicos;

implementation

{$R *.dfm}

procedure TFRepProfesoresAerobicos.ActDatos(mes, anio : Integer);
begin
  try
    IBQGetCantidad.Close;
    IBQGetCantidad.ParamByName('mes').AsInteger := mes;
    IBQGetCantidad.ParamByName('anio').AsInteger := anio;
    IBQGetCantidad.Open;
  except
  end;
end;

procedure TFRepProfesoresAerobicos.FormCreate(Sender: TObject);
var
  dia, mes, anio : word;
begin
  inherited;
  DecodeDate(Date(),anio,mes,dia);
  CBMes.ItemIndex := mes-1;
  cxAnio.Text := IntToStr(anio);
  ActDatos(mes,anio);
end;

procedure TFRepProfesoresAerobicos.CBMesPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  ActDatos(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;

procedure TFRepProfesoresAerobicos.cxAnioPropertiesChange(Sender: TObject);
begin
  inherited;
  ActDatos(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;

procedure TFRepProfesoresAerobicos.BPreviewClick(Sender: TObject);
var
  F : TFRepSueldoAerobicos;
begin
  inherited;
  F := TFRepSueldoAerobicos.Create(self);
  F.QRLMes.Caption := IntToStr(CBMes.ItemIndex+1);
  F.QRLAnio.Caption := cxAnio.Text;
  F.QRCRSueldos.Preview;
  F.Destroy;
end;

end.
