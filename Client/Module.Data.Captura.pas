unit Module.Data.Captura;

interface

uses
  System.SysUtils, System.Classes, Common.Data.Master, frxClass, frxDBSet,
  frxExportPDF, frxExportBaseDialog, frxExportXLS, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TdmCaptura = class(TdmMaster)
    cdsDocs: TClientDataSet;
    cdsDocsFOLIO: TStringField;
    cdsDocsETAPA: TIntegerField;
    cdsDocsDOC: TBlobField;
    cdsDocsIDCAPTURA: TStringField;
    cdsDocsNAME: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsDocsAfterInsert(DataSet: TDataSet);
  private
    procedure ConsultById;
    procedure Consult;
    { Private declarations }
  public
    { Public declarations }
    function Cambios: boolean;
    procedure Cargar(FileName: String);
    procedure Siguiente;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Main.Data.Global;

{$R *.dfm}

{ TdmCaptura }

procedure TdmCaptura.DataModuleCreate(Sender: TObject);
begin
  inherited;
  ConsultById;
  Consult;
end;

function TdmCaptura.Cambios: boolean;
begin
  Exit(cdsDocs.State in dsEditModes);
end;

procedure TdmCaptura.Cargar(FileName: String);
begin
  cdsDocs.Edit;
  cdsDocsNAME.AsString:= ExtractFileName(FileName);
  cdsDocsDOC.LoadFromFile(FileName);
end;

procedure TdmCaptura.cdsDocsAfterInsert(DataSet: TDataSet);
begin
  cdsDocs.FieldByName('FOLIO').AsString:= cdsMaster.FieldByName('FOLIO').AsString;
  cdsDocs.FieldByName('ETAPA').AsInteger:= cdsMaster.FieldByName('ETAPA').AsInteger;
end;

procedure TdmCaptura.ConsultById;
begin
  with cdsMaster do
  begin
    Close;
    ParamByName('FOLIO').AsString:= dmGlobal.cdsCaptura.FieldByName('FOLIO').AsString;
    Open;
  end;
end;

procedure TdmCaptura.Consult;
begin
  with cdsDocs do
  begin
    Close;
    ParamByName('FOLIO').AsString:= dmGlobal.cdsCaptura.FieldByName('FOLIO').AsString;
    ParamByName('ETAPA').AsInteger:= dmGlobal.cdsCaptura.FieldByName('ETAPA').AsInteger;
    Open;
  end;
end;

procedure TdmCaptura.Siguiente;
begin
  with cdsMaster do
  begin
    Edit;
    FieldByName('ETAPA').AsInteger:= FieldByName('ETAPA').AsInteger + 1;
    Post;
  end;
end;

initialization
  RegisterClass(TdmCaptura);

end.
