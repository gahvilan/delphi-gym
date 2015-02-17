unit UCronograma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UUniversal, StdCtrls, jpeg, ExtCtrls, DBCtrls, cxSpinEdit,
  cxTimeEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, UDatosDB, PlannerMonthView, DBPlannerMonthView, UPrincipal,
  Planner, DBPlanner, cxLookAndFeelPainters, cxButtons, DB, DateUtils,
  IBCustomDataSet, IBQuery, pngimage;

type
  TFCronograma = class(TFUniversal)
    PCrono: TPanel;
    PCalendario: TPlanner;
    PIngreso: TPanel;
    PMes: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CBMes: TcxComboBox;
    CBDia: TcxComboBox;
    TEHora: TcxTimeEdit;
    DBLCBPersonal: TDBLookupComboBox;
    DBLCBDisiplina: TDBLookupComboBox;
    cxAnio: TcxTextEdit;
    BAgregar: TcxButton;
    IBQInsert: TIBQuery;
    CBMes1: TcxComboBox;
    Label7: TLabel;
    TEAnio1: TcxTextEdit;
    Label8: TLabel;
    BAceptar: TcxButton;
    IBQBuscarMes: TIBQuery;
    IBQEliminarClase: TIBQuery;
    BEliminar: TcxButton;
    cxButton1: TcxButton;
    Image2: TImage;
    PDCalendario: TPrintDialog;
    procedure FormCreate(Sender: TObject);
    procedure BAgregarClick(Sender: TObject);
    procedure BAceptarClick(Sender: TObject);
    procedure BEliminarClick(Sender: TObject);
    procedure PCalendarioItemSelect(Sender: TObject; Item: TPlannerItem);
    procedure PCalendarioItemExit(Sender: TObject; Item: TPlannerItem);
    procedure cxButton1Click(Sender: TObject);
  private
    Hoy : TDate;
    Ahora : TTime;
    Clase : TPlannerItem;
  public
    procedure PintarDetalle(Mes, Anio : Integer);
  end;

var
  FCronograma: TFCronograma;

implementation

{$R *.dfm}

procedure TFCronograma.FormCreate(Sender: TObject);
var
  dia, mes, anio : word;
begin
  inherited;
  DMGimnasio.IBQActividades.Close;
  DMGimnasio.IBQActividades.ParamByName('esta').AsInteger := FPrincipal.Establecimiento;
  DMGimnasio.IBQActividades.Open;
  DMGimnasio.IBTPersonal.Active := true;

  Hoy := Date();
  Ahora := Time();
  DecodeDate(Hoy,anio,mes,dia);

  CBMes1.ItemIndex := mes-1;
  TEAnio1.Text := IntToStr(anio);

  PintarDetalle(mes,anio);
end;

procedure TFCronograma.BAgregarClick(Sender: TObject);
begin
  inherited;
  try
    IBQInsert.Close;
    IBQinsert.ParamByName('id_profe').Value := DBLCBPersonal.KeyValue;
    IBQInsert.ParamByName('id_clase').Value := DBLCBDisiplina.KeyValue;
    IBQInsert.ParamByName('dia').AsInteger := CBDia.ItemIndex+1;
    IBQInsert.ParamByName('mes').AsInteger := CBMes.ItemIndex+1;
    IBQInsert.ParamByName('anio').AsInteger := StrToInt(cxAnio.Text);
    IBQInsert.ParamByName('hora').AsString := FormatDateTime('hh:mm',TEHora.Time);
    IBQInsert.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    PintarDetalle(CBMes.ItemIndex+1,StrToInt(cxAnio.Text));
  except
    DMGimnasio.IBTGimnasio.CommitRetaining;
  end;
end;

procedure TFCronograma.PintarDetalle(Mes, Anio : Integer);
var
  Item, dia : Integer;
  hora1, hora2 : TTime;
  Profe, Disiplina : String;
begin
  Item := 0;
  IBQBuscarMes.Close;
  IBQBuscarMes.ParamByName('mes').AsInteger := Mes;
  IBQBuscarMes.ParamByName('anio').AsInteger := Anio;
  IBQBuscarMes.Open;
  IBQBuscarMes.First;
  PCalendario.Items.Clear;
  while not IBQBuscarMes.Eof do
  begin
    dia := IBQBuscarMes.fieldByName('dia').AsInteger;
    hora1 := StrToTime(IBQBuscarMes.fieldByName('hora').AsString);
    Profe := IBQBuscarMes.fieldByName('nombre').AsString;
    Disiplina := IBQBuscarMes.fieldByName('disiplina').AsString;
    PCalendario.Items.Add.Index := item;
    hora2 := IncHour(hora1,1);
    PCalendario.Items.Items[Item].Text.Add(Profe);
    PCalendario.Items.Items[Item].Text.Add(Disiplina);
    PCalendario.Items.Items[Item].ItemStartTime := hora1;
    PCalendario.Items.Items[item].ItemEndTime := hora2;
    Pcalendario.Items.Items[Item].ItemPos := dia-1;
    Inc(Item);
    IBQBuscarMes.Next;
  end;
end;

procedure TFCronograma.BAceptarClick(Sender: TObject);
begin
  inherited;
  PintarDetalle(CBMes1.ItemIndex+1,StrToInt(TEAnio1.Text));
end;

procedure TFCronograma.BEliminarClick(Sender: TObject);
begin
  inherited;
  cbMes.ItemIndex := cbMes1.ItemIndex;
  cxAnio.Text := TEAnio1.Text;
  TEHora.Time := Clase.ItemStartTime;
  try
    IBQEliminarClase.Close;
    IBQEliminarClase.ParamByName('anio').asInteger := StrToInt(cxAnio.Text);
    IBQEliminarClase.ParamByName('mes').AsInteger := cbMes.ItemIndex+1;
    IBQEliminarClase.ParamByName('hora').AsString := FormatDateTime('hh:mm',Clase.ItemStartTime);
    IBQEliminarClase.ParamByName('dia').AsInteger := Clase.ItemPos+1;
    IBQEliminarClase.Open;
    DMGimnasio.IBTGimnasio.CommitRetaining;
    PintarDetalle(CBMes1.ItemIndex+1,StrToInt(TEAnio1.Text));
  except
    DMGimnasio.IBTGimnasio.RollbackRetaining;
  end;
end;

procedure TFCronograma.PCalendarioItemSelect(Sender: TObject;
  Item: TPlannerItem);
begin
  inherited;
  BEliminar.Enabled := true;
  Clase := Item;
end;

procedure TFCronograma.PCalendarioItemExit(Sender: TObject;
  Item: TPlannerItem);
begin
  inherited;
  BEliminar.Enabled := false;
end;

procedure TFCronograma.cxButton1Click(Sender: TObject);
begin
  inherited;
  if (PDCalendario.Execute) then
    Pcalendario.Print;    
end;

end.
