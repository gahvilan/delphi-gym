unit UMensaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, pngimage;

type
  TFMensaje = class(TFUniversal)
  private
    { Private declarations }
  public
    { Public declarations }
  published
    constructor Create(Sender : TComponent; Mensaje : String); reintroduce;
  end;

var
  FMensaje: TFMensaje;

implementation

{$R *.dfm}

constructor TFmensaje.Create(Sender : TComponent; Mensaje : String);
begin
  inherited Create(Sender);
  LTitulo.Caption := Mensaje;
end;

end.