unit URepHorasProfesor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, UDatosDB,
  DBCtrls, DB, IBCustomDataSet, IBQuery, ComCtrls;

type
  TFRepHorasProfesor = class(TFUniversal)
    PFiltros: TPanel;
    PGrilla: TPanel;
    PBotones: TPanel;
    Image2: TImage;
    DBGDatos: TDBGrid;
    DBLCBProfesor: TDBLookupComboBox;
    IBQProfesores: TIBQuery;
    DSPersonal: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DTPDesde: TDateTimePicker;
    DTPHasta: TDateTimePicker;
    IBQGetCantidad: TIBQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRepHorasProfesor: TFRepHorasProfesor;

implementation

{$R *.dfm}

procedure TFRepHorasProfesor.FormCreate(Sender: TObject);
begin
  inherited;
  IBQProfesores.Close;
  IBQProfesores.Open;
end;

end.