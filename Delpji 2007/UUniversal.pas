unit UUniversal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TFUniversal = class(TForm)
    PEncabezado: TPanel;
    Image1: TImage;
    LTitulo: TLabel;
    Image3: TImage;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FUniversal: TFUniversal;

implementation

{$R *.dfm}

procedure TFUniversal.FormShow(Sender: TObject);
begin
  self.Caption := LTitulo.Caption
end;

end.