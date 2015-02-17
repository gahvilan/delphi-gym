unit UEstadisticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDatosDB, UUniversal, DB, IBCustomDataSet, IBQuery, MXPIVSRC,
  DBTables, MXTABLES, MXDB, Grids, MXGRID, Mxstore, StdCtrls, jpeg,
  ExtCtrls, IBTable;

type
  TFEstadisticas = class(TFUniversal)
    DCEstadisticas: TDecisionCube;
    DSEstadisticas: TDecisionSource;
    DQEstadisticas: TDecisionQuery;
    Database1: TDatabase;
    IBQuery1: TIBQuery;
    DecisionGrid1: TDecisionGrid;
    IBQuery1COUNT: TIntegerField;
    IBQuery1HORA: TIBStringField;
    IBQuery1NOMBRE: TIBStringField;
    IBQuery1FECHA: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadisticas: TFEstadisticas;

implementation

{$R *.dfm}

procedure TFEstadisticas.FormCreate(Sender: TObject);
begin
  inherited;
  IBQuery1.Close;
  IBQuery1.Open;
end;

end.
