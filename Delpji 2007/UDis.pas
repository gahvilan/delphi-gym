unit UDis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDatosDB, StdCtrls, cxControls, cxContainer, cxCheckListBox,
  cxDBCheckListBox, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckComboBox, cxDBCheckComboBox, cxLookAndFeelPainters, cxButtons,
  cxLabel;

type
  TArrActividades = Array of Integer;

  TFDis = class(TForm)
    CBLDisiplinas: TcxCheckListBox;
    cxLabel1: TcxLabel;
    BAceptar: TcxButton;
    procedure BAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    CantidadItems : Integer;
    IDsActividades : TArrActividades;
    procedure CargarActividades(Actividades : TArrActividades);
  end;

var
  FDis: TFDis;

implementation

{$R *.dfm}

procedure TFDis.BAceptarClick(Sender: TObject);
begin
  Close();
end;

procedure TFDis.CargarActividades(Actividades : TArrActividades);
var
  indiceIDs, indicePos, pos : Integer;
begin
  if (Length(Actividades)>0) then
  begin
    for indiceIDs := 0 to Length(Actividades)-1 do
    begin
      for indicePos := 0 to Length(IDsActividades)-1 do
        if (Actividades[indiceIDs]=IDsActividades[indicePos]) then
        begin
          pos := indicePos;
          break;
        end;
      CBLDisiplinas.Items.Items[pos].Checked := true;
    end;
  end;
end;

procedure TFDis.FormCreate(Sender: TObject);
var
  indice : integer;
begin
  CantidadItems := 0;
  indice := 0;
  DMGimnasio.IBTDisiplinas.Active := true;
  DMGimnasio.IBTDisiplinas.First;
  SetLength(IDsActividades,indice);
  while not DMGimnasio.IBTDisiplinas.Eof do
  begin
    Inc(indice);
    SetLength(IDsActividades,indice);
    IDsActividades[indice-1] := DMGimnasio.IBTDisiplinas.fieldByName('id_disiplina').AsInteger;
    CBLDisiplinas.Items.Add.Text := DMGimnasio.IBTDisiplinas.fieldByName('nombre').asString;
    CantidadItems := CantidadItems+1;
    DMGimnasio.IBTDisiplinas.Next;
  end;
end;

end.
