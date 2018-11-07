unit Server.Common.Global;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait;

type
  TsmGlobal = class(TDSServerModule)
    qryGlobal: TFDQuery;
    dspUser: TDataSetProvider;
    qryCaptura: TFDQuery;
    dspCaptura: TDataSetProvider;
    procedure DSServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CheckCode(sCode, sTable: string): boolean;
    function CheckFolio(iFolio: integer; sTable: string): boolean;
    function GetById(sId, sTable: string): TDataSet;
    function GetByCode(sCode, sTable: string): TDataSet;
    function GetByField(sTable, sFields, sField ,sName: string): TDataSet;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses Server.Core.Container;

{$R *.dfm}

{ TsmGlobal }

procedure TsmGlobal.DSServerModuleCreate(Sender: TObject);
begin
  qryGlobal.Connection:= smContainer.GetConnection;
  qryCaptura.Connection:= smContainer.GetConnection;
end;

function TsmGlobal.CheckCode(sCode, sTable: string): boolean;
begin
  with qryGlobal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id' + sTable + ' from ' + sTable + ' where code = :code');
    ParamByName('code').AsString:= sCode;
    Open;
    Exit(not IsEmpty);
  end;
end;

function TsmGlobal.CheckFolio(iFolio: integer; sTable: string): boolean;
begin
  with qryGlobal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select id' + sTable + ' from ' + sTable + ' where folio = :folio');
    ParamByName('folio').AsInteger:= iFolio;
    Open;
    Exit(not IsEmpty);
  end;
end;

function TsmGlobal.GetByCode(sCode, sTable: string): TDataSet;
begin
  with qryGlobal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from ' + sTable);
    SQL.Add('where code = :code');
    SQL.Add('order by code');
    ParamByName('code').AsString:= sCode;
    Open;
  end;
  Exit(qryGlobal);
end;

function TsmGlobal.GetById(sId, sTable: string): TDataSet;
begin
  with qryGlobal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select code, name from ' + sTable);
    SQL.Add('where id' + sTable + ' = :id' + sTable);
    ParamByName('id' + sTable).AsString:= sId;
    Open;
  end;
  Exit(qryGlobal);
end;

function TsmGlobal.GetByField(sTable, sFields, sField ,sName: string): TDataSet;
begin
  with qryGlobal do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ' + sFields + ' from ' + sTable);
    SQL.Add('where ' + sField + ' like :' + sField);
    SQL.Add('order by code');
    ParamByName(sField).AsString:= '%' + sName + '%';
    Open;
  end;
  Exit(qryGlobal);
end;

end.

