unit Common.Data.Module;

interface

uses
  System.SysUtils, System.Classes, Common.Data.Master, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, frxExportPDF, frxClass, frxExportBaseDialog, frxExportXLS,
  frxDBSet;

type
  TdmModule = class(TdmMaster)
    frxXLSExport: TfrxXLSExport;
    frxPDFExport: TfrxPDFExport;
    cdsConsult: TClientDataSet;
    frxConsult: TfrxReport;
    fdsConsult: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
  private
    FFiltering: boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure Consult(ini, fin: TDate);
    procedure ConsultById;
    procedure Print(filtro: string);
  published
    property Filtering: boolean read FFiltering write FFiltering;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main.Data.Global;

{$R *.dfm}

{ TdmModule }

procedure TdmModule.Consult(ini, fin: TDate);
begin
  with cdsConsult do
  begin
    Close;
    ParamByName('INI').AsDate:= ini;
    ParamByName('FIN').AsDate:= fin + 1;
    Open;
  end;
end;

procedure TdmModule.ConsultById;
var
  sTableId: String;
begin
  sTableId:= StringReplace(Name, 'dm', 'ID', []);
  with cdsMaster do
  begin
    Close;
    ParamByName(sTableId).AsString:= cdsConsult.FieldByName(sTableId).AsString;
    Open;
  end;
end;

procedure TdmModule.DataModuleCreate(Sender: TObject);
begin
  FFiltering:= True;
  with cdsConsult do
  begin
    ParamByName('INI').AsDate:= dmGlobal.FirstDayOfMonth(Date);
    ParamByName('FIN').AsDate:= dmGlobal.LastDayOfMonth(Date);
  end;
  inherited;
  cdsMaster.Insert;
end;

procedure TdmModule.Print(filtro: string);
begin
  if FFiltering then
    with cdsConsult do
    begin
      DisableControls;
      Filtered:= true;
      Filter:= filtro;
    end;
  with frxConsult do
  begin
    if PrepareReport then
      ShowPreparedReport;
  end;
  if FFiltering then
    with cdsConsult do
    begin
      Filter:= EmptyStr;
      Filtered:= false;
      EnableControls;
    end;
end;

end.
