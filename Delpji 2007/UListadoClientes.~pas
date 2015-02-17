unit UListadoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, UPrincipal, DB, UDatosDB,
  IBCustomDataSet, IBQuery, Grids, DBGrids, cxLabel, cxControls, UModificarClientes,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, URepListaClientes,
  Buttons;

type
  TFListadoClientes = class(TFUniversal)
    PListado: TPanel;
    DBGClientes: TDBGrid;
    IBQListadoClientes: TIBQuery;
    DSListadoClientes: TDataSource;
    GBFiltros: TGroupBox;
    TENombre: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    TEApellido: TcxTextEdit;
    TEEdad1: TcxTextEdit;
    cxLabel3: TcxLabel;
    TEEdad2: TcxTextEdit;
    cxLabel4: TcxLabel;
    PBotones: TPanel;
    Image2: TImage;
    BAgregar: TcxButton;
    BModificar: TcxButton;
    BEliminar: TcxButton;
    IBQEliminarCliente: TIBQuery;
    Label1: TLabel;
    BPreliminar: TcxButton;
    procedure IBQListadoClientesBeforeOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure TENombrePropertiesChange(Sender: TObject);
    procedure TEApellidoPropertiesChange(Sender: TObject);
    procedure TEEdadPropertiesChange(Sender: TObject);
    procedure TEEdad2PropertiesChange(Sender: TObject);
    procedure DBGClientesDblClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
    procedure BPreliminarClick(Sender: TObject);
  private
    { Private declarations }
    Nombre, Apellido : String;
    Edad1, Edad2 : Integer;
    procedure ActualizarConsulta();
  public
    { Public declarations }
  end;

var
  FListadoClientes: TFListadoClientes;

implementation

{$R *.dfm}

procedure TFListadoClientes.IBQListadoClientesBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  IBQListadoClientes.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
end;

procedure TFListadoClientes.FormCreate(Sender: TObject);
begin
  inherited;
  Edad1 := 0;
  Edad2 := 100;
  Nombre := '%';
  Apellido := '%';
  ActualizarConsulta();
end;

procedure TFListadoClientes.TENombrePropertiesChange(Sender: TObject);
begin
  inherited;
  Nombre := TENombre.Text+'%';
  ActualizarConsulta();
end;

procedure TFListadoClientes.TEApellidoPropertiesChange(Sender: TObject);
begin
  inherited;
  Apellido := TEApellido.Text+'%';
  ActualizarConsulta();
end;

procedure TFListadoClientes.TEEdadPropertiesChange(Sender: TObject);
begin
  inherited;
  if (TEEdad1.Text = '') then
    Edad1 := 0
  else
    Edad1 := StrToInt(TEEdad1.Text);
  ActualizarConsulta();
end;

procedure TFListadoClientes.ActualizarConsulta();
begin
  IBQlistadoClientes.Close;
  IBQListadoClientes.ParamByName('nombre').AsString := Nombre;
  IBQListadoClientes.ParamByName('apellido').AsString := Apellido;
  IBQListadoClientes.ParamByName('edad1').AsInteger := Edad1;
  IBQListadoClientes.ParamByName('edad2').AsInteger := Edad2;
  IBQListadoClientes.Open;
end;

procedure TFListadoClientes.TEEdad2PropertiesChange(Sender: TObject);
begin
  inherited;
  if (TEEdad2.Text = '') then
    Edad2 := 100
  else
    Edad2 := StrToInt(TEEdad2.Text);
  ActualizarConsulta();
end;

procedure TFListadoClientes.DBGClientesDblClick(Sender: TObject);
var
  F : TFModificarCliente;
begin
  inherited;
  F := TFModificarCliente.Create(self);
  F.idCliente := DBGClientes.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
  F.ShowModal;
  F.Destroy;
  ActualizarConsulta();
end;

procedure TFListadoClientes.BEliminarClick(Sender: TObject);
begin
  inherited;
  try
    IBQEliminarCliente.Close;
    IBQEliminarCliente.ParamByName('id').AsInteger := DBGClientes.DataSource.DataSet.fieldByName('id_cliente').AsInteger;
    IBQEliminarCliente.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    showmessage(' El Cliente ha sido Eliminado');
  except on e : Exception do
    begin
      DMGimnasio.IBTGimnasio.RollbackRetaining;
      MessageDlg('El Cliente tiene datos Relacionados '+#13+e.Message,mtError,[mbOk],0);
    end;
  end;
end;

procedure TFListadoClientes.BPreliminarClick(Sender: TObject);
var
  F : TFRepListaClientes;
begin
  inherited;
  F := TFRepListaClientes.Create(self);
  F.Edad1 := Edad1;
  F.Edad2 := Edad2;
  F.Nombre := Nombre;
  F.Apellido := Apellido;
  F.QuickRep1.Preview;
  F.Destroy;
end;

end.


