unit Common.Data.Master;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Core.Data.Base;

type
  TdmMaster = class(TdmBase)
    dspMaster: TDSProviderConnection;
    cdsMaster: TClientDataSet;
    procedure cdsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsPost(DataSet: TDataSet);
  private
    procedure AssignEvents;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses RecError, Main.Data.Global;

{$R *.dfm}

procedure TdmMaster.cdsReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action:= HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TdmMaster.DataModuleCreate(Sender: TObject);
begin
  inherited;
  AssignEvents;
end;

procedure TdmMaster.AssignEvents;
var
  i: integer;
  cds: TClientDataSet;
begin
  for i:= 0 to Pred(ComponentCount) do
    if Components[i] is TClientDataset then
    begin
      cds:= (Components[i] as TClientDataSet);
      with cds do
      begin
        if cds.Tag = 0 then
        begin
          OnNewRecord:= cdsNewRecord;
          AfterPost:= cdsPost;
          AfterDelete:= cdsPost;
          OnReconcileError:= cdsReconcileError;
          Open;
        end;
      end;
    end;
end;

procedure TdmMaster.cdsPost(DataSet: TDataSet);
var
  cds: TClientDataSet;
begin
  cds:= (DataSet as TClientDataSet);
  if not Assigned(cds.DataSetField) then
    cds.ApplyUpdates(0);
end;

procedure TdmMaster.cdsNewRecord(DataSet: TDataSet);
var
  cds: TClientDataSet;
begin
  cds:= (DataSet as TClientDataSet);
  if Assigned(cds.DataSetField) then
    cds.FieldByName('ID' + StringReplace(cds.Name, 'cds', EmptyStr, [])).
      AsString:= dmGlobal.GetGuid
  else
    cds.FieldByName('ID' + StringReplace(Name, 'dm', EmptyStr, [])).
      AsString:= dmGlobal.GetGuid;
end;

end.
