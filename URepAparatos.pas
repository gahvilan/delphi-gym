unit URepAparatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, cxLookAndFeelPainters,
  cxButtons, DB, IBCustomDataSet, IBQuery, cxTextEdit, cxControls, DateUtils,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, Grids, DBGrids, URepAparatosSueldos,
  pngimage;

type
  TFRepAparatos = class(TFUniversal)
    PFiltros: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CBMes: TcxComboBox;
    cxAnio: TcxTextEdit;
    IBQGetCantidad: TIBQuery;
    DSGetCantidad: TDataSource;
    PBotones: TPanel;
    Image2: TImage;
    BPreview: TcxButton;
    PGrilla: TPanel;
    DBGDatos: TDBGrid;
    IBQGetCantidadNOMBRE: TIBStringField;
    IBQGetCantidadDISIPLINA: TIBStringField;
    IBQGetCantidadTOTAL: TIBBCDField;
    procedure FormCreate(Sender: TObject);
    procedure cxAnioPropertiesChange(Sender: TObject);
    procedure CBMesPropertiesCloseUp(Sender: TObject);
    procedure BPreviewClick(Sender: TObject);
  private
    procedure ActDatos(mes, anio : Integer);
  public
    { Public declarations }
  end;

var
  FRepAparatos: TFRepAparatos;

implementation

{$R *.dfm}

procedure TFRepAparatos.ActDatos(mes, anio : Integer);
begin
  try
    IBQGetCantidad.Close;
    IBQGetCantidad.ParamByName('mes').AsInteger := mes;
    IBQGetCantidad.ParamByName('anio').AsInteger := anio;
    IBQGetCantidad.Open;
  except
  end;
end;

procedure TFRepAparatos.FormCreate(Sender: TObject);
var
  dia, mes, anio : word;
begin
  inherited;
  DecodeDate(Date(),anio,mes,dia);
  CBMes.ItemIndex := mes-1;
  cxAnio.Text := IntToStr(anio);
  ActDatos(mes,anio);
end;

procedure TFRepAparatos.CBMesPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  ActDatos(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;

procedure TFRepAparatos.cxAnioPropertiesChange(Sender: TObject);
begin
  inherited;
  ActDatos(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
end;



procedure TFRepAparatos.BPreviewClick(Sender: TObject);
var
  F : TFRepAparatosSueldos;
begin
  inherited;
  F := TFRepAparatosSueldos.Create(self);
  F.mes := CBMes.ItemIndex+1;
  F.anio := StrToInt(cxAnio.Text);
  F.QRCRComp1.Preview;
  F.Destroy;
end;

end.
