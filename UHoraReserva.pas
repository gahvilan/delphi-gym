unit UHoraReserva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit,
  jpeg, ExtCtrls;

type
  TFHora = class(TForm)
    Label1: TLabel;
    TEHora: TcxTimeEdit;
    BAceptar: TcxButton;
    Image1: TImage;
    procedure BAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHora: TFHora;

implementation

{$R *.dfm}

procedure TFHora.BAceptarClick(Sender: TObject);
begin
  Close();
end;

end.
