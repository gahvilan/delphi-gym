unit UCajaPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, pngimage, StdCtrls, jpeg, ExtCtrls,
  cxLookAndFeelPainters, cxButtons;

type
  TFCajaPreview = class(TFUniversal)
    PBottom: TPanel;
    Image2: TImage;
    BSalir: TcxButton;
    Label1: TLabel;
    LCaja: TLabel;
    procedure BSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    ValorCaja : String;
  end;

var
  FCajaPreview: TFCajaPreview;

implementation

{$R *.dfm}

procedure TFCajaPreview.BSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFCajaPreview.FormShow(Sender: TObject);
begin
  inherited;
  LCaja.Caption := ValorCaja;
end;

end.
